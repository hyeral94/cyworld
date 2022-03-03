package com.somsom.cyworld.post.friendReview.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface FriendReviewDAO {

	public int insertFriendReview(
			@Param("postId") int postId,
			@Param("userId") int comment,
			@Param("userName") String userName,
			@Param("content") String content);
	
}
