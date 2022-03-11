package com.somsom.cyworld.post.guestBook;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.somsom.cyworld.post.guestBook.bo.GuestBookBO;

@RequestMapping("/post/guest_book")
@RestController
public class GuestBookRestController {

	@Autowired
	private GuestBookBO guestBookBO;
	
	//방명록 작성
	@PostMapping("/create")
	public Map<String, String> guestBookCreate(
			@RequestParam("targetUserId") int targetUserId,
			@RequestParam("content") String content,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");//방명록 작성자 userId
		String userName = (String)session.getAttribute("userName");//방명록 작성자 userName
		
		int count = guestBookBO.addGuestBook(userId, userName, targetUserId, content);
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
		
	}
	
	//방명록 삭제
	@PostMapping("/delete")
	public Map<String, String> guestBookDelete(
			@RequestParam("id") int id,
			HttpServletRequest request){
		
		HttpSession session = request.getSession();
		
		int targetUserId = (Integer)session.getAttribute(targetUserId);
	}
}
