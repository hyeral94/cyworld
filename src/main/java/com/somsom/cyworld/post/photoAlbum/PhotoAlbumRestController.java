package com.somsom.cyworld.post.photoAlbum;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.somsom.cyworld.post.photoAlbum.bo.PhotoAlbumBO;

@RequestMapping("/post/photo_album")
@RestController
public class PhotoAlbumRestController {
	
	@Autowired
	private PhotoAlbumBO photoAlbumBO;
	
	@PostMapping("/create")
	public Map<String, String> photoAlbumCreate(
			@RequestParam("content") String content,
			@RequestParam("imagePath") String imagePath,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");
		
		int count = photoAlbumBO.addPhotoAlbum(userId, userName, content, imagePath);
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
		
		
	}

}
