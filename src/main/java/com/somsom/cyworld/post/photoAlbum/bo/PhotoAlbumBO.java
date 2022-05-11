package com.somsom.cyworld.post.photoAlbum.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.somsom.cyworld.common.FileManagerService;
import com.somsom.cyworld.post.photoAlbum.Review.bo.ReviewBO;
import com.somsom.cyworld.post.photoAlbum.Review.model.PhotoAlbumReview;
import com.somsom.cyworld.post.photoAlbum.dao.PhotoAlbumDAO;
import com.somsom.cyworld.post.photoAlbum.model.PhotoAlbum;
import com.somsom.cyworld.post.photoAlbum.model.PhotoAlbumDetail;

@Service
public class PhotoAlbumBO {

	@Autowired
	private PhotoAlbumDAO photoAlbumDAO;
	
	@Autowired
	private ReviewBO reviewBO;
	
	
	// 사진첩 업로드
	public int addPhotoAlbum(int userId, String userName, String subject, String content, MultipartFile file) {
		
		String filePath = FileManagerService.saveFile(userId, file);
		
		return photoAlbumDAO.insertPhotoAlbum(userId, userName, subject, content, filePath);
	}
	
	// 사진첩 리스트 가져오기
	public List<PhotoAlbumDetail> getPhotoAlbumList(int userId) {
	
		List<PhotoAlbum> photoAlbumList = photoAlbumDAO.selectPhotoAlbum();
		
		List<PhotoAlbumDetail> photoAlbumDetailList = new ArrayList<>();
		
		for(PhotoAlbum photoAlbum:photoAlbumList) {
			
			List<PhotoAlbumReview> reviewList = reviewBO.getPhotoAlbumReviewList(photoAlbum.getId());
		
			PhotoAlbumDetail photoAlbumDetail = new PhotoAlbumDetail();
			photoAlbumDetail.setPhotoAlbum(photoAlbum);
			photoAlbumDetail.setReviewList(reviewList);
			
			photoAlbumDetailList.add(photoAlbumDetail);
		}
		
		return photoAlbumDetailList;
	}
 }
