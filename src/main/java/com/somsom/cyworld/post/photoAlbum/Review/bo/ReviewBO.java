package com.somsom.cyworld.post.photoAlbum.Review.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.somsom.cyworld.post.photoAlbum.Review.dao.ReviewDAO;
import com.somsom.cyworld.post.photoAlbum.Review.model.PhotoAlbumReview;

@Service
public class ReviewBO {
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	// 사진첩 댓글 작성
	public int addReview(int userId, String userName, int targetUserId, String content) {
		return reviewDAO.insertReview(userId, userName, targetUserId, content);
	}
	
	// 사진첩 댓글 리스트로 가져오기
	public List<PhotoAlbumReview> getPhotoAlbumReviewList(int targetUserId) {
		return reviewDAO.selectPhotoAlbumReview(targetUserId);
	}
	
}

