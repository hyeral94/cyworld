package com.somsom.cyworld.post.visitorNumber.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.somsom.cyworld.post.visitorNumber.dao.VisitorNumberDAO;
import com.somsom.cyworld.post.visitorNumber.model.VisitorNumber;

@Service
public class VisitorNumberBO {

	@Autowired
	private VisitorNumberDAO visitorNumberDAO;
	
	public int addVisitorCount(int userId) {
		return visitorNumberDAO.insertVisitorCount(userId);
	}
	
	// 방문자 수 가져오기
	public int getVisitorCount(int userid) {
		return visitorNumberDAO.selectVisitorCount(userid);
	}
	
	public VisitorNumber getVisitorNumber(int userId){
		return visitorNumberDAO.selectVisitorNumber(userId);
	}
	
	// today 방문자 수
	public int todayVisitorNumber(int userId) {
		return visitorNumberDAO.selectTodayVisitorCount(userId);
	}
	
	// total 방문자 수
	public int totalVisitorNumber(int userId) {
		return visitorNumberDAO.selectTotalVisitorCount(userId);
	}
	
	// userId로 방문 여부 확인
//	public boolean isConnectVisitor(int userId) {
//		int count = visitorNumberDAO.selectVisitorCount(userId);
//		
//		if(count == 1) {
//			return true;
//		}else {
//			return false;
//		}
//	}
//	
	// 방문자 수 카운트가 되었는지 아닌지 확인
//	public boolean visitorCount(int userId) {
//		
//		if(this.isConnectVisitor(userId)) {
//			return true;
//		}else {
//			visitorNumberDAO.insertVisitorCount(userId);
//			return false;
//		}
//		
//	}


	
}
