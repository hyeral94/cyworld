package com.somsom.cyworld.post.photoAlbum.Review;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


import com.somsom.cyworld.post.photoAlbum.Review.bo.ReviewBO;

@RequestMapping("/post/photo_alubm_review")
@RestController
public class PhotoAlbumReviewRestController {

	@Autowired
	private ReviewBO reviewBO;
	
	@PostMapping("/create")
	public Map<String, String> reviewCreate(
			@RequestParam("targetUserId") int targetUserId,
			@RequestParam("content") String content,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");
		
		int count = reviewBO.addReview(userId, userName, targetUserId, content);
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
	}
}
