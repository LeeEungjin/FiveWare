package com.five.ware.cloud;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.five.ware.AbstractTest;

public class CloudDAOTest extends AbstractTest {

	@Autowired
	CloudDAO cloudDAO;
	
	@Test
	public void test() {
		assertNotNull(cloudDAO);
	}
	
	@Test
	public void cloud() {
		insert();
	}
	
	public void insert() {
		CloudDTO cloudDTO = new CloudDTO();
		cloudDTO.setCode("asd");
		cloudDTO.setFoldername("masdl");
		cloudDTO.setFolderpath("ajd");
		
		int result = 0;
		try {
			result = cloudDAO.insert(cloudDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		assertTrue(result > 0);
	}
	
	/*public void selectList() {
		String code = "A001";
		
		try {
			List<CloudDTO> ar = cloudDAO.selectList(code);
			
			assertTrue(ar.size() > 0);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}*/

}
