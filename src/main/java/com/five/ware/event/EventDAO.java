package com.five.ware.event;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.five.ware.community.NumFileDTO;
import com.five.ware.mater.MaterDTO;
import com.five.ware.util.RowNum;

@Repository
public class EventDAO {
	
	@Inject
	SqlSession sqlSession;
	private static final String NAMESPACE="eventMapper.";
	
	public int totalCount(RowNum rowNum)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"totalCount", rowNum);
	}
	
	public List<EventDTO> eventDateList(String sdate, String edate)throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		
		map.put("sdate", sdate);
		map.put("edate", edate);
		
		return sqlSession.selectList(NAMESPACE+"eventDateList", map);
	}
	
	public List<EventDTO> selectList(RowNum rowNum){
		return sqlSession.selectList(NAMESPACE+"selectList", rowNum);
	}
	
	public int insert(EventDTO eventDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"insert", eventDTO);
	}
	
	public EventDTO selectOne(int eventNum)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"selectOne", eventNum);
	}
	
	public NumFileDTO fileOne(int eventNum)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"fileOne", eventNum);
	}
	
	public int update(EventDTO eventDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"update", eventDTO);
	}
	
	public int delete(int eventNum)throws Exception{
		return sqlSession.delete(NAMESPACE+"delete", eventNum);
	}
	
	public int getNum()throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getNum");
	}

}
