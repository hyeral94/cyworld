package com.somsom.cyworld.post.photoAlbumReview.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.somsom.cyworld.post.photoAlbumReview.model.PhotoAlbumReview;
import com.somsom.cyworld.post.setting.model.Setting;

@Repository
public interface PhotoAlbumReviewDAO {

	public int insertPhotoAlbumReview(
			@Param("userId") int userId,
			@Param("userName") String userName,
			@Param("targetUserId") int targetUserId,
			@Param("content") String content);
	
	public List<PhotoAlbumReview> selectPhotoAlbumReviewList(@Param("targetUserId") int targetUserId);
	
	// 댓글 값 져오기
	public PhotoAlbumReview selectPhotoAlbumReview(@Param("userId") int userId);
}
