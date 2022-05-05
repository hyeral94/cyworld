package com.somsom.cyworld.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.somsom.cyworld.post.diary.bo.DiaryBO;
import com.somsom.cyworld.post.diary.model.Diary;
import com.somsom.cyworld.post.guestBook.bo.GuestBookBO;
import com.somsom.cyworld.post.guestBook.model.GuestBook;
import com.somsom.cyworld.post.setting.bo.SettingBO;
import com.somsom.cyworld.post.setting.model.Setting;
import com.somsom.cyworld.post.setting.model.SettingProfileImage;
import com.somsom.cyworld.post.visitorNumber.bo.VisitorNumberBO;

@RequestMapping("/post")
@Controller
public class PostController {
	
	@Autowired
	private GuestBookBO guestBookBO;
	
	@Autowired
	private SettingBO settingBO;
	
	@Autowired
	private VisitorNumberBO visitorNumberBO;
	
	@Autowired
	private DiaryBO diaryBO;
	

	
	@GetMapping("/guest_book_view")
	public String guestBookView(
			@RequestParam("userId") int targetUserId,
			Model model,
			HttpServletRequest request){
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		
		List<GuestBook> guestBookList = guestBookBO.getGuestBookList(targetUserId);
		Setting setting = settingBO.getSetting(targetUserId);
		SettingProfileImage settingProfileImage = settingBO.getSettingImage(targetUserId);
		int totalCount = visitorNumberBO.totalVisitorNumber(targetUserId);
		int todayCount = visitorNumberBO.todayVisitorNumber(targetUserId);
		
		model.addAttribute("guestBookList", guestBookList);
		model.addAttribute("targetUserId", targetUserId);
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
	
		return "post/guestBook";
		
	}
	
	@GetMapping("/setting_view")
	public String settingView(
			Model model,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		Setting setting = settingBO.getSetting(userId);
		SettingProfileImage settingProfileImage = settingBO.getSettingImage(userId);
	
		model.addAttribute("userId", userId);
		model.addAttribute("setting", setting);
		model.addAttribute("settingProfileImage", settingProfileImage);
		
		return "post/setting";
		
	}
	
	// 다이어리
	@GetMapping("/diary_create_view")
	public String diaryCreateView(
			Model model,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		List<Diary> diary = diaryBO.getDiaryList(userId);
		
		model.addAttribute("userId", userId);
		model.addAttribute("diary", diary);
		
		return "post/diary";
	}
	
	// 사진첩
	@GetMapping("/photo_album_create_view")
	public String photoAlbumCreateView() {
//			Model model,
//			HttpServletRequest request) {
		
	return "post/photoAlbum";	
		
	}


	
	
}
