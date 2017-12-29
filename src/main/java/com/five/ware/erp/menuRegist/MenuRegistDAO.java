package com.five.ware.erp.menuRegist;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MenuRegistDAO {
	
	private SqlSession sqlsession;
	private static final String namespace="menuRegistMapper.";
	
	public int memuRegistinsert(MenuRegistDTO menuRegistDTO)throws Exception{
		return sqlsession.insert(namespace+"menuReigstInsert", menuRegistDTO);
	}
	
}
