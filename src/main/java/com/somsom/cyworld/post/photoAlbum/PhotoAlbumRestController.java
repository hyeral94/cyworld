package com.somsom.cyworld.post.photoAlbum;

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
import org.springframework.web.multipart.MultipartFile;

import com.somsom.cyworld.post.photoAlbum.bo.PhotoAlbumBO;

@RequestMapping("/post/photo_album")
@RestController
public class PhotoAlbumRestController {
	
	@Autowired
	private PhotoAlbumBO photoAlbumBO;
	
	@PostMapping("/create")
	public Map<String, String> photoAlbumCreate(
			@RequestParam("subject") String subject,
			@RequestParam("content") String content,
			@RequestParam(value="file", required=false) MultipartFile file,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");
		
		int count = photoAlbumBO.addPhotoAlbum(userId, userName, subject, content, file);
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
		
		
	}

	@GetMapping("/delete")
	public Map<String, String> photoAlbumDelete(
			@RequestParam("id") int id,
			HttpServletRequest request){
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = photoAlbumBO.deletePhotoAlbum(userId);
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
	}
}
