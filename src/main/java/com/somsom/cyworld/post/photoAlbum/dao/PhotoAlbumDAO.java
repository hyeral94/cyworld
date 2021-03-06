package com.somsom.cyworld.post.photoAlbum.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.somsom.cyworld.post.guestBook.model.GuestBook;
import com.somsom.cyworld.post.photoAlbum.model.PhotoAlbum;

@Repository
public interface PhotoAlbumDAO {

	public int insertPhotoAlbum(
			@Param("userId") int userId,
			@Param("userName") String userName,
			@Param("subject") String subject,
			@Param("content") String content,
			@Param("imagePath") String imagePath);
	
	public List<PhotoAlbum> selectPhotoAlbum(@Param("userId") int userId);
	
	public int deletePhotoAlbum(@Param("id") int id);
		
	public PhotoAlbum selectPhotoAlbumDelete(@Param("id") int id);
	
	
}
