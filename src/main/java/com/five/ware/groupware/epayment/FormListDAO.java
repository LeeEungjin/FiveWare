package com.five.ware.groupware.epayment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.five.ware.util.RowNum;

@Repository
public class FormListDAO {

	@Inject
	SqlSession sqlSession;
	private final String NAMESPACE="formListMapper.";
	
	public List<FormListDTO> formList(String search, RowNum rowNum) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("rowNum", rowNum);
		
		List<FormListDTO> ar = sqlSession.selectList(NAMESPACE+"formList", map);
		
		return ar;
	}
	
	public int formListCount(String search, RowNum rowNum) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("rowNum", rowNum);
		
		int result = sqlSession.selectOne(NAMESPACE+"formListCount", map);
		
		return result;
	}
	
	
}
