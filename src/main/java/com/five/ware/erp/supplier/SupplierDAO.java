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
	
	public List<SupplierDTO> selectList() {
		
		return sqlSession.selectList(NAMESPACE+"selectList");
	}
}
