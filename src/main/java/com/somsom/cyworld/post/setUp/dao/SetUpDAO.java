package com.somsom.cyworld.post.setUp.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface SetUpDAO {

	public int insertMiniHomeIntroduce(@Param("userId") int userId, @Param("introduce") String introduce);
}
