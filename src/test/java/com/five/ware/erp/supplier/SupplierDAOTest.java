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
			this.update();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void update() {
		SupplierDTO supplierDTO = new SupplierDTO();
		supplierDTO.setCode("test 01");
		supplierDTO.setAccount_number("test 03");
		supplierDTO.setBank("test 03");
		supplierDTO.setBusiness_number("test 03");
		supplierDTO.setClassification("test 03");
		supplierDTO.setDivision("test 03");
		supplierDTO.setDivision_mail("test 03");
		supplierDTO.setRepresentative("test 03");
		supplierDTO.setName("test 03");
		supplierDTO.setUse("true");
		
		supplierDAO.update(supplierDTO);
	}
	
	public void selectOne() {
		SupplierDTO supplierDTO = supplierDAO.selectOne("A002");
		System.out.println(supplierDTO.getName());
		
		assertNotNull(supplierDTO);
	}
	
	public void insert() {
		SupplierDTO supplierDTO = new SupplierDTO();
		supplierDTO.setCode("test 02");
		supplierDTO.setAccount_number("test 02");
		supplierDTO.setBank("test 02");
		supplierDTO.setBusiness_number("test 02");
		supplierDTO.setClassification("test 02");
		supplierDTO.setDivision("test 02");
		supplierDTO.setDivision_mail("test 02");
		supplierDTO.setRepresentative("test 02");
		supplierDTO.setName("test 02");
		supplierDTO.setUse("true");
		
		int result = supplierDAO.insert(supplierDTO);
		System.out.println(result);
		
		assertTrue(result > 0);
		
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
