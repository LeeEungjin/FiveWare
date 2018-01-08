package com.five.ware.eung.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.five.ware.file.FileDAO;
import com.five.ware.file.FileDTO;
import com.five.ware.util.FileSaver;

@Controller
@RequestMapping(value="/ajax/**")
public class AjaxController {
	
	@Inject
	private FileDAO fileDAO;
	@Inject
	private FileSaver fileSaver;
	
	
	@RequestMapping(value="fileDelete")
	public String delete(String code) {
		fileDAO.delete(code);
		
		return "redirect:../erp/foundation/product";
	}

	@RequestMapping(value="drapAndDrop", method={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public List<String> dragAndDrop(MultipartFile[] file, HttpSession session, String code) {
		String fileName = "";
		
		for (MultipartFile multipartFile : file) {
			System.out.println(multipartFile.getOriginalFilename());
		}
		
		System.out.println(code);
		
		List<String> ar = new ArrayList<String>();
		
		for (MultipartFile multipartFile : file) {
			try {
				fileName = fileSaver.fileSave(multipartFile, session, "product");
				FileDTO fileDTO = new FileDTO();
				fileDTO.setCode(code);
				fileDTO.setFilename(fileName);
				fileDTO.setOriname(multipartFile.getOriginalFilename());
				fileDAO.insert(fileDTO);
				ar.add(fileName);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return ar;
	}
}
