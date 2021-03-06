package com.five.ware.erp.supplier;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.junit.Test;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.AbstractTest;
import com.five.ware.util.ListData;

public class SupplierServiceTest extends AbstractTest {

	@Inject
	private SupplierService supplierService;
	
	@Test
	public void test() {
		try {
			this.selectList();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void stop() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("use", "false");
		map.put("code", "A002");
		
		try {
			int result = supplierService.stop(map);
			
			assertTrue(result > 0);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void delete() {
		 try {
			int result = supplierService.delete("test 03");
			
			assertTrue(result > 0);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void update() {
		SupplierDTO supplierDTO = new SupplierDTO();
		supplierDTO.setCode("test 01");
		supplierDTO.setAccount_number("test 01");
		supplierDTO.setBank("test 01");
		supplierDTO.setBusiness_number("test 01");
		supplierDTO.setClassification("test 01");
		supplierDTO.setDivision("test 01");
		supplierDTO.setDivision_mail("test 01");
		supplierDTO.setRepresentative("test 01");
		supplierDTO.setName("test 01");
		supplierDTO.setUse("true");
		
		try {
			supplierService.update(supplierDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void selectOne() {
		SupplierDTO supplierDTO;
		try {
			supplierDTO = supplierService.selectOne("A002");
			
			System.out.println(supplierDTO.getName());
			
			assertNotNull(supplierDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void insert() throws Exception {
		SupplierDTO supplierDTO = new SupplierDTO();
		supplierDTO.setCode("test 03");
		supplierDTO.setAccount_number("test 03");
		supplierDTO.setBank("test 03");
		supplierDTO.setBusiness_number("test 03");
		supplierDTO.setClassification("test 03");
		supplierDTO.setDivision("test 03");
		supplierDTO.setDivision_mail("test 03");
		supplierDTO.setRepresentative("test 03");
		supplierDTO.setName("test 03");
		supplierDTO.setUse("true");
		
		int result = supplierService.insert(supplierDTO);
		System.out.println(result);
		
		assertTrue(result > 0);
	}
	
	public void selectList() throws Exception {
		ListData listData = new ListData();
		listData.setSearch("");
		ModelAndView mv = supplierService.selectList(listData);
		
		assertNotNull(mv);
		
		Map<String, Object> map = mv.getModel();
		
		@SuppressWarnings("unchecked")
		List<SupplierDTO> ar = (List<SupplierDTO>)map.get("list");
		
		for (SupplierDTO supplierDTO : ar) {
			System.out.println(supplierDTO.getCode());
		}
	}

}
