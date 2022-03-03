package com.somsom.cyworld.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/main")
@Controller
public class CyworldController {

	@GetMapping("/mini_home_view") 
	public String miniHomeView() {
		return "main/miniHome";
	}
}
