package com.five.ware.event;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.five.ware.util.RowNum;

@Repository
public class EventDAO {
	
	@Inject
	SqlSession sqlSession;
	private static final String NAMESPACE="eventMapper.";
	
	public int totalCount(RowNum rowNum)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"totalCount");
	}
	
	public List<EventDTO> selectList(RowNum rowNum){
		return sqlSession.selectList(NAMESPACE+"selectList");
	}
	
	public int insert(EventDTO eventDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"insert");
	}
	
	public int update(EventDTO eventDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"update");
	}
	
	public int delete(int eventNum)throws Exception{
		return sqlSession.delete(NAMESPACE+"delete", eventNum);
	}

}
