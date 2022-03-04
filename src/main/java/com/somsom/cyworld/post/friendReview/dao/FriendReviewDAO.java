package com.somsom.cyworld.post.friendReview.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.somsom.cyworld.post.friendReview.model.FriendReview;

@Repository
public interface FriendReviewDAO {

	public int insertFriendReview(
			@Param("userId") int userId,
			@Param("userName") String userName,
			@Param("targetUserId") int targetUserId,
			@Param("content") String content);
	
	public List<FriendReview> selectFriendReview();
	
}
