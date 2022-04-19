package com.somsom.cyworld.post.photoAlbum.photoAlbumReview.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.somsom.cyworld.post.friendReview.model.FriendReview;
import com.somsom.cyworld.post.photoAlbum.photoAlbumReview.dao.PhotoAlbumReviewDAO;
import com.somsom.cyworld.post.photoAlbum.photoAlbumReview.model.PhotoAlbumReview;

@Service
public class PhotoAlbumReviewBO {

	@Autowired
	private PhotoAlbumReviewDAO photoAlbumReviewDAO;
	
	// 사진첩 댓글 입력
	public int addPhotoAlbumReview(int userId, String userName, int targetUserId, String content) {
		return photoAlbumReviewDAO.insertPhotoAlbumReview(userId, userName, targetUserId, content);
	}
	
	// 사진첩 댓글 리스트
	public List<PhotoAlbumReview> getPhotoAlbumReview(int targetUserId){
		return photoAlbumReviewDAO.photoAlbumReviewList(targetUserId);
	}
	
	// 사진첩 댓글 삭제
//	public int deletePhotoAlbumReview(int id, int userId) {
//		
//		PhotoAlbumReview photoAlbumReview = photoAlbumReviewDAO.selectPhotoAlbumReviewDelete(userId);
//		
//		if(photoAlbumReview.getUserId() != userId) {
//			return 0;
//		}
//		return photoAlbumReviewDAO.deletePhotoAlbumReview(userId);
//	}
	
	// 사진첩 댓글 삭제
	public int deletePhotoAlbumReview(int targetUserId) {
		return photoAlbumReviewDAO.deletePhotoAlbumReview(targetUserId);
	}
	
}
