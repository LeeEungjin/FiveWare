package com.five.ware.cloud;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CloudFileDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static String NAMESPACE = "cloudFileMapper.";
	
	public List<CloudFileDTO> fileList(String code, String foldername) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", code);
		map.put("filename", foldername);
		
		return sqlSession.selectList(NAMESPACE+"fileList", map);
	}
	
	public List<CloudFileDTO> selectList(String oriname) throws Exception {
		return sqlSession.selectList(NAMESPACE+"selectList", oriname);
	}
	
	public CloudFileDTO selectOne(String filename) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"selectOne", filename);
	}
	
	public int insert(CloudFileDTO cloudFileDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"insert", cloudFileDTO);
	}

}
