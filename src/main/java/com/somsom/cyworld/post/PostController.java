package com.somsom.cyworld.post;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.somsom.cyworld.post.guestBook.bo.GuestBookBO;

@RequestMapping("/post")
@Controller
public class PostController {
	
	@Autowired
	private GuestBookBO guestBookBO;
	
	@GetMapping("/guest_book_view")
	public String guestBookView(
			@RequestParam("userId") int targetUserId,
			Model model) {
		
		
		
	//	List<GuestBookList> guestBookList = guestBookBO.addGuestBook(ta)
		
		
		return "post/guestBook";
		
	}
	
	@GetMapping("/set_up_view")
	public String editView() {
		return "post/setUp";
	}
	
	
}
