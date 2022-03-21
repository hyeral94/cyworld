package com.somsom.cyworld.post.setting.bo;



import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.somsom.cyworld.common.FileManagerService;
import com.somsom.cyworld.post.guestBook.model.GuestBook;
import com.somsom.cyworld.post.setting.dao.SettingDAO;
import com.somsom.cyworld.post.setting.model.Setting;


@Service
public class SettingBO {

	@Autowired
	private SettingDAO settingDAO;
	
	// 설정 업로드
//	public int addSetting(int userId, String introduce, String motion, String content, MultipartFile file) {
//		
//		String filePath = FileManagerService.saveFile(userId, file);
//		
//		return settingDAO.insertSetting(userId, introduce, motion, content, filePath);
//	}
	
	// 미니홈피 설정
	public int addSetting(int userId, String introduce, String motion, String content) {
		
		return settingDAO.insertSetting(userId, introduce, motion, content);
	}
	
	// 프로필 이미지 설정
	public int addImageSetting(int userId, MultipartFile file) {
		
		String filePath = FileManagerService.saveFile(userId, file);
		
		return settingDAO.insertImageSetting(filePath);
	}
	// 프로필 이미지 설정 ㄹ
//	// 상단 소개말 작성
//	public int addIntroduceSetting(int targetUserId, int userId, String introduce) {
//		return settingDAO.insertIntroduceSetting(targetUserId, userId, introduce);
//	}
//	
//	// 프로필 이미지 등록
//	public int addProfileImageSetting(int targetUserId, int userId, MultipartFile file) {
//		
//		String filePath = FileManagerService.saveFile(userId, file);
//		
//		return settingDAO.insertProfileImageSetting(targetUserId, userId, filePath);
//	}
//	
//	// 프로필 컨텐츠 등록
//	public int addProfileIntroduceSetting(int targetUserId, int userId, String content) {
//		return settingDAO.insertProfileIntroduceSetting(targetUserId, userId, content);
//	}
	
	
	// 설정 값 userId로 가져오기
	public Setting getSetting(int userId){
		return settingDAO.selectSetting(userId);
	}
	
	// 프로필 이미지 설정 값 userId로 가져오기
	public Setting getSettingImage(int userId){
		return settingDAO.selectSetting(userId);
	}

	// 삭제 대신 업데이트

	
}
