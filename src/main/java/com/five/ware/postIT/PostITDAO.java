package com.five.ware.postIT;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PostITDAO {
	
	@Inject
	SqlSession sqlSession;
	private static final String NAMESPACE="postITMapper.";
	
	public List<PostITDTO> postList(String store)throws Exception{
		return sqlSession.selectList(NAMESPACE+"postList", store);
	}
	
	public int postInsert(PostITDTO postITDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"postInsert", postITDTO);
	}
	
	public PostITDTO postView(int num)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"postView", num);
	}
	
	public int postDelete(int num)throws Exception{
		return sqlSession.delete(NAMESPACE+"postDelete", num);
	}
}
