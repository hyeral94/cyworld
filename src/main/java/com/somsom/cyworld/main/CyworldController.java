package com.somsom.cyworld.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.somsom.cyworld.post.friendReview.bo.FriendReviewBO;
import com.somsom.cyworld.post.friendReview.model.FriendReview;
import com.somsom.cyworld.post.setting.bo.SettingBO;
import com.somsom.cyworld.post.setting.model.Setting;

@RequestMapping("/main")
@Controller
public class CyworldController {

	@Autowired
	private FriendReviewBO friendReviewBO;
	
	@Autowired
	private SettingBO settingBO;
	
	@GetMapping("/mini_home_view") 
	public String miniHomeView(
			@RequestParam("userId") int targetUserId,
			Model model,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");

		List<FriendReview> friendReviewList = friendReviewBO.getFriendReview(targetUserId);
		
		model.addAttribute("targetUserId", userId);
		model.addAttribute("friendReviewList", friendReviewList);
		
		
		return "main/miniHome";
	}
	
	@GetMapping("/setting_view")
	public String settingView(
			@RequestParam("userId") int targetUserId,
			Model model,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		List<Setting> settingList = settingBO.getSettingList(targetUserId);
		
		model.addAttribute("targetUserId", userId);
		model.addAttribute("settingList", settingList);
		
		return "post/setting";
		
	}
}
