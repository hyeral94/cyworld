package com.somsom.cyworld.post.guestBook.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.somsom.cyworld.post.guestBook.dao.GuestBookDAO;
import com.somsom.cyworld.post.guestBook.model.GuestBook;

@Service
public class GuestBookBO {
	
	@Autowired
	private GuestBookDAO guestBookDAO;

	// 방명록 입력
	public int addGuestBook(int userId, String userName, int targetUserId, String content) {
		return guestBookDAO.insertGuestBook(userId, userName, targetUserId, content);
	}
	
	// 입력한 방명록 리스트 targetUserId로 가져오기
	public List<GuestBook> getGuestBookList(int targetUserId){
		return guestBookDAO.selectGuestBook(targetUserId);
	}
	
	// 방명록 삭제
	public int deleteGuestBook(int id, int targetUserId) {
		
		GuestBook guestBook = guestBookDAO.selectGuestBookDelete(id);
		
		if(guestBook.getTargetUserId() != targetUserId) {
			return 0;
		}
		
		return guestBookDAO.deleteGuestBook(id);
	}
	
}
