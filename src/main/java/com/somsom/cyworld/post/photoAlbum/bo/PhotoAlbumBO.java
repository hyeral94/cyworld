package com.somsom.cyworld.post.photoAlbum.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.somsom.cyworld.common.FileManagerService;
import com.somsom.cyworld.post.photoAlbum.dao.PhotoAlbumDAO;
import com.somsom.cyworld.post.photoAlbum.model.PhotoAlbum;
import com.somsom.cyworld.post.photoAlbum.model.PhotoAlbumDetail;
import com.somsom.cyworld.post.photoAlbum.photoAlbumReview.bo.PhotoAlbumReviewBO;
import com.somsom.cyworld.post.photoAlbum.photoAlbumReview.model.PhotoAlbumReview;



@Service
public class PhotoAlbumBO {

	@Autowired
	private PhotoAlbumDAO photoAlbumDAO;
	
	@Autowired
	private PhotoAlbumReviewBO photoAlbumBO;
	
	// 사진첩 업로드
	public int addPhotoAlbum(int userId, String userName, String subject, String content, MultipartFile file) {
		
		String filePath = FileManagerService.saveFile(userId, file);
		
		return photoAlbumDAO.insertPhotoAlbum(userId, userName, subject, content, filePath);
	}
	
	// 사진첩 리스트로 보여주기
	public List<PhotoAlbumDetail> getPhotoAlbumList(int userId){
		
		// 사진첩 리스트, 댓글 가져오기
		List<PhotoAlbum> photoAlbumList = photoAlbumDAO.selectPhotoAlbumList();
		
		List<PhotoAlbumDetail> photoAlbumDetailList = new ArrayList<>();
		
		for(PhotoAlbum photoAlbum:photoAlbumList) {
			
			// 댓글 가져오기
			List<PhotoAlbumReview> photoAlbumReviewList = photoAlbumBO.getPhotoAlbumReview(photoAlbum.getId());
			
			PhotoAlbumDetail photoAlbumDetail = new PhotoAlbumDetail();
			photoAlbumDetail.setPhotoAlbum(photoAlbum);
			photoAlbumDetail.setPhotoAlbumReview(photoAlbumReviewList);
			
			photoAlbumDetailList.add(photoAlbumDetail);
				
		}
		return photoAlbumDetailList;
	}
	


}
