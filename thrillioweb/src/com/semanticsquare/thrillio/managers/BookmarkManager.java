package com.semanticsquare.thrillio.managers;

import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

import com.semanticsquare.thrillio.constants.BookGenre;
import com.semanticsquare.thrillio.constants.KidFriendlyStatus;
import com.semanticsquare.thrillio.constants.MovieGenre;
import com.semanticsquare.thrillio.dao.BookmarkDao;
import com.semanticsquare.thrillio.entities.Book;
import com.semanticsquare.thrillio.entities.Bookmark;
import com.semanticsquare.thrillio.entities.Movie;
import com.semanticsquare.thrillio.entities.User;
import com.semanticsquare.thrillio.entities.UserBookmark;
import com.semanticsquare.thrillio.entities.WebLink;

public class BookmarkManager {
	private static BookmarkManager instance = new BookmarkManager();
	private static BookmarkDao dao = new BookmarkDao();

	private BookmarkManager() {
	}

	public static BookmarkManager getInstance() {

		return instance;

	}

	public Movie createMovie(long id, String title, String profileUrl, int releaseYear, String[] cast,
			String[] directors, MovieGenre genre, double imdbRating) {

		Movie movie = new Movie();
		movie.setId(id);
		movie.setProfileUrl(profileUrl);
		movie.setTitle(title);
		movie.setReleaseYear(releaseYear);
		movie.setCast(cast);
		movie.setDirectors(directors);
		movie.setGenre(genre);
		movie.setImdbRating(imdbRating);

		return movie;

	}

	public Book createBook(long id, String title, String imageUrl, int publicationYear, String publisher,
			String[] authors, BookGenre genre, double amazonRating) {

		Book book = new Book();
		book.setId(id);
		book.setTitle(title);
		book.setImageUrl(imageUrl);
		book.setPublicationYear(publicationYear);
		book.setPublisher(publisher);
		book.setAuthors(authors);
		book.setGenre(genre);
		book.setAmazonRating(amazonRating);

		return book;

	}

	public WebLink createWebLink(long id, String title, String url, String host) {

		WebLink webLink = new WebLink();
		webLink.setId(id);
		webLink.setTitle(title);
		webLink.setUrl(url);
		webLink.setHost(host);

		return webLink;

	}

	public List<List<Bookmark>> getBookmarks() {
		return dao.getBookmarks();
	}

	public void saveUserBookmark(User user, Bookmark bookmark) {
		UserBookmark userBookmark = new UserBookmark();
		userBookmark.setUser(user);
		userBookmark.setBookmark(bookmark);

		dao.saveUserBookmark(userBookmark);
	}

	public void setKidFriendlyStatus(User user, KidFriendlyStatus kidFriendlyStatus, Bookmark bookmark) {
		bookmark.setKidFriendlyStatus(kidFriendlyStatus);
		bookmark.setKidFriendlyMarkedby(user);
		System.out.println("kid-friendly status " + kidFriendlyStatus + ", Marked By:" + user.getEmail() + bookmark);

		try {
			dao.updateKidFriendlyStatus(bookmark);
		} catch (SQLException e) {

			e.printStackTrace();
		}

		System.out.println("Kid-friendly status: " + kidFriendlyStatus + ", Marked by: " + user.getEmail() + bookmark);
	}

	public void share(User user, Bookmark bookmark) {
		bookmark.setSharedBy(user);

		System.out.println("Data to be shared:");
		if (bookmark instanceof Book) {
			System.out.println(((Book) bookmark).getItemData());
		} else if (bookmark instanceof WebLink) {
			System.out.println(((WebLink) bookmark).getItemData());
		}
		dao.sharedByInfo(bookmark);
	}

	public Collection<Bookmark> getBooks(boolean isBookmarked, long id) {

		return dao.getBooks(isBookmarked, id);
	}

	public Bookmark getBook(long bid) {

		return dao.getBook(bid);
	}

}