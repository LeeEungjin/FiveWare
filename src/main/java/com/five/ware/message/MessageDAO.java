package com.five.ware.message;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="messageMapper.";
	
	
	//읽지않은 갯수
	public int readCount(String rCode)throws Exception{
		int result=sqlSession.selectOne(namespace+"readCount",rCode);
		return result;
	}
	
	//delete
	public int delete(int num)throws Exception{
		int result=sqlSession.delete(namespace+"delete",num);
		return result;
	}
	
	//update
	public int readUpdate(int num)throws Exception{
		
		return sqlSession.update(namespace+"readUpdate", num);
	}
	
	//selectOne
	public MessageDTO selectOne(int num)throws Exception{
		
		return sqlSession.selectOne(namespace+"selectOne", num);
	}
	
	//받은쪽지함
	public List<MessageDTO> rList(String rCode)throws Exception{
		return sqlSession.selectList(namespace+"rList", rCode);
	}
	
	//보낸쪽지함
	public List<MessageDTO> sList(String sCode)throws Exception{
	
		
		return sqlSession.selectList(namespace+"sList", sCode);
	}
	//insert
	public int insert(MessageDTO messageDTO)throws Exception{
		int result=sqlSession.insert(namespace+"insert", messageDTO);
		return result;
	}

}
