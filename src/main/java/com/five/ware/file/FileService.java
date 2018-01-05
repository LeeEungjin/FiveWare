package com.five.ware.file;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class FileService {

	@Inject
	FileDAO fileDAO;
	
	public int fileInsert(FileDTO fileDTO) throws Exception{
		int result = fileDAO.fileInsert(fileDTO);
		
		return result;
	}
	
	public FileDTO fileOne(String code) throws Exception{
		FileDTO fileDTO= fileDAO.fileOne(code);
		
		return fileDTO;
	}
}
