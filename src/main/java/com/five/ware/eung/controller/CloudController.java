package com.five.ware.eung.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

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
		List<JsonArray> list = new ArrayList<JsonArray>();

		JsonArray json = new JsonArray();
		if(files.length > 0) {
			for (File tempFile : files) {
				String temp = tempFile.getName();
				String ext = null;

				int index = temp.lastIndexOf(".");
				
				if(temp.lastIndexOf(".") == -1) {
					ext = "folder";
				} else {
					ext = temp.substring(index+1);
				}
			
				//JSON
				JsonObject obj = new JsonObject();
				obj.addProperty("name", temp);
				obj.addProperty("ext", ext);
				json.add(obj);
				
				list.add(json);
			}
			
			model.addAttribute("fileList", json);
		}
		
		return "GroupWare/cloud/cloudList";
	}
}
