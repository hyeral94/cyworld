package com.somsom.cyworld.post.photoAlbum.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.somsom.cyworld.post.photoAlbum.dao.PhotoAlbumDAO;

@Service
public class PhotoAlbumBO {

	@Autowired
	private PhotoAlbumDAO photoAlbumDAO;
	
	public int addPhotoAlbum(int userId, String userName, String content, String imagePath) {
		return photoAlbumDAO.insertPhotoAlbum(userId, userName, content, imagePath);
	}

}
