package com.somsom.cyworld.post.setUp.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.somsom.cyworld.post.setUp.dao.SetUpDAO;

@Service
public class SetUpBO {
	
	@Autowired
	private SetUpDAO setUpDAO;

	public int addMiniHomeIntroduce(int userId, String introduce) {
		return setUpDAO.insertMiniHomeIntroduce(userId, introduce);
	}
	
}
