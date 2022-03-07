package com.somsom.cyworld.post.guestBook.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.somsom.cyworld.post.guestBook.dao.GuestBookDAO;

@Service
public class GuestBookBO {
	
	@Autowired
	private GuestBookDAO guestBookDAO;

	// 방명록 입력
	public int addGuestBook(int usedId, String userName, int targetUserId, String content) {
		return guestBookDAO.insertGuestBook(usedId, userName, targetUserId, content);
	}
	
	// 입력한 방명록 리스트 targetUserId로 가져오기
}
