package com.semanticsquare.thrillio.constants;

public enum MovieGenre {

	CLASSICS("Classics"), DRAMA("Drama"), SCIFI_AND_FANTASY("Scifi and Fantasy"), COMEDY("Comedy"),
	CHILDREN_AND_FAMILY("Chilren and Fantasy"), ACTION_AND_ADVENTURE("Action and Adventure"), THRILLERS("Thrillers"),
	MUSIC_AND_MUSICALS("Music and Musicals"), TELEVISION("Television"), HORROR("Horror"),
	SPECIAL_INTEREST("Special Interest"), INDEPENDENT("Independent"), SPORTS_AND_FITNESS("Sports and Fitness"),
	ANIME_AND_ANIMATION("Anime and Fantasy"), GAY_AND_LESBIAN("Gay and Lesbian"),
	ClASSIC_MOVIE_MUSICALS("Classic Movie Musicals"), FAITH_AND_SPIRITUALITY("Faith and Spirituality"),
	FOREIGN_DRAMAS("Foreign Dramas"), FOREIGN_ACTION_AND_ADVENTURE("Foreign Action and Adventure"),
	FOREIGN_THRILLERS("Foreign Thrillers"), TV_SHOWS("Foreign TV Shows"), DRAMAS("DRAMAS"),
	ROMANTIC_MOVIES("Romantic Movies"), COMEDIES("Comedies"), DOCUMENTARIES("Documentaries"),
	FOREIGN_MOVIES("Foreign Movies");

	private MovieGenre(String name) {
		this.name = name;
	}

	private String name;

	public String getName() {
		return name;
	}

}
