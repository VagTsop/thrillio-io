-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema jid_thrillio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema jid_thrillio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `jid_thrillio` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `jid_thrillio` ;

-- -----------------------------------------------------
-- Table `jid_thrillio`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jid_thrillio`.`actor` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `jid_thrillio`.`author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jid_thrillio`.`author` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `jid_thrillio`.`publisher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jid_thrillio`.`publisher` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `jid_thrillio`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jid_thrillio`.`user` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NOT NULL,
  `gender_id` TINYINT(4) NULL DEFAULT NULL,
  `user_type_id` TINYINT(4) NULL DEFAULT NULL,
  `created_date` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `jid_thrillio`.`book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jid_thrillio`.`book` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(500) NOT NULL,
  `image_url` VARCHAR(500) NULL DEFAULT NULL,
  `publication_year` INT(11) NULL DEFAULT NULL,
  `publisher_id` BIGINT(20) NULL DEFAULT NULL,
  `book_genre_id` TINYINT(4) NULL DEFAULT NULL,
  `amazon_rating` DOUBLE NULL DEFAULT NULL,
  `kid_friendly_status` TINYINT(4) NULL DEFAULT NULL,
  `kid_friendly_marked_by` BIGINT(20) NULL DEFAULT NULL,
  `shared_by` BIGINT(20) NULL DEFAULT NULL,
  `created_date` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `title` (`title`(250) ASC, `publication_year` ASC, `publisher_id` ASC) VISIBLE,
  INDEX `publisher_id` (`publisher_id` ASC) VISIBLE,
  INDEX `kid_friendly_marked_by` (`kid_friendly_marked_by` ASC) VISIBLE,
  INDEX `shared_by` (`shared_by` ASC) VISIBLE,
  CONSTRAINT `book_ibfk_1`
    FOREIGN KEY (`publisher_id`)
    REFERENCES `jid_thrillio`.`publisher` (`id`),
  CONSTRAINT `book_ibfk_2`
    FOREIGN KEY (`kid_friendly_marked_by`)
    REFERENCES `jid_thrillio`.`user` (`id`),
  CONSTRAINT `book_ibfk_3`
    FOREIGN KEY (`shared_by`)
    REFERENCES `jid_thrillio`.`user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `jid_thrillio`.`book_author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jid_thrillio`.`book_author` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `book_id` BIGINT(20) NOT NULL,
  `author_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `book_id` (`book_id` ASC, `author_id` ASC) VISIBLE,
  INDEX `author_id` (`author_id` ASC) VISIBLE,
  CONSTRAINT `book_author_ibfk_1`
    FOREIGN KEY (`book_id`)
    REFERENCES `jid_thrillio`.`book` (`id`),
  CONSTRAINT `book_author_ibfk_2`
    FOREIGN KEY (`author_id`)
    REFERENCES `jid_thrillio`.`author` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `jid_thrillio`.`director`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jid_thrillio`.`director` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `jid_thrillio`.`movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jid_thrillio`.`movie` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(500) NOT NULL,
  `release_year` INT(11) NULL DEFAULT NULL,
  `movie_genre_id` TINYINT(4) NULL DEFAULT NULL,
  `imdb_rating` DOUBLE NULL DEFAULT NULL,
  `kid_friendly_status` TINYINT(4) NULL DEFAULT NULL,
  `kid_friendly_marked_by` BIGINT(20) NULL DEFAULT NULL,
  `created_date` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `title` (`title`(100) ASC, `release_year` ASC) VISIBLE,
  INDEX `kid_friendly_marked_by` (`kid_friendly_marked_by` ASC) VISIBLE,
  CONSTRAINT `movie_ibfk_1`
    FOREIGN KEY (`kid_friendly_marked_by`)
    REFERENCES `jid_thrillio`.`user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `jid_thrillio`.`movie_actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jid_thrillio`.`movie_actor` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `movie_id` BIGINT(20) NOT NULL,
  `actor_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `movie_id` (`movie_id` ASC, `actor_id` ASC) VISIBLE,
  INDEX `actor_id` (`actor_id` ASC) VISIBLE,
  CONSTRAINT `movie_actor_ibfk_1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `jid_thrillio`.`movie` (`id`),
  CONSTRAINT `movie_actor_ibfk_2`
    FOREIGN KEY (`actor_id`)
    REFERENCES `jid_thrillio`.`actor` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `jid_thrillio`.`movie_director`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jid_thrillio`.`movie_director` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `movie_id` BIGINT(20) NOT NULL,
  `director_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `movie_id` (`movie_id` ASC, `director_id` ASC) VISIBLE,
  INDEX `director_id` (`director_id` ASC) VISIBLE,
  CONSTRAINT `movie_director_ibfk_1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `jid_thrillio`.`movie` (`id`),
  CONSTRAINT `movie_director_ibfk_2`
    FOREIGN KEY (`director_id`)
    REFERENCES `jid_thrillio`.`director` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `jid_thrillio`.`user_book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jid_thrillio`.`user_book` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT(20) NOT NULL,
  `book_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  INDEX `book_id` (`book_id` ASC) VISIBLE,
  CONSTRAINT `user_book_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `jid_thrillio`.`user` (`id`),
  CONSTRAINT `user_book_ibfk_2`
    FOREIGN KEY (`book_id`)
    REFERENCES `jid_thrillio`.`book` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 51
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `jid_thrillio`.`user_movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jid_thrillio`.`user_movie` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT(20) NOT NULL,
  `movie_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  INDEX `movie_id` (`movie_id` ASC) VISIBLE,
  CONSTRAINT `user_movie_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `jid_thrillio`.`user` (`id`),
  CONSTRAINT `user_movie_ibfk_2`
    FOREIGN KEY (`movie_id`)
    REFERENCES `jid_thrillio`.`movie` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 54
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `jid_thrillio`.`weblink`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jid_thrillio`.`weblink` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(500) NOT NULL,
  `url` VARCHAR(250) NOT NULL,
  `host` VARCHAR(250) NOT NULL,
  `kid_friendly_status` TINYINT(4) NULL DEFAULT NULL,
  `kid_friendly_marked_by` BIGINT(20) NULL DEFAULT NULL,
  `shared_by` BIGINT(20) NULL DEFAULT NULL,
  `created_date` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `url` (`url`(200) ASC) VISIBLE,
  INDEX `kid_friendly_marked_by` (`kid_friendly_marked_by` ASC) VISIBLE,
  INDEX `shared_by` (`shared_by` ASC) VISIBLE,
  CONSTRAINT `weblink_ibfk_1`
    FOREIGN KEY (`kid_friendly_marked_by`)
    REFERENCES `jid_thrillio`.`user` (`id`),
  CONSTRAINT `weblink_ibfk_2`
    FOREIGN KEY (`shared_by`)
    REFERENCES `jid_thrillio`.`user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `jid_thrillio`.`user_weblink`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jid_thrillio`.`user_weblink` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT(20) NOT NULL,
  `weblink_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  INDEX `weblink_id` (`weblink_id` ASC) VISIBLE,
  CONSTRAINT `user_weblink_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `jid_thrillio`.`user` (`id`),
  CONSTRAINT `user_weblink_ibfk_2`
    FOREIGN KEY (`weblink_id`)
    REFERENCES `jid_thrillio`.`weblink` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 48
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
