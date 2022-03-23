package com.somsom.cyworld.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.somsom.cyworld.post.friendReview.bo.FriendReviewBO;
import com.somsom.cyworld.post.friendReview.model.FriendReview;
import com.somsom.cyworld.post.setting.bo.SettingBO;
import com.somsom.cyworld.post.setting.model.Setting;
import com.somsom.cyworld.post.setting.model.SettingProfileImage;
import com.somsom.cyworld.post.visitorNumber.bo.VisitorNumberBO;
import com.somsom.cyworld.post.visitorNumber.model.VisitorNumber;

//@RequestMapping("/main")
@Controller
public class CyworldController {

	@Autowired
	private FriendReviewBO friendReviewBO;
	
	@Autowired
	private SettingBO settingBO;
	
	@Autowired
	private VisitorNumberBO visitorNumberBO;
	
	@GetMapping("/main/mini_home_view") 
	public String miniHomeView(
			@RequestParam("userId") int targetUserId,
			Model model,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();

		List<FriendReview> friendReviewList = friendReviewBO.getFriendReview(targetUserId);
		Setting setting = settingBO.getSetting(targetUserId);
		SettingProfileImage settingProfileImage = settingBO.getSettingImage(targetUserId);
		int totalCount = visitorNumberBO.totalVisitorNumber(targetUserId);
		int todayCount = visitorNumberBO.todayVisitorNumber(targetUserId);
			
		
		model.addAttribute("targetUserId", targetUserId);
		model.addAttribute("friendReviewList", friendReviewList);
		model.addAttribute("setting", setting);
		model.addAttribute("settingProfileImage", settingProfileImage);
		
		
		Boolean isCounting = (Boolean)session.getAttribute("isCounting");
			if(isCounting == null) { //카운팅 된 정보가 없을 때 1씩 증가
				
				int count = visitorNumberBO.addVisitorCount(targetUserId);
				if(count == 1) {
					session.setAttribute("isCounting", true);
				}
			}
			

		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("todayCount", todayCount);
			
			
		return "main/miniHome";
	}
	
	

}
