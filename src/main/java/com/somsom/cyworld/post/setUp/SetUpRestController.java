package com.somsom.cyworld.post.setUp;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.somsom.cyworld.post.setUp.bo.SetUpBO;

@RequestMapping("/post/set_up")
@RestController
public class SetUpRestController {

	@Autowired
	private SetUpBO setUpBO;
	
	//프로필 사진, 프로필 소개말, 상단 인사말 등록
//	@PostMapping("/create")
//	public Map<String, String > setUpCreate(
//			HttpServletRequest request) {
//		
//		HttpSession session = request.getSession()
//	}

}
