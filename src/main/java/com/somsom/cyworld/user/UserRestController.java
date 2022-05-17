package com.somsom.cyworld.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.somsom.cyworld.user.bo.UserBO;
import com.somsom.cyworld.user.model.User;


@RequestMapping("/user")
@RestController
public class UserRestController {

	@Autowired
	private UserBO userBO;
	
	//회원가입
	@PostMapping("/sign_up")
	public Map<String, String> signUp(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("email") String email) {
		
		int count = userBO.addUser(loginId, password, name, email);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	//아이디 중복확인
	@GetMapping("/is_duplicate_id")
	public Map<String, Boolean> isDuplicateId(@RequestParam("loginId") String loginId) {
		
		Map<String, Boolean> result = new HashMap<>();
		if(userBO.isDuplicateId(loginId)) {
			result.put("id_duplicate", true);
		}else {
			result.put("id_duplicate", false);
		}
		return result;
	}
	
	//로그인
	@PostMapping("/sign_in")
	public Map<String, Object> signIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpServletRequest request) {
		
		User user = userBO.loginUser(loginId, password);
		
		Map<String, Object> result = new HashMap<>();
		
		if(user != null) {
			result.put("result", "success");
			result.put("userId", user.getId());
		
			HttpSession session = request.getSession();

			session.setAttribute("userId", user.getId());
			session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("userName", user.getName());
			
		}else {
			result.put("result", "fail");
		}
		
		return result;
	}
}
