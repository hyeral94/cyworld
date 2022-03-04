package com.somsom.cyworld.post.friendReview.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.somsom.cyworld.post.friendReview.dao.FriendReviewDAO;
import com.somsom.cyworld.post.friendReview.model.FriendReview;
import com.somsom.cyworld.post.friendReview.model.FriendReviewDetail;


@Service
public class FriendReviewBO {

	@Autowired
	private FriendReviewDAO friendReviewDAO;
	
	@Autowired
	private FriendReviewBO friendReviewBO;
	
	//일촌평 입력
	public int addFriendReview(int userId, String userName, int targetUserId, String content) {
		return friendReviewDAO.insertFriendReview(userId, userName, targetUserId, content);
	}
	
	//입력한 일촌평 리스트 가져오기
	public List<FriendReviewDetail> getFriendReviewList(int userId) {
		
		List<FriendReview> friendReviewList = friendReviewDAO.selectFriendReview();
		
		List<FriendReviewDetail> friendReviewDetailList = new ArrayList<>();
		
		for(FriendReview friendReview:friendReviewList) {
			
			List<FriendReviewDetail> commentList = friendReviewBO.getFriendReviewList(friendReview.getId());
			
			FriendReviewDetail friendReviewDetail = new FriendReviewDetail();
			friendReviewDetail.setFriendReview(friendReview);
			
			friendReviewDetailList.add(friendReviewDetail);
		}
		
		return friendReviewDetailList;
		
	}

}
