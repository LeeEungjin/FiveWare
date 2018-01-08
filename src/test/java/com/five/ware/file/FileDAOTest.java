package com.five.ware.file;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Test;

import com.five.ware.AbstractTest;

public class FileDAOTest extends AbstractTest {

	@Inject
	FileDAO fileDAO;
	
	@Test
	public void test() {
		assertNotNull(fileDAO);
	}
	
	@Test
	public void file() {
		delete();
	}
	
	public void delete() {
		String code = "A049";
		
		int result = fileDAO.delete(code);
		
		assertTrue(result > 0);
	}
	
	public void insert() {
		FileDTO fileDTO = new FileDTO();
		fileDTO.setCode("1");
		fileDTO.setFilename("filename");
		fileDTO.setFnum(1);
		fileDTO.setOriname("oriname");
		
		int result = fileDAO.insert(fileDTO);
		
		assertTrue(result > 0);
	}

}
