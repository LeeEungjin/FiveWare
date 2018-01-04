package com.five.ware.erp.supplier;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class SupplierDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "supplierMapper.";
	
	public int update(SupplierDTO supplierDTO) {
		return sqlSession.update(NAMESPACE+"supplierUpdate", supplierDTO);
	}
	
	public List<SupplierDTO> selectList() {
		return sqlSession.selectList(NAMESPACE+"supplierList");
	}
	
	public int insert(SupplierDTO supplierDTO) {
		int result = 0;

		String code = sqlSession.selectOne(NAMESPACE+"makeCode");
		supplierDTO.setCode(code);
		
		if(!supplierDTO.getCode().equals("")) {
			result = sqlSession.insert(NAMESPACE+"supplierWrite", supplierDTO);
		} else {
			result = 0;
		}
		
		return result;
	}
	
	public SupplierDTO selectOne(String code) {
		return sqlSession.selectOne(NAMESPACE+"supplierOne", code);
	}
}
