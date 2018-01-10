package com.five.ware.eung.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	
	@RequestMapping(value="fileList", method=RequestMethod.GET)
	@ResponseBody
	public List<FileDTO> selectList(String code) {
		List<FileDTO> ar = new ArrayList<FileDTO>();
		
		try {
			ar = fileDAO.selectList(code);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ar;
	}
	
	@RequestMapping(value="fileDeleteOne")
	public String deleteOne(int fnum) {
		try {
			fileDAO.deleteOne(fnum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:../erp/foundation/product";
	}
	
	@RequestMapping(value="fileDelete")
	public String delete(String code, @RequestParam(defaultValue="supplier", required=true)String path) {
		try {
			fileDAO.delete(code);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:../erp/foundation/"+path;
	}

	@RequestMapping(value="drapAndDrop", method={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public List<FileDTO> dragAndDrop(MultipartFile[] file, HttpSession session, String code) {
		String fileName = "";
		
		for (MultipartFile multipartFile : file) {
			System.out.println(multipartFile.getOriginalFilename());
		}
		
		System.out.println(code);
		
		List<FileDTO> ar = new ArrayList<FileDTO>();
		
		for (MultipartFile multipartFile : file) {
			try {
				fileName = fileSaver.fileSave(multipartFile, session, "product");
				FileDTO fileDTO = new FileDTO();
				fileDTO.setFnum(fileDAO.getFnum());
				fileDTO.setCode(code);
				fileDTO.setFilename(fileName);
				fileDTO.setOriname(multipartFile.getOriginalFilename());
				fileDAO.insert(fileDTO);
				ar.add(fileDTO);
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return ar;
	}
}
