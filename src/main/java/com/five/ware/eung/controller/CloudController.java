package com.five.ware.eung.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.erp.human.member.MemberDTO;


@Controller 
@RequestMapping(value="/GroupWare/cloud/**")
public class CloudController {
	
	@RequestMapping(value="myCloud", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView cloudList(HttpSession session, @RequestParam(defaultValue="", required=false)String folderName) {
		ModelAndView mv = new ModelAndView();
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");

		String path = "resources/cloud/private/"+memberDTO.getCode();
		if(!folderName.equals("")) {
			path = path+"/"+folderName;
		}
		
		System.out.println("path : " + path);
		
		createFolder(mv, session, path);
		
		return mv;
	}
	
	@SuppressWarnings("unchecked")
	private void createFolder(ModelAndView mv, HttpSession session, String path) {
		JSONArray jsonFolder = new JSONArray();
		JSONArray jsonFile = new JSONArray();
		
		String filePath = session.getServletContext().getRealPath(path);
		System.out.println(filePath);
	
		File parentFile = new File(filePath);
		if(!parentFile.exists()) {
			parentFile.mkdirs();
		}

		File[] files = parentFile.listFiles();
		
		if(files.length > 0) {
			for (File tempFile : files) {
				String temp = tempFile.getName();
				String ext = null;

				if(temp.lastIndexOf(".") == -1) {
					ext = "folder";
					
					JSONObject obj = new JSONObject();
					obj.put("name", temp);
					obj.put("ext", ext);
					jsonFolder.add(obj);
				} else {
					ext = temp.substring(temp.lastIndexOf(".")+1);
					
					JSONObject obj = new JSONObject();
					obj.put("name", temp);
					obj.put("ext", ext);
					jsonFile.add(obj);
				}
			}
			
			mv.addObject("folderList", jsonFolder);
			mv.addObject("fileList", jsonFile);
			mv.addObject("filePath", path);
			mv.setViewName("GroupWare/cloud/myCloud");
		}
		
	}// End createFile()
}
