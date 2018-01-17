package com.five.ware.time;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class TimeDAO {

		@Inject
		private SqlSession sqlSession;
		private static final String namespace="timeMapper.";
		
		
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
