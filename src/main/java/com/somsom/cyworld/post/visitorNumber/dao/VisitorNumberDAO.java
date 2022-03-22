package com.somsom.cyworld.post.visitorNumber.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface VisitorNumberDAO {

	public int insertVisitorNumber(@Param("userId") int userId);
	
	public int getTodayVisitorNumber(@Param("userId") int userId);
	
	public int getTotalVisitorNumber(@Param("userId") int userId);
}
