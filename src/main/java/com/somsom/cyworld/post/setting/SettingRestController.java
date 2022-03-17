package com.somsom.cyworld.post.setting;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.somsom.cyworld.post.setting.bo.SettingBO;

@RequestMapping("/post/setting")
@RestController
public class SettingRestController {

	@Autowired
	private SettingBO settingBO;
	
//	@PostMapping("/up_load")
//	public Map<String, String> setting(
//			@RequestParam("targetUserId") int targetUserId,
//			@RequestParam("introduce") String introduce,
//			@RequestParam("motion") String motion,
//			@RequestParam("content") String content,
//			@RequestParam("imagePath") String imagePath,
//			HttpServletRequest request){
//			
//		HttpSession session = request.getSession();
//		
//		int userId = (Integer)session.getAttribute("userId");
//		
//		int count = settingBO.addSetting(targetUserId, userId, introduce, motion, content, imagePath);
//		Map<String, String> result = new HashMap<>();
//	
//		if(count == 1) {
//			result.put("result", "success");
//		}else{
//			result.put("result", "fail");
//		}
//		
//		return result;
//	}
	
	
	// 상단 소개말 등록
	@PostMapping("/introduce/up_load")
	public Map<String, String> introduceSetting(
			@RequestParam("targetUserId") int targetUserId,
			@RequestParam("introduce") String introduce,
			HttpServletRequest request){
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = settingBO.addIntroduceSetting(targetUserId, userId, introduce);
		Map<String, String> result = new HashMap<>();
	
		if(count == 1) {
			result.put("result", "success");
		}else{
			result.put("result", "fail");
		}
		
		return result;
	}
	
	// 프로필 이미지 등록
	@PostMapping("/profile_image/up_load")
	public Map<String, String> profileImageSetting(
			@RequestParam("targetUserId") int targetUserId,
			@RequestParam(value="file", required=false) MultipartFile file,
			HttpServletRequest request){
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = settingBO.addProfileImageSetting(targetUserId, userId, file);
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	// 오늘의 기분 등록
	
	// 프로필 컨텐츠 등록
	@PostMapping("/profile_content/up_load")
	public Map<String, String> profileIntroduceSetting(
			@RequestParam("targetUserId") int targetUserId,
			@RequestParam("content") String content,
			HttpServletRequest request){
		
		HttpSession session = request.getSession();
	
		int userId = (Integer)session.getAttribute("userId");
		
		int count = settingBO.addProfileIntroduceSetting(targetUserId, userId, content);
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
	}
}
