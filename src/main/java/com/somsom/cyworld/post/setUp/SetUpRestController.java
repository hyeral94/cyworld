package com.somsom.cyworld.post.setUp;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.somsom.cyworld.post.setUp.bo.SetUpBO;

@RequestMapping("/post/set_up")
@RestController
public class SetUpRestController {

	@Autowired
	private SetUpBO setUpBO;
	
	//미니홈피 상단 소개말 등록
	@PostMapping("mini_home_introduce")
	public Map<String, String> minoHomeIntroduce(
			@RequestParam("userId") int userId,
			@RequestParam("introduce") String introduce) {
		
		int count = setUpBO.addMiniHomeIntroduce(userId, introduce);

		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
	}
}
