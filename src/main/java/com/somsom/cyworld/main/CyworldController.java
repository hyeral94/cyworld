package com.somsom.cyworld.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.somsom.cyworld.post.friendReview.bo.FriendReviewBO;
import com.somsom.cyworld.post.friendReview.model.FriendReview;

@RequestMapping("/main")
@Controller
public class CyworldController {

	@Autowired
	private FriendReviewBO friendReivewBO;
	
	@GetMapping("/mini_home_view") 
	public String miniHomeView(//@RequestParam("userId") int userId,
			Model model,//model -> 최종 페이지에 쓰일 데이터를 view에 전달
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
//		String userName = (String)session.getAttribute("userName");
//		String content = (String)session.getAttribute("content");
		
		List<FriendReview> friendReviewList = friendReivewBO.getFriendReview(userId);
		model.addAttribute("friendReviewList", friendReviewList);
		
		return "main/miniHome";
	}
}
