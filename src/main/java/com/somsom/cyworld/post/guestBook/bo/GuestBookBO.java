package com.somsom.cyworld.post.guestBook.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.somsom.cyworld.post.guestBook.dao.GuestBookDAO;
import com.somsom.cyworld.post.guestBook.model.GuestBook;
import com.somsom.cyworld.post.setting.dao.SettingDAO;

@Service
public class GuestBookBO {
	
	@Autowired
	private GuestBookDAO guestBookDAO;
	
	@Autowired
	private SettingDAO settingDAO;

	// 방명록 입력
	public int addGuestBook(int userId, String userName, int targetUserId, String content) {
		return guestBookDAO.insertGuestBook(userId, userName, targetUserId, content);
	}
	
	// 입력한 방명록 리스트 targetUserId로 가져오기
	public List<GuestBook> getGuestBookList(int targetUserId){
		return guestBookDAO.selectGuestBook(targetUserId);
	}
	
	// 방명록 삭제
	public int deleteGuestBook(int id, int userId) {
		
		GuestBook guestBook = guestBookDAO.selectGuestBookDelete(id);
		
		if(guestBook.getUserId() != userId) {
			return 0;
		}
		
		return guestBookDAO.deleteGuestBook(id);
	}
	
}
