package com.somsom.cyworld.post.diary;

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

import com.somsom.cyworld.post.diary.bo.DiaryBO;

@RequestMapping("/post/diary")
@RestController
public class DiaryRestController {
	
	@Autowired
	private DiaryBO diaryBO;
	
	@PostMapping("/create")
	public Map<String, String> diaryCreate(
			@RequestParam("subject") String subject,
			@RequestParam("content") String content,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");
		
		int count = diaryBO.addDiary(userId, userName, subject, content);
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
	}

	@GetMapping("/delete")
	public Map<String, String> diaryDelete(
			@RequestParam("id") int id,
			HttpServletRequest request) {
		
		int count = diaryBO.deleteDiary(id);
		Map<String, String> result= new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
	}
}
