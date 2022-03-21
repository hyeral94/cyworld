package com.somsom.cyworld.post.setting.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.somsom.cyworld.post.guestBook.model.GuestBook;
import com.somsom.cyworld.post.setting.model.Setting;

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
	public int insertImageSetting(@Param("imagePath") String imagePath);
	
	// 설정 값 져오기
	public Setting selectSetting(@Param("userId") int userId);
	
	//프로필 이미지 설정 값 가져오기
	public Setting selectSettingImage(@Param("userId") int userId);
	
	// 삭제 대신 업데이트
	public int updateSetting(
			@Param("introduce") String introduce,
			@Param("motion") String motion,
			@Param("content") String content);
	
	public Setting selectSettingUpdate(
			@Param("introduce") String introduce,
			@Param("motion") String motion,
			@Param("content") String content);
}
