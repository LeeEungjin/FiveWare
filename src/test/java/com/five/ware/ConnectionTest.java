package com.five.ware;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.five.ware.erp.supplier.SupplierDAO;


public class ConnectionTest extends AbstractTest {

	@Inject
	SqlSession sqlSession;
	
	@Autowired
	SupplierDAO supplierDAO;
	
	@Test
	public void test() {
		try {
			assertNotNull(sqlSession.getConnection());
			System.out.println(sqlSession.getConnection());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
