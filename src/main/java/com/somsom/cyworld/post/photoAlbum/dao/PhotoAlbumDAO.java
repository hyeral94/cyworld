package com.somsom.cyworld.post.photoAlbum.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PhotoAlbumDAO {

	public int insertPhotoAlbum(
			@Param("userId") int userId,
			@Param("userName") String userName,
			@Param("subject") String subject,
			@Param("content") String content,
			@Param("imagePath") String imagePath);
}
