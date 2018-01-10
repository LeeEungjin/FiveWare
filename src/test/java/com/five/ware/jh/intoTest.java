package com.five.ware.jh;

import static org.junit.Assert.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;

import com.five.ware.AbstractTest;
import com.five.ware.erp.into.IntoDAO;
import com.five.ware.erp.product.ProductDTO;
import com.five.ware.erp.supplier.SupplierDTO;

public class intoTest extends AbstractTest {
	
	@Inject
	private IntoDAO intoDAO;
	

	@Test
	public void test() {
		try {
			supplier();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void supplier() throws Exception {
		try {
			List<SupplierDTO> ar = intoDAO.intoSupplier();
			
			
			assertTrue(ar.size() > 0);
			
			for (SupplierDTO supplierDTO : ar) {
				System.out.println(supplierDTO.getCode());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void product() throws Exception {
		List<ProductDTO> ar = intoDAO.intoProduct();
		
		assertTrue(ar.size() > 0);
		
		for (ProductDTO productDTO : ar) {
			System.out.println(productDTO);
		}
	}

}
