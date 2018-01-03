package com.five.ware.erp.menuRegist;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public List<MenuRegistDTO> selectList(RowNum rowNum, String order, String menukind)throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("kind", rowNum.getKind());
		map.put("search", rowNum.getSearch());
		map.put("startRow", rowNum.getStartRow());
		map.put("lastRow", rowNum.getLastRow());
		map.put("order", order);
		map.put("menukind", menukind);
		
		
		return sqlsession.selectList(namespace+"selectList",map);
	}
	
	public int totalCount(RowNum rowNum, String menukind )throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("kind", rowNum.getKind());
		map.put("search", rowNum.getSearch());
		map.put("menukind", menukind);
		
		
		return sqlsession.selectOne(namespace+"totalCount", map);
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
