package com.somsom.cyworld.post.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.somsom.cyworld.post.friendReview.model.FriendReview;

@Repository
public interface PostDAO {

	public List<FriendReview> selectFriendReviewList();
}
