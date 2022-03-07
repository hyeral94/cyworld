package com.somsom.cyworld.post.guestBook.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface GuestBookDAO {

	public int insertGuestBook(
			@Param("usedId") int usedId,
			@Param("userName") String userName,
			@Param("targetUserId") int targetUserId,
			@Param("content") String content);
		
	
}
