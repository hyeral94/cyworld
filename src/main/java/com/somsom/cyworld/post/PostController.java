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

import com.somsom.cyworld.post.guestBook.bo.GuestBookBO;
import com.somsom.cyworld.post.guestBook.model.GuestBook;
import com.somsom.cyworld.post.setting.bo.SettingBO;
import com.somsom.cyworld.post.setting.model.Setting;

@RequestMapping("/post")
@Controller
public class PostController {
	
	@Autowired
	private GuestBookBO guestBookBO;
	
	@Autowired
	private SettingBO settingBO;

	@GetMapping("/guest_book_view")
	public String guestBookView(
			@RequestParam("userId") int targetUserId,
			Model model,
			HttpServletRequest request){
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		
		List<GuestBook> guestBookList = guestBookBO.getGuestBookList(targetUserId);
		
		model.addAttribute("guestBookList", guestBookList);
		model.addAttribute("targetUserId", userId);
		
		return "post/guestBook";
		
	}
	
	@GetMapping("/setting_view")
	public String settingView(
			@RequestParam("userId") int userId,
			Model model,
			HttpServletRequest request) {
		
		List<Setting> settingList = settingBO.getSettingList(userId);
		
		model.addAttribute("userId", userId);
		model.addAttribute("settingList", settingList);
		
		return "post/setting";
		
	}
	

	
	
}
