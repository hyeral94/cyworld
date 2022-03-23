package com.somsom.cyworld.post.setting.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.somsom.cyworld.common.FileManagerService;
import com.somsom.cyworld.post.setting.dao.SettingDAO;
import com.somsom.cyworld.post.setting.model.Setting;
import com.somsom.cyworld.post.setting.model.SettingProfileImage;

@Service
public class SettingBO {

	@Autowired
	private SettingDAO settingDAO;

	// 미니홈피 설정
	public int addSetting(int userId, String introduce, String motion, String content) {
		
		return settingDAO.insertSetting(userId, introduce, motion, content);
	}
	
	// 프로필 이미지 설정
	public int addImageSetting(int userId, MultipartFile file) {
		
		String filePath = FileManagerService.saveFile(userId, file);
		
		return settingDAO.insertImageSetting(userId, filePath);
	}
	
	// 설정 값 userId로 가져오기
	public Setting getSetting(int userId){
		return settingDAO.selectSetting(userId);
	}
	
	// 프로필 이미지 설정 값 userId로 가져오기
	public SettingProfileImage getSettingImage(int userId){
		return settingDAO.selectProfileImage(userId);
	}


	
}
