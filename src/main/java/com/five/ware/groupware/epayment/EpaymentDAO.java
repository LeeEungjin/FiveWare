package com.five.ware.groupware.epayment;



import java.util.List; 
import java.util.HashMap;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.five.ware.util.ListData;
import com.five.ware.util.RowNum;

@Repository
public class EpaymentDAO {

	@Inject
	SqlSession sqlSession;
	private final String NAMESPACE="epaymentMapper.";
	
	//delete
	public int epaymentDelete(String num)throws Exception{
		int result=sqlSession.delete(NAMESPACE+"delete", num);
		return result;
	}
	
	//selectOne
	public EpaymentDTO epaymentView(String num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"selectOne", num);
	}
	
	
	//insert
	public int epaymentInsert(EpaymentDTO epaymentDTO) throws Exception{
		int result = sqlSession.insert(NAMESPACE+"epaymentInsert", epaymentDTO);
		
		return result;
	}


	public List<String> tempList() throws Exception{
		
		List<String> temps=sqlSession.selectList(NAMESPACE+"tempList");
		
		return temps;
	}


	//list
	public List<EpaymentDTO> epaymentList(RowNum rowNum, ListData listData) throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("startRow", rowNum.getStartRow());
		map.put("lastRow", rowNum.getLastRow());
		map.put("kind", listData.getKind());
		map.put("search", listData.getSearch());
		map.put("result", rowNum.getResult());
		
		return sqlSession.selectList(NAMESPACE+"selectList", map);
	}
	
	//totalCount
	public int totalCount(RowNum rowNum) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"totalCount", rowNum);

	}
}
