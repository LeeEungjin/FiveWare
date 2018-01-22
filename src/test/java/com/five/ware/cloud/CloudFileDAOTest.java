package com.five.ware.cloud;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.five.ware.AbstractTest;

public class CloudFileDAOTest extends AbstractTest {

	@Autowired
	CloudFileDAO cloudfileDAO;
	
	@Test
	public void test() {
		assertNotNull(cloudfileDAO);
	}
	
	@Test
	public void cloud() {
		try {
			this.selectOne();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void selectOne() throws Exception {
		CloudFileDTO cloudFileDTO =  cloudfileDAO.selectOne("1");
		
		assertNotNull(cloudFileDTO);
		
		System.out.println(cloudFileDTO.getOriname());
	}
	
	public void insert() throws Exception {
		CloudFileDTO cloudFileDTO = new CloudFileDTO();
		
		cloudFileDTO.setFilename("1");
		cloudFileDTO.setFnum(1);
		cloudFileDTO.setOriname("1");
		
		int result = cloudfileDAO.insert(cloudFileDTO);
		assertTrue(result > 0);
	}

}
