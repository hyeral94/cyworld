package com.somsom.cyworld.post.photoAlbum.photoAlbumReview;

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

import com.somsom.cyworld.post.photoAlbum.photoAlbumReview.bo.PhotoAlbumReviewBO;

@RestController
@RequestMapping("/post/photo_album_review")
public class PhotoAlbumReviewRestController {

	@Autowired
	private PhotoAlbumReviewBO photoAlbumReviewBO;
	
	@PostMapping("/create")
	public Map<String, String> reviewCreate(
			@RequestParam("targetUserId") int targetUserId,
			@RequestParam("content") String content,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");
		
		int count = photoAlbumReviewBO.addPhotoAlbumReview(userId, userName, targetUserId, content);
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	// 사진첩 댓글 삭제
//	@GetMapping("/delete")
//	public Map<String, String> reviewDelete(
//			@RequestParam("targetUserId") int targetUserId,
//			HttpServletRequest request) {
//		
//		HttpSession session = request.getSession();
//		
//		int userId = (Integer)session.getAttribute("userId");//댓글 작성자 userId
//		
//		int count = photoAlbumReviewBO.deletePhotoAlbumReview(targetUserId);
//		Map<String, String> result= new HashMap<>();
//		
//		if(count == 1) {
//			result.put("result", "success");
//		}else {
//			result.put("result", "fail");
//		}
//		
//		return result;
//	}
}