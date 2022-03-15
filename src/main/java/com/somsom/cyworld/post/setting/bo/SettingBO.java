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
	public int addSetting(int userId, String introduce, String motion, String content, String imagePath) {
		return settingDAO.insertSetting(userId, introduce, motion, content, imagePath);
	}
	
	// 설정 리스트 userId로 가져오기
	public List<Setting> getSettingList(int userId){
		return settingDAO.selectSetting(userId);
	}
}
