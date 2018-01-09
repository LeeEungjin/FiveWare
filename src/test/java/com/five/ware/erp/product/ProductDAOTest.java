package com.five.ware.erp.product;

import static org.junit.Assert.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;

import com.five.ware.AbstractTest;
import com.five.ware.util.RowNum;

public class ProductDAOTest extends AbstractTest {
	
	@Inject
	private ProductDAO productDAO;

	@Test
	public void test() {
		delete();
	}
	
	
	public void delete() {
		String code = "A042";
		int reuslt = productDAO.delete(code);
		
		assertTrue(reuslt > 0);
	}
	
	public void update() {
		ProductDTO productDTO = new ProductDTO();
		
		productDTO.setCode("A028");
		productDTO.setMemo("memo");
		productDTO.setName("name");
		productDTO.setPrice("777");
		productDTO.setStandard("standard");
		
		int result = productDAO.update(productDTO);
		
		assertTrue(result > 0);
	}

	
	public void selectOne() {
		String code = "A027";
		ProductDTO productDTO = productDAO.selectOne(code);
		
		assertNotNull(productDTO);
		
		System.out.println(productDTO.getCode());
		System.out.println(productDTO.getName());
	}
	
	public void insert() {
		ProductDTO productDTO = new ProductDTO();
		productDTO.setCode("1");
		productDTO.setMemo("memo");
		productDTO.setName("name");
		productDTO.setPrice("price");
		productDTO.setStandard("standard");
		productDTO.setUse("true");
		
		int result = productDAO.insert(productDTO);
		
		assertTrue(result > 0);
	}
	
	public void totalCount() {
		RowNum rowNum = new RowNum();
		rowNum.setKind("code");
		rowNum.setSearch("1");
		
		int result = productDAO.totalCount(rowNum);
		
		assertTrue(result > 0);
		System.out.println(result);
	}
	
	public void selectList() {
		RowNum rowNum = new RowNum();
		rowNum.setStartRow(1);
		rowNum.setLastRow(3);
		rowNum.setKind("code");
		rowNum.setSearch("1");
		
		List<ProductDTO> ar = productDAO.selectList(rowNum);
		
		assertTrue(ar.size() > 0);
		
		for (ProductDTO productDTO : ar) {
			System.out.println(productDTO.getCode());
			System.out.println("++++++++++++++++++++++++++");
			
		}
		
	}
}
