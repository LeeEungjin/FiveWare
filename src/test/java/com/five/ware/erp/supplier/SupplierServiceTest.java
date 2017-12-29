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
			this.selectList();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
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
