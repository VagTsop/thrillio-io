package com.semanticsquare.thrillio;

import java.util.List;

import com.semanticsquare.thrillio.constants.KidFriendlyStatus;
import com.semanticsquare.thrillio.constants.UserType;
import com.semanticsquare.thrillio.entities.Bookmark;
import com.semanticsquare.thrillio.entities.User;
import com.semanticsquare.thrillio.partner.Shareable;

public class View {

	public static void browse(User user, List<List<Bookmark>> bookmarks) {
		System.out.println("\n" + user.getEmail() + " is browsing items...");
		
		for (List<Bookmark> bookmarkList : bookmarks) {
			for (Bookmark bookmark : bookmarkList) {

				boolean isBookmarked = getBookmarkDecison(bookmark);
				if (isBookmarked) {
					

				//	BookmarkController.getInstance().saveUserBookmark(user, bookmark);

					System.out.println("New Item Bookmarked --  " + bookmark);

				}

				if (user.getUserType().equals(UserType.EDITOR) || user.getUserType().equals(UserType.CHIEF_EDITOR)) {

					// Mark as kid-Friendly
					if (bookmark.isKidFriendlyEligible()
							&& bookmark.getKidFriendlyStatus().equals(KidFriendlyStatus.UNKNOWN))
						;
					KidFriendlyStatus kidFriendlyStatus = getkidFriendlyStatusDecision(bookmark);
					if (!kidFriendlyStatus.equals(KidFriendlyStatus.UNKNOWN)) {
					//	 BookmarkController.getInstance().setKidFriendlyStatus(user,
					//	 kidFriendlyStatus, bookmark);

					}
				}

				// Sharing!!
				if (bookmark.getKidFriendlyStatus().equals(KidFriendlyStatus.APPROVED)
						&& bookmark instanceof Shareable) {
					boolean isShared = getShareDecision();
					if (isShared) {
						// BookmarkController.getInstance().share(user, bookmark);
					}
				}
			}
		}

	}

	// TODO: BELOW methods simulate user input. After IO, we take input via console
	private static boolean getShareDecision() {
		return Math.random() < 0.5 ? true : false;

	}

	private static KidFriendlyStatus getkidFriendlyStatusDecision(Bookmark bookmark) {
		double decision = Math.random();

		return decision < 0.4 ? KidFriendlyStatus.APPROVED
				: (decision >= 0.5 && decision < 0.8) ? KidFriendlyStatus.REJECTED : KidFriendlyStatus.UNKNOWN;

	}

	private static boolean getBookmarkDecison(Bookmark bookmark) {
		return Math.random() < 0.5 ? true : false;

	}

}
