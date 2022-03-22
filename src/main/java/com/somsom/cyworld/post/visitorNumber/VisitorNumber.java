package com.somsom.cyworld.post.visitorNumber;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/post/")
@RestController
public class VisitorNumber {

//	@PostMapping("")
//	public Map<String, String> visitorNumber(HttpServletRequest request){
//		
//		HttpSession session = request.getSession();
//		int userId = (Integer)session.getAttribute("userId");
//	}
}
