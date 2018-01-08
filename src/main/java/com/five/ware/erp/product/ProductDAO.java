package com.five.ware.erp.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.five.ware.util.RowNum;

@Repository
public class ProductDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "productMapper.";
	
	public void selectOne() {
		//////////////////////////
	}
	
	public int insert(ProductDTO productDTO) {
		return sqlSession.insert(NAMESPACE+"productInsert", productDTO);
	}
	
	public int totalCount(RowNum rowNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("kind", rowNum.getKind());
		map.put("search", rowNum.getSearch());
		
		return sqlSession.selectOne(NAMESPACE+"totalCount", map);
	}
	
	public List<ProductDTO> selectList(RowNum rowNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", rowNum.getStartRow());
		map.put("lastRow", rowNum.getLastRow());
		map.put("kind", rowNum.getKind());
		map.put("search", rowNum.getSearch());
		
		System.out.println("search: "+ rowNum.getSearch());
		
		return sqlSession.selectList(NAMESPACE+"productList", map);
	}
}
