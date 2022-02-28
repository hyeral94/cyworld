package com.somsom.cyworld.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/post")
@Controller
public class PostController {
	
	@GetMapping("/mini_home_view")
	public String miniHomeView() {
		return "post/miniHome";
	}

}
