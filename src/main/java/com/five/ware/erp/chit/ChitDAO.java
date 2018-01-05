package com.five.ware.erp.chit;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.five.ware.erp.accountRegist.AccountRegistDTO;
import com.five.ware.erp.tempRegist.TempRegistDTO;
import com.five.ware.util.ListData;
import com.five.ware.util.RowNum;

@Repository
public class ChitDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="chitMapper.";
	
	
	//delete
	public int delete(String code) throws Exception{
		return sqlSession.delete(namespace+"delete", code);
	}
	//update
	public int update(String code,String approval) throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("code", code);
		map.put("approval", approval);
		
		return sqlSession.update(namespace+"update", map);
	}
	
	//chutApprovalSelectOne
	public ChitDTO chitSelectOne(String code) throws Exception{
		return sqlSession.selectOne(namespace+"approval_selectOne", code);
	}
	
	//totalCount
	public int totalCount(RowNum rowNum) throws Exception{
		
		return sqlSession.selectOne(namespace+"totalCount", rowNum);
	}
	
	//chitApprovalList
	public List<ChitDTO> chitApprovalList(RowNum rowNum,ListData listData,String approval) throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("startRow", rowNum.getStartRow());
		map.put("lastRow", rowNum.getLastRow());
		map.put("kind", listData.getKind());
		map.put("search", listData.getSearch());
		map.put("approval", approval);
		
		return sqlSession.selectList(namespace+"selectList_approval", map);
	}
	
	
	//chitTempList
	public List<TempRegistDTO> chitTempList() throws Exception{
		
		return sqlSession.selectList(namespace+"selectList_temp");
	}
	
	//chitAccountList
	public List<AccountRegistDTO> chitAccountList() throws Exception{
		return sqlSession.selectList(namespace+"selectList_account");
	}
	
	//insert
	public int insert(ChitDTO chitDTO) throws Exception{
		int result=sqlSession.insert(namespace+"insert",chitDTO);
		return result;
	}

}
