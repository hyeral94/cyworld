package com.somsom.cyworld.post.guestBook.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.somsom.cyworld.post.guestBook.model.GuestBook;

@Repository
public interface GuestBookDAO {

	public int insertGuestBook(
			@Param("userId") int userId,
			@Param("userName") String userName,
			@Param("targetUserId") int targetUserId,
			@Param("content") String content);
		
	
	public List<GuestBook> selectGuestBook(@Param("targetUserId") int targetUserId);
	
	// 방명록 삭제
	public int deleteGuestBook(@Param("id") int id);
	
	public GuestBook selectGuestBookDelete(@Param("id") int id);
}
