package com.five.ware.time;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class TimeDAO {

		@Inject
		private SqlSession sqlSession;
		private static final String namespace="timeMapper.";
		
		
		
		//selectOne list
		public List<TimeDTO> selectOneList(String memberCode)throws Exception{
			return sqlSession.selectList(namespace+"selectOneList",memberCode);
		}
		
		
		//selectOne
		public TimeDTO selectOne(TimeDTO timeDTO)throws Exception{
			return sqlSession.selectOne(namespace+"selectOne", timeDTO);
		}
		
		
		//update
		public int update(TimeDTO timeDTO) throws Exception{
			
			int result=sqlSession.update(namespace+"update",timeDTO);
			
			return result;
		}
		
		
		//insert
		public int insert(TimeDTO timeDTO) throws Exception{
			int result=sqlSession.insert(namespace+"insert", timeDTO);
			
			return result;
		}
		
		
}
