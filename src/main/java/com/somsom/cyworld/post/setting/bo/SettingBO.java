package com.somsom.cyworld.post.setting.bo;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.somsom.cyworld.post.setting.dao.SettingDAO;
import com.somsom.cyworld.post.setting.model.Setting;


@Service
public class SettingBO {

	@Autowired
	private SettingDAO settingDAO;
	
	// 설정 업로드
	public int addSetting(int targetUserId, int userId, String introduce, String motion, String content, String imagePath) {
		return settingDAO.insertSetting(targetUserId, userId, introduce, motion, content, imagePath);
	}
	
	// 상단 소개말 작성
	public int addIntroduceSetting(int targetUserId, int userId, String introduce) {
		return settingDAO.insertIntroduceSetting(targetUserId, userId, introduce);
	}
	
	// 설정 리스트 userId로 가져오기
	public List<Setting> getSettingList(int targetUserId){
		return settingDAO.selectSetting(targetUserId);
	}
}
