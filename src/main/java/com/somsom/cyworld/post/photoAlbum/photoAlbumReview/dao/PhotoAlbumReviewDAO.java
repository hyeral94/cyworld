package com.somsom.cyworld.post.photoAlbum.photoAlbumReview.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.somsom.cyworld.post.friendReview.model.FriendReview;
import com.somsom.cyworld.post.photoAlbum.photoAlbumReview.model.PhotoAlbumReview;

@Repository
public interface PhotoAlbumReviewDAO {

	public int insertPhotoAlbumReview(
			@Param("userId") int userId,
			@Param("userName") String userName,
			@Param("targetUserId") int targetUserId,
			@Param("content") String content);
	
	public List<PhotoAlbumReview> photoAlbumReviewList(@Param("targetUserId") int targetUserId); 
	
	// 사진첩 댓글 삭제
//	public int deletePhotoAlbumReview(@Param("id") int id);
//		
//	public PhotoAlbumReview selectPhotoAlbumReviewDelete(@Param("id") int id);
	
	public int deletePhotoAlbumReview(@Param("targetUserId") int targetUserId);
	
}
