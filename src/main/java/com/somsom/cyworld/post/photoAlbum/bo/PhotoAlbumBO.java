package com.somsom.cyworld.post.photoAlbum.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.somsom.cyworld.common.FileManagerService;
import com.somsom.cyworld.post.photoAlbum.dao.PhotoAlbumDAO;

@Service
public class PhotoAlbumBO {

	@Autowired
	private PhotoAlbumDAO photoAlbumDAO;
	
	public int addPhotoAlbum(int userId, String userName, String subject, String content, MultipartFile file) {
		
		String filePath = FileManagerService.saveFile(userId, file);
		
		return photoAlbumDAO.insertPhotoAlbum(userId, userName, subject, content, filePath);
	}

}
