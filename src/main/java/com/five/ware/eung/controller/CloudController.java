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
				String[] fileNames = new String[2];
				String ext = null;

				
				if(tempFile.getName().indexOf(".") == -1) {
					System.out.println("folder");
					ext = "folder";
				} else {
					System.out.println("file");
					String[] str = tempFile.getName().split(".");
					for (String string : str) {
						System.out.println(string);
						System.out.println("========================");
					}
					
				}
				
				/*System.out.println(tempFile.getName());
				System.out.println(ext);
				System.out.println("--------------------");*/
				
				fileNames[0] = tempFile.getName();
				fileNames[1] = ext;
				list.add(fileNames);
			}
			model.addAttribute("files", files);
		}
		
		return "GroupWare/cloud/cloudList";
	}
}
