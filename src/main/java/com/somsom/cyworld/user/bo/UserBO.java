package com.somsom.cyworld.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.somsom.cyworld.user.dao.UserDAO;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	public int addUser(String loginId, String password, String name, String email) {
		return userDAO.insertUser(loginId, password, name, email);
	}
	
	public boolean isDuplicateId(String loginId) {
		if(userDAO.selectDuplicateId(loginId) == 0) {//중복이 아님
			return false;
		}else {//중복임
		return true;
		}
	}
}
