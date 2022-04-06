package com.somsom.cyworld.post.diary.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.somsom.cyworld.post.diary.model.Diary;

@Repository
public interface DiaryDAO {

	public int insertDiary(
			@Param("userId") int userId,
			@Param("subject") String subject,
			@Param("content") String content);
			//@Param("imagePath") String imagePath);
	
	public List<Diary> selectDiaryList(@Param("userId") int userId);
	
}