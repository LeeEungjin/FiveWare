package com.five.ware.community;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.five.ware.event.EventDTO;

@Repository
public class UploadDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="uploadMapper.";
	
	public int insert(UploadDTO uploadDTO){
		return sqlSession.insert(namespace+"insert", uploadDTO);
	}
	
	public List<UploadDTO> selectList(int num)throws Exception{
		return sqlSession.selectList(namespace+"selectList", num);
	}
	
	public CommunityDTO selectOne(int num)throws Exception{
		return sqlSession.selectOne(namespace+"selectOne", num);
	}
	
	public int delete(int fnum)throws Exception{
		return sqlSession.delete(namespace+"delete", fnum);
	}
	
	public int deleteNum(int num)throws Exception{
		return sqlSession.delete(namespace+"deleteNum", num);
	}

	
}
