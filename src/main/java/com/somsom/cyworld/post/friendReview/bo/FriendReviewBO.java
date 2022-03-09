package com.somsom.cyworld.post.friendReview.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.somsom.cyworld.post.friendReview.dao.FriendReviewDAO;
import com.somsom.cyworld.post.friendReview.model.FriendReview;

@Service
public class FriendReviewBO {

	@Autowired
	private FriendReviewDAO friendReviewDAO;
	
	//일촌평 입력
	public int addFriendReview(int userId, String userName, int targetUserId, String content) {
		return friendReviewDAO.insertFriendReview(userId, userName, targetUserId, content);
	}
	
	//입력한 일촌평 리스트 targetUserId 로 가져오기
	public List<FriendReview> getFriendReview(int targetUserId){
		return friendReviewDAO.selectFriendReview(targetUserId);
	
	}
	
	//일촌평 삭제
	public int deleteFriendReview(int userId) {
		return friendReviewDAO.deleteFriendReview(userId);
	}
}


