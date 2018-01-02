package com.five.ware.erp.menuRegist;

import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.five.ware.util.RowNum;


@Repository
public class MenuRegistDAO {
	
	@Inject
	private SqlSession sqlsession;
	private static final String namespace="menuRegistMapper.";
	
	public int memuRegistinsert(MenuRegistDTO menuRegistDTO)throws Exception{
		return sqlsession.insert(namespace+"menuReigstInsert", menuRegistDTO);
	}
	
	public List<MenuRegistDTO> selectList(RowNum rowNum)throws Exception{
		return sqlsession.selectList(namespace+"selectList",rowNum);
	}
	
	public int totalCount(RowNum rowNum )throws Exception{
		return sqlsession.selectOne(namespace+"totalCount", rowNum);
	}
	
	public MenuRegistDTO selectOne(String menuCode)throws Exception{
		return sqlsession.selectOne(namespace+"selectOne", menuCode);
	}
	
	public int update(MenuRegistDTO menuRegistDTO)throws Exception{
		return sqlsession.update(namespace+"update", menuRegistDTO);
	}
	
	public int delete(String menuCode)throws Exception{
		return sqlsession.delete(namespace+"delete", menuCode);
	}
}
