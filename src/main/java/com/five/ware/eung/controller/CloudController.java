package com.five.ware.eung.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller 
@RequestMapping(value="/GroupWare/cloud/**")
public class CloudController {
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="cloudList", method=RequestMethod.GET)
	public String cloudList(HttpSession session, Model model) {
		String filePath = session.getServletContext().getRealPath("resources/cloud");
		System.out.println(filePath);
	
		File parentFile = new File(filePath);
		if(!parentFile.exists()) {
			parentFile.mkdirs();
		}

		File[] files = parentFile.listFiles();

		JSONArray json = new JSONArray();
		if(files.length > 0) {
			for (File tempFile : files) {
				String temp = tempFile.getName();
				String ext = null;

				if(temp.lastIndexOf(".") == -1) {
					ext = "folder";
				} else {
					ext = temp.substring(temp.lastIndexOf(".")+1);
				}
			
				//JSON
				JSONObject obj = new JSONObject();
				obj.put("name", temp);
				obj.put("ext", ext);
				json.add(obj);
			}
			
			model.addAttribute("fileList", json);
		}
		
		return "GroupWare/cloud/cloudList";
	}
}
