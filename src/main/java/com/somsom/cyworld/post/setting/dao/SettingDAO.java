package com.somsom.cyworld.post.setting.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.somsom.cyworld.post.setting.model.Setting;

@Repository
public interface SettingDAO {

	public int insertSetting(
			@Param("userId") int userId,
			@Param("introduce") String introduce,
			@Param("motion") String motion,
			@Param("content") String content,
			@Param("imagePath") String imagePath);
	
	public List<Setting> selectSetting(@Param("userId") int userId);
}
