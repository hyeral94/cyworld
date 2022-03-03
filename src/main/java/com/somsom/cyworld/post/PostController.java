package com.somsom.cyworld.post;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/post")
@Controller
public class PostController {
	
	@GetMapping("/guest_book_view")
	public String guestBookView() {
		return "post/guestBook";
	}
	
	@GetMapping("/set_up_view")
	public String editView() {
		return "post/setUp";
	}
	
	
}
