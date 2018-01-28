package com.five.ware.cloud;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CloudDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "cloudMapper.";
	
	public int insert(CloudDTO cloudDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"cloudInsert", cloudDTO);
	}
	
	public List<CloudDTO> selectList(String code, String uppername) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", code);
		map.put("uppername", uppername);
		System.out.println("CloudDAO - uppername : "+uppername);
		
		return sqlSession.selectList(NAMESPACE+"cloudList", map);
	}
}
