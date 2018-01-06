package com.five.ware.erp.product;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.five.ware.AbstractTest;

public class ProductServiceTest extends AbstractTest {
	
	@Autowired
	private ProductService productService;

	@Test
	public void test() {
		assertNotNull(productService);
	}

	@Test
	public void service() {
		selectList();
	}
	
	public void selectList() {
		/*try {
			List<ProductDTO> ar = productService.selectList();
			assertTrue(ar.size() > 0);
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		
	}
}
