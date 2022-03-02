package com.somsom.cyworld.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/post")
@Controller
public class PostController {
	
	@GetMapping("/mini_home_view")
	public String miniHomeView() {	
		return "post/miniHome";
	}
	
	@GetMapping("/guest_book_view")
	public String guestBookView() {
		return "post/guestBook";
	}
	
	@GetMapping("/set_up_view")
	public String editView() {
		return "post/setUp";
	}
}
