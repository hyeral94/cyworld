package com.somsom.cyworld.post.photoAlbumReview.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.somsom.cyworld.post.photoAlbumReview.dao.PhotoAlbumReviewDAO;
import com.somsom.cyworld.post.photoAlbumReview.model.PhotoAlbumReview;
import com.somsom.cyworld.post.setting.model.Setting;

@Service
public class PhotoAlbumReviewBO {

	@Autowired
	private PhotoAlbumReviewDAO photoAlbumReviewDAO;
	
	
	// 댓글 입력
	public int addPhotoAlbumReview(int userId, String userName, int targetUserId, String content) {
		return photoAlbumReviewDAO.insertPhotoAlbumReview(userId, userName, targetUserId, content);
	}
	
	// 댓글 리스트 targetUserId로 가져오기
	public List<PhotoAlbumReview> getPhotoAlbumReviewList(int targetUserId){
		return photoAlbumReviewDAO.selectPhotoAlbumReviewList(targetUserId);
	}
	
	// 댓글 값 userId로 가져오기
	public PhotoAlbumReview getphotoAlbumReview(int userId){
		return photoAlbumReviewDAO.selectPhotoAlbumReview(userId);
	}
}
