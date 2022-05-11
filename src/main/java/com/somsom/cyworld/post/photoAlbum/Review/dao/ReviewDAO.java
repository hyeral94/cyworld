package com.somsom.cyworld.post.photoAlbum.Review.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.somsom.cyworld.post.photoAlbum.Review.model.PhotoAlbumReview;

@Repository
public interface ReviewDAO {

	public int insertReview(
			@Param("userId") int userId,
			@Param("userName") String userName,
			@Param("targetUserId") int targetUserId,
			@Param("content") String content);
	
	public List<PhotoAlbumReview> selectPhotoAlbumReview(@Param("targetUserId") int targetUserId);
}

