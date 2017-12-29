package com.five.ware.erp.supplier;

import static org.junit.Assert.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;

import com.five.ware.AbstractTest;

public class SupplierDAOTest extends AbstractTest {
	
	@Inject
	private SupplierDAO supplierDAO;

	@Test
	public void test() {
		try {
			this.repository();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void repository() {
		assertNotNull(supplierDAO);
	}
	
	public void selectList() throws Exception {
		List<SupplierDTO> ar = supplierDAO.selectList();
		
		assertTrue(ar.size() > 0);
		
		for (SupplierDTO supplierDTO : ar) {
			System.out.println("CODE: "+ supplierDTO.getCode());
		}
	}

}
