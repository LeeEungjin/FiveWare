package com.five.ware.eung.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller 
@RequestMapping(value="/GroupWare/cloud/**")
public class CloudController {
	
	@RequestMapping(value="cloudList", method=RequestMethod.GET)
	public String cloudList(HttpSession session, Model model) {
		String filePath = session.getServletContext().getRealPath("resources/cloud");
		System.out.println(filePath);
	
		File parentFile = new File(filePath);
		if(!parentFile.exists()) {
			parentFile.mkdirs();
		}
		
		File[] files = parentFile.listFiles();
		List<String[]> list = new ArrayList<String[]>();
		if(files.length > 0) {
			for (File tempFile : files) {
				String[] ar = new String[2];
				
				String temp = tempFile.getName();
				String ext = null;

				int index = temp.lastIndexOf(".");
				
				if(temp.lastIndexOf(".") == -1) {
					ext = "folder";
				} else {
					ext = temp.substring(index+1);
				}
			
				
			}
			
			for (String[] strings : list) {
				System.out.println("------------------");
				for (String string : strings) {
					System.out.println(string);
				}
				System.out.println("------------------");
			}
			
			model.addAttribute("files", files);
			model.addAttribute("fileInfo", list);
		}
		
		return "GroupWare/cloud/cloudList";
	}
}
