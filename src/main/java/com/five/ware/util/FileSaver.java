package com.five.ware.util;

import java.io.File;
import java.io.FileOutputStream;
import java.util.UUID;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileSaver {
	
	public String cloudFileSave(HttpSession session, MultipartFile multipartFile, String path) throws Exception {
		//1.reaulPath
		String filePath=session.getServletContext().getRealPath(path);
		System.out.println("FileSave(Cloud) - filePath : "+filePath);
		
		File file=new File(filePath);
		if(!file.exists()){
			file.mkdirs();
		}
		
		//2.fileName
		String fileName = multipartFile.getOriginalFilename();
		fileName = fileName.substring(fileName.lastIndexOf('.'));
		fileName = UUID.randomUUID().toString() + fileName;
		
		//3.file 저장
		file = new File(filePath, fileName);
		
		byte[] fileData = multipartFile.getBytes();
		FileCopyUtils.copy(fileData, file);
		
		return fileName;
	}
	
	public String fileSave(MultipartFile multipartFile, HttpSession session,String path )throws Exception{
		//1.reaulPath
		String filePath=session.getServletContext().getRealPath("resources/"+path);
		System.out.println("filePath : "+filePath);
		File file=new File(filePath);
		if(!file.exists()){
			file.mkdirs();
		}
		
		//2.fileName
		String fileName=multipartFile.getOriginalFilename();
		fileName=fileName.substring(fileName.lastIndexOf("."));
		fileName=UUID.randomUUID().toString()+fileName;
		
		//3.file 저장
		file=new File(file, fileName);
		multipartFile.transferTo(file);
		
		return fileName;
	}
	
	public String save1(String filePath, MultipartFile multipartFile) throws Exception{
		String fileName=multipartFile.getOriginalFilename();
		fileName=fileName.substring(fileName.lastIndexOf("."));
		fileName=UUID.randomUUID().toString()+fileName;
		
		/*String fileName = UUID.randomUUID().toString();*/
		
		byte [] fileData = multipartFile.getBytes();
		
		File file = new File(filePath, fileName);
		FileOutputStream fo = null;
		
		try {
			fo = new FileOutputStream(file);
			fo.write(fileData);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			fo.close();
		}
		
		return fileName;
	}


}
