package com.somsom.cyworld.post.photoAlbum.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.somsom.cyworld.common.FileManagerService;
import com.somsom.cyworld.post.guestBook.model.GuestBook;
import com.somsom.cyworld.post.photoAlbum.dao.PhotoAlbumDAO;
import com.somsom.cyworld.post.photoAlbum.model.PhotoAlbum;


@Service
public class PhotoAlbumBO {

	@Autowired
	private PhotoAlbumDAO photoAlbumDAO;
	
	// 사진첩 작성
	public int addPhotoAlbum(int userId, String userName, String subject, String content, MultipartFile file) {
		
		String filePath = FileManagerService.saveFile(userId, file);
		
		return photoAlbumDAO.insertPhotoAlbum(userId, userName, subject, content, content);
	}
	
	// 사진첩 리스트
	public List<PhotoAlbum> getPhotoAlbumList(int userId){
		return photoAlbumDAO.selectPhotoAlbum(userId);
	}
	
	// 사진첩 삭제
	public int deletePhotoAlbum(int id, int userId) {
		
		PhotoAlbum photoAlbum = photoAlbumDAO.selectPhotoAlbumDelete(id);

			
		if(photoAlbum.getUserId() != userId) {
			return 0;
		}
		
		return photoAlbumDAO.deletePhotoAlbum(id);
		}
		
	}

