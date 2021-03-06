package com.somsom.cyworld.post.diary.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.somsom.cyworld.post.diary.dao.DiaryDAO;
import com.somsom.cyworld.post.diary.model.Diary;

@Service
public class DiaryBO {

	@Autowired
	private DiaryDAO diaryDAO;
	
	// 다이어리 작성
	public int addDiary(int userId, String userName, String subject, String content) {
		
		return diaryDAO.insertDiary(userId, userName, subject, content);
	}
	
	// 다이어리 리스트 가져오기
	public List<Diary> getDiaryList(int userId){
		return diaryDAO.selectDiaryList(userId);
	}
	
	// 다이어리 삭제
	public int deleteDiary(int id) {
		return diaryDAO.deleteDiary(id);
	}
}
