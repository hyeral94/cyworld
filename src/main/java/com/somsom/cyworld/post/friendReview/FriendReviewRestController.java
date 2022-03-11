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
			@RequestParam("id") int id,//작성된 일촌평의 id를 기준으로 삭제
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int targetUserId = (Integer)session.getAttribute("targetUserId"); //내가 일촌평을 남긴 미니홈피 주인
		
		int count = friendReviewBO.deleteFriendReview(id, targetUserId);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		return result;
	}
}
