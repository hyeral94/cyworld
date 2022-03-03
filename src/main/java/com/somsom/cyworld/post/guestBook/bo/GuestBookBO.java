package com.somsom.cyworld.post.guestBook.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.somsom.cyworld.post.guestBook.dao.GuestBookDAO;

@Service
public class GuestBookBO {
	
	@Autowired
	private GuestBookDAO guestBookDAO;

	public int addGuestBook(int usedId, String content) {
		return guestBookDAO.insertGuestBook(usedId, content);
	}
}
