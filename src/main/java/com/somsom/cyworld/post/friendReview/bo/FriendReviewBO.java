package com.somsom.cyworld.post.friendReview.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.somsom.cyworld.post.friendReview.dao.FriendReviewDAO;

@Service
public class FriendReviewBO {

	@Autowired
	private FriendReviewDAO friendReviewDAO;
	
	public int addFriendReview(int postId, int userId, String userName, String content) {
		return friendReviewDAO.insertFriendReview(postId, userId, userName, content);
	}
}
