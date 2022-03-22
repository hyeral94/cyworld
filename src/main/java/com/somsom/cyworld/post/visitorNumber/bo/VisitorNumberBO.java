package com.somsom.cyworld.post.visitorNumber.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.somsom.cyworld.post.visitorNumber.dao.VisitorNumberDAO;

@Service
public class VisitorNumberBO {

	@Autowired
	private VisitorNumberDAO visitorNumberDAO;
	
	public int addVisitorNumber(int userId) {
		return visitorNumberDAO.insertVisitorNumber(userId);
	}
	
//	public int countTodayVisitorNumber(int userId) {
//		return visitorNumberDAO.getTodayVisitorNumber(userId);
//	}
	
//	public int countTotalVisitorNumber(int userId) {
//		return visitorNumberDAO.getTotalVisitorNumber(userId);
//	}
}
