package com.five.ware.file;

import static org.junit.Assert.*;

import java.util.List;

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
		try {
			deleteOne();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteOne() throws Exception {
		int fnum = 117;
		int result = fileDAO.deleteOne(fnum);
		
		assertTrue(result > 0);
	}
	
	public void selectOne() throws Exception {
		String code = "A031";
		
		List<FileDTO> ar = fileDAO.selectList(code);
		
		assertTrue(ar.size() > 0);
		
		for (FileDTO fileDTO : ar) {
			System.out.println(fileDTO.getFnum());
			System.out.println(fileDTO.getCode());
			System.out.println(fileDTO.getFilename());
			System.out.println(fileDTO.getOriname());
			System.out.println("-----------------------------------");
		}
		
	}
	
	public void delete() throws Exception {
		String code = "A049";
		
		int result = fileDAO.delete(code);
		
		assertTrue(result > 0);
	}
	
	public void insert() throws Exception {
		FileDTO fileDTO = new FileDTO();
		fileDTO.setCode("1");
		fileDTO.setFilename("filename");
		fileDTO.setFnum(1);
		fileDTO.setOriname("oriname");
		
		int result = fileDAO.insert(fileDTO);
		
		assertTrue(result > 0);
	}

}
