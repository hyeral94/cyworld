package com.somsom.cyworld.post.photoAlbum.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.somsom.cyworld.common.FileManagerService;
import com.somsom.cyworld.post.photoAlbum.dao.PhotoAlbumDAO;
import com.somsom.cyworld.post.photoAlbum.model.PhotoAlbum;

@Service
public class PhotoAlbumBO {

	@Autowired
	public PhotoAlbumDAO photoAlbumDAO;
	
	
	// 사진첩 업로드
	public int addPhotoAlbum(int userId, String userName, String subject, String content, MultipartFile file) {
		
		String filePath = FileManagerService.saveFile(userId, file);
		
		return photoAlbumDAO.insertPhotoAlbum(userId, userName, subject, content, filePath);
	}
	
	// 사진첩 리스트 가져오기
	public List<PhotoAlbum> getPhotoAlbumList(int userId) {
		return photoAlbumDAO.selectPhotoAlbum(userId);
	}
 }
