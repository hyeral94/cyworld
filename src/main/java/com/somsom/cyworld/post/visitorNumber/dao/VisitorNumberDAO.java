package com.somsom.cyworld.post.visitorNumber.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.somsom.cyworld.post.visitorNumber.model.VisitorNumber;

@Repository
public interface VisitorNumberDAO {
	
	public int insertVisitorCount(@Param("userId") int userId);

	public int selectVisitorCount(@Param("userId") int userId);
	
	public VisitorNumber selectVisitorNumber(@Param("userId") int userId);
	
	// today 방문자 수
	public int selectTodayVisitorCount(@Param("userId") int userId);
	
	// total 방문자 수
	public int selectTotalVisitorCount(@Param("userId") int userId);
}
