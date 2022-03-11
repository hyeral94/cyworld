package com.somsom.cyworld.post.friendReview;

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

import com.somsom.cyworld.post.friendReview.bo.FriendReviewBO;
import com.somsom.cyworld.post.friendReview.model.FriendReview;
import com.somsom.cyworld.user.model.User;

@RequestMapping("/post/friend_review")
@RestController
public class FriendReviewRestController {

	@Autowired
	private FriendReviewBO friendReviewBO;
	
	//일촌평 작성
	@PostMapping("/create")
	public Map<String, String> friendReviewCreate(
			@RequestParam("content") String content,
			@RequestParam("targetUserId") int targetUserId, //현재 미니홈피가 누구의 미니홈피인지를 구분
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");//일촌평 작성자 Id
		String userName = (String)session.getAttribute("userName");//일촌평 작성자 name

		int count = friendReviewBO.addFriendReview(userId, userName, targetUserId, content);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
		
	}
	
	//일촌평 삭제
	@GetMapping("/delete")
	public Map<String, String> friendReviewDelete(
			@RequestParam("id") int id,
			HttpServletRequest request) {

		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = friendReviewBO.deleteFriendReview(id, userId);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		
		}else {
			result.put("reuslt", "fail");
		}
		return result;
		


	}
}
