package com.five.ware.cloud;

import static org.junit.Assert.*;

import java.util.List;

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
	public void main() {
		searach();
	}
	
	public void searach() {
		try {
			List<CloudDTO> ar = cloudDAO.search("f");
			
			assertTrue(ar.size() > 0);
			
			for (CloudDTO cloudDTO : ar) {
				System.out.println(cloudDTO.getFoldername());
				System.out.println("-------------------------------------------");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
