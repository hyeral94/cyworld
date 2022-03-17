package com.somsom.cyworld.post.setting.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.somsom.cyworld.post.setting.model.Setting;

@Repository
public interface SettingDAO {

//	public int insertSetting(
//			@Param("targetUserId") int targetUserId,
//			@Param("userId") int userId,
//			@Param("introduce") String introduce,
//			@Param("motion") String motion,
//			@Param("content") String content,
//			@Param("imagePath") String imagePath);
	
	// 상단 소개말 등록
	public int insertIntroduceSetting(
			@Param("targetUserId") int targetUserId,
			@Param("userId") int userId,
			@Param("introduce") String introduce);
	
	// 프로필 이미지 등록
	public int insertProfileImageSetting(
			@Param("targetUserId") int targetUserId,
			@Param("userId") int userId,
			@Param("imagePath") String imagePath);
	
	// 프로필 컨텐츠 등록
	public int insertProfileIntroduceSetting(
			@Param("targetUserId") int targetUserId,
			@Param("userId") int userId,
			@Param("content") String content);
	
	// 설정 리스트로 가져오기
	public List<Setting> selectSetting(@Param("targetUserId") int targetUserId);
}
