package com.somsom.cyworld.post.setting;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.somsom.cyworld.post.setting.bo.SettingBO;
import com.somsom.cyworld.post.setting.model.Setting;

@RequestMapping("/post/setting")
@RestController
public class SettingRestController {

	@Autowired
	private SettingBO settingBO;

	// 미니홈피 설정
	@PostMapping("/up_load")
	public Map<String, String> setting(
			@RequestParam("introduce") String introduce,
			@RequestParam("motion") String motion,
			@RequestParam("content") String content,
			HttpServletRequest request){
			
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = settingBO.addSetting(userId, introduce, motion, content);
		Map<String, String> result = new HashMap<>();
	
		if(count == 1) {
			result.put("result", "success");
		}else{
			result.put("result", "fail");
		}
		
		return result;
	}
	
	// 프로필 이미지 설정
	@PostMapping("/up_load_image")
	public Map<String, String> settingImage(
			@RequestParam(value="file", required=false) MultipartFile file,
			HttpServletRequest request){
			
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = settingBO.addImageSetting(userId, file);
		Map<String, String> result = new HashMap<>();
	
		if(count == 1) {
			result.put("result", "success");
		}else{
			result.put("result", "fail");
		}
		
		return result;
	}


}
