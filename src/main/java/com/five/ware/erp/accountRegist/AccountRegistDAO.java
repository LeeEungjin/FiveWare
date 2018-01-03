package com.five.ware.erp.accountRegist;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.five.ware.util.ListData;
import com.five.ware.util.RowNum;

@Repository

public class AccountRegistDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="accountRegistMapper.";
	
	//insert
	public int insert(AccountRegistDTO accountRegistDTO) throws Exception{
		int result=sqlSession.insert(namespace+"insert", accountRegistDTO);
		
		return result;
	}

	//list
	public List<AccountRegistDTO> selectList(RowNum rowNum,ListData listData)throws Exception{
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("startRow", rowNum.getStartRow());
		map.put("lastRow", rowNum.getLastRow());
		map.put("kind", listData.getKind());
		map.put("search", listData.getSearch());
		
		return sqlSession.selectList(namespace+"selectList", map);
	}
	
	//totalCount
	public int totalCount(RowNum rowNum) throws Exception{
		return sqlSession.selectOne(namespace+"totalCount", rowNum);
	}
	
}
