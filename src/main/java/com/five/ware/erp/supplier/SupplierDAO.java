package com.five.ware.erp.supplier;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.five.ware.util.RowNum;

@Repository
public class SupplierDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "supplierMapper.";
	
	
	public int stop(Map<String, String> map) {
		return sqlSession.update(NAMESPACE+"supplierStop", map);
	}
	
	public int delete(String code) {
		return sqlSession.delete(NAMESPACE+"supplierDelete", code);
	}
	
	public int update(SupplierDTO supplierDTO) {
		return sqlSession.update(NAMESPACE+"supplierUpdate", supplierDTO);
	}
	
	
	public int insert(SupplierDTO supplierDTO) {
		/*int result = 0;

		
		if(!supplierDTO.getCode().equals("")) {
			result = sqlSession.insert(NAMESPACE+"supplierWrite", supplierDTO);
		} else {
			result = 0;
		}*/
		
		return sqlSession.insert(NAMESPACE+"supplierWrite", supplierDTO);
	}
	
	public SupplierDTO selectOne(String code) {
		return sqlSession.selectOne(NAMESPACE+"supplierOne", code);
	}
	
	public int totalCount(RowNum rowNum) {
		String[] search = new String[2];
		
		if(rowNum.getSearch().equals("")) {
			for (int i = 0; i < search.length; i++) {
				search[i] = "";
			}
		} else {
			search = rowNum.getSearch().split(",", 2);
		}
		System.out.println("SupplierDAO - totalCount - search[0]: "+search[0]);
		System.out.println("SupplierDAO - totalCount - search[1]: "+search[1]);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("kind", rowNum.getKind());
		map.put("search1", search[0]);
		map.put("search2", search[1]);
		
		return sqlSession.selectOne(NAMESPACE+"totalCount", map);
	}
	
	public List<SupplierDTO> selectList(RowNum rowNum) {
		String[] search = new String[2];
		
		if(rowNum.getSearch().equals("")) {
			for (int i = 0; i < search.length; i++) {
				search[i] = "";
			}
		} else {
			search = rowNum.getSearch().split(",", 2);
		}
		System.out.println("SupplierDAO - selectList - search[0]: "+search[0]);
		System.out.println("SupplierDAO - selectList - search[1]: "+search[1]);

		
		Map<String, Object>  map = new HashMap<String, Object>();
		map.put("startRow", rowNum.getStartRow());
		map.put("lastRow", rowNum.getLastRow());
		map.put("kind", rowNum.getKind());
		map.put("search1", search[0]);
		map.put("search2", search[1]);
		 
		return sqlSession.selectList(NAMESPACE+"supplierList", map);
	}

}
