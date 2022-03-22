package com.somsom.cyworld.post.setting.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.somsom.cyworld.post.setting.model.Setting;
import com.somsom.cyworld.post.setting.model.SettingProfileImage;

@Repository
public interface SettingDAO {

//	public int insertSetting(
//			@Param("userId") int userId,
//			@Param("introduce") String introduce,
//			@Param("motion") String motion,
//			@Param("content") String content,
//			@Param("imagePath") String imagePath);
	
	// 미니홈피 설정
	public int insertSetting(
			@Param("userId") int userId,
			@Param("introduce") String introduce,
			@Param("motion") String motion,
			@Param("content") String content);
	
	// 프로필 이미지 설정 
	public int insertImageSetting(@Param("userId") int userId, @Param("imagePath") String imagePath);
	
	// 설정 값 져오기
	public Setting selectSetting(@Param("userId") int userId);
	
	//프로필 이미지 설정 값 가져오기
	public SettingProfileImage selectProfileImage(@Param("userId") int userId);
	

}
