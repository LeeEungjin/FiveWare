package com.five.ware.cloud;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CloudFileDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static String NAMESPACE = "cloudFileMapper.";
	
	public CloudFileDTO selectOne(String filename) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"selectOne", filename);
	}
	
	public int insert(CloudFileDTO cloudFileDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"insert", cloudFileDTO);
	}

}
