package com.five.ware.mater;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MaterDAO {
	
	@Inject 
	SqlSession sqlSession;
	private static final String namespace="materMapper.";
	
	public int insert(MaterDTO materDTO)throws Exception{
		return sqlSession.insert(namespace+"insert", materDTO);
	}
	
	public List<MaterDTO> selectList(String materKind)throws Exception{
		return sqlSession.selectList(namespace+"selectList", materKind);
	}
	
	public MaterDTO selectOne(String materCode)throws Exception{
		return sqlSession.selectOne(namespace+"selectOne", materCode);
	}
	
	public int update(MaterDTO materDTO)throws Exception{
		return sqlSession.update(namespace+"update", materDTO);
	}
	
	public int delete(String materCode)throws Exception{
		return sqlSession.delete(namespace+"delete", materCode);
	}
}
