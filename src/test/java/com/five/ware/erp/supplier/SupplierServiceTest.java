package com.five.ware.erp.supplier;

import static org.junit.Assert.*;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.junit.Test;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.AbstractTest;

public class SupplierServiceTest extends AbstractTest {

	@Inject
	private SupplierService supplierService;
	
	@Test
	public void test() {
		try {
			this.insert();
			
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
		ModelAndView mv = supplierService.selectList();
		
		assertNotNull(mv);
		
		Map<String, Object> map = mv.getModel();
		
		@SuppressWarnings("unchecked")
		List<SupplierDTO> ar = (List<SupplierDTO>)map.get("list");
		
		for (SupplierDTO supplierDTO : ar) {
			System.out.println(supplierDTO.getCode());
		}
	}

}
