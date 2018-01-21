package com.five.ware.eung.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.erp.human.member.MemberDTO;
import com.five.ware.util.FileSaver;


@Controller 
@RequestMapping(value="/GroupWare/cloud/**")
public class CloudController {
	
	
	//FileUpload
	@RequestMapping(value="fileUpload", method=RequestMethod.POST)
	public void fileUpload(HttpSession session, MultipartFile multipartFile, String path) {
		System.out.println("fileUpload - path :" + path);
		System.out.println("fileUpload - file :" + multipartFile.getName());
		
		/*FileSaver fileSaver = new FileSaver();
		
		try {
			String fileName = fileSaver.cloudFileSave(session, multipartFile, path);
		} catch (Exception e) {
			e.printStackTrace();
		}*/
	}
	
	// Create Folder
	@RequestMapping(value="createFolder", method=RequestMethod.POST)
	public ModelAndView createFolder(HttpSession session, String folderName) {
		System.out.println("In createFodler");
		ModelAndView mv = new ModelAndView();
		
		System.out.println("createFolder - foderName: "+folderName);
		
		String filepath = session.getServletContext().getRealPath(folderName);
		
		File f = new File(filepath);
		if(!f.exists()) {
			System.out.println("createFolder - 생성!");
			f.mkdirs();
		}
		
		//when file is create, back
		String[] paths = folderName.split("/");
		if( paths[paths.length-1].equals(( (MemberDTO)session.getAttribute("member") ).getCode()) ) {
			System.out.println("This is RootPath");
		} else {
			folderName = folderName.substring(0, folderName.lastIndexOf('/'));
			System.out.println("folderList - path : " + folderName);
		}
		
		folderList(mv, session, folderName);
		
		mv.setViewName("GroupWare/cloud/myCloud");
		
		return mv;
	}
	
	@RequestMapping(value="myCloud", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView cloudList(HttpSession session, @RequestParam(defaultValue="")String folderName) {
		System.out.println("cloudList - folderName : "+folderName);
		
		ModelAndView mv = new ModelAndView();
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");

		String path = "resources/cloud/private/"+memberDTO.getCode();
		if(!folderName.equals("")) {
			path = folderName;
		}
		
		System.out.println("cloudList - path : " + path);
		
		folderList(mv, session, path);
		mv.setViewName("GroupWare/cloud/myCloud");
		
		return mv;
	}
	
	@SuppressWarnings("unchecked")
	private void folderList(ModelAndView mv, HttpSession session, String path) {
		JSONArray jsonFolder = new JSONArray();
		JSONArray jsonFile = new JSONArray();
		
		String filePath = session.getServletContext().getRealPath(path);
		
		File file = new File(filePath);
		if(!file.exists()) {
			System.out.println("folderList - 생성!");
			file.mkdirs();
		}

		File[] files = file.listFiles();
		
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
			
		}
		
		mv.addObject("folderList", jsonFolder);
		mv.addObject("fileList", jsonFile);
		mv.addObject("filePath", path);
		
	}// End folderList()
	
}
