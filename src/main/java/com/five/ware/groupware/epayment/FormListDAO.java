package com.five.ware.groupware.epayment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class FormListDAO {

	@Inject
	SqlSession sqlSession;
	private final String NAMESPACE="formListMapper.";
	
	public List<FormListDTO> formList(String search) throws Exception{
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("search", search);
		
		List<FormListDTO> ar = sqlSession.selectList(NAMESPACE+"formList", map);
		
		return ar;
	}
}
