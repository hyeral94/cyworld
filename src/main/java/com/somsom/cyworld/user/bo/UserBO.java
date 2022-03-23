package com.somsom.cyworld.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.somsom.cyworld.common.EncryptUtils;
import com.somsom.cyworld.user.dao.UserDAO;
import com.somsom.cyworld.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	//회원가입
	public int addUser(String loginId, String password, String name, String email) {
		
		//비밀번호 암호화
		String encPassword = EncryptUtils.mb5(password);
		
		return userDAO.insertUser(loginId, encPassword, name, email);
		
	}
	
	//아이디 중복 확인
	public boolean isDuplicateId(String loginId) {
		if(userDAO.selectDuplicateId(loginId) == 0) {//중복이 아님
			return false;
		}else {//중복임
			return true;
		}
	}
	
	//로그인
	public User loginUser(String loginId, String password) {
		
		//비밀번호 암호화
		String encPassword = EncryptUtils.mb5(password);
				
		return userDAO.selectUser(loginId, encPassword);
	}
	
}
