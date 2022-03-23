package com.somsom.cyworld.post.visitorNumber;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.somsom.cyworld.post.visitorNumber.bo.VisitorNumberBO;

@RestController
public class VisitorNumberRestController {
	
	@Autowired
	private VisitorNumberBO visitorNumberBO;
	
	public Map<String, String> connectionVisitorCount(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		boolean isCounting = (Boolean)session.getAttribute("userId");
//		int todayCounting = (Integer)session.getAttribute("userId");
		
//		int userId = (Integer)session.getAttribute("userId");
		
//		int count = visitorNumberBO.addVisitorCount(userId);
		
		Map<String, String> result = new HashMap<>();
		
		if(isCounting) {
			result.put("result", "success");
			
		}else {
			result.put("result", "fail");
		}
		
		return result;
		
	}
	
	
}