package com.five.ware.eung.controller;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.cloud.CloudFileDTO;
import com.five.ware.cloud.CloudFileService;
import com.five.ware.erp.human.member.MemberDTO;
import com.five.ware.util.FileSaver;


@Controller 
@RequestMapping(value="/GroupWare/cloud/**")
public class CloudController {
	
	@Inject
	private CloudFileService cloudFileService;
	
	//Delete
	@RequestMapping(value="fileDelete", method=RequestMethod.POST)
	public String fileDelete(HttpSession session, String path, String name) {
		////////////////////////////
		String filepath = session.getServletContext().getRealPath(path+"/"+name);
		System.out.println("fileDelete - filepath: "+filepath);
		
		File file = new File(filepath);
		if(file.exists()) { 
			Boolean b = file.delete();
			if(b) {
				System.out.println("昏力己傍!");
			}
		}
		
		return "redirect:./myCloud";
	}
	
	//FileUpload
	@RequestMapping(value="fileUpload", method=RequestMethod.POST)
	public String fileUpload(HttpSession session, MultipartFile file, String path) {
		FileSaver fileSaver = new FileSaver();
		
		try {
			CloudFileDTO cloudFileDTO = fileSaver.cloudFileSave(session, file, path);
			cloudFileService.insert(cloudFileDTO);
					
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:./myCloud";
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
			System.out.println("createFolder - 积己!");
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
		System.out.println("folderList - filePath: "+filePath);
		
		File file = new File(filePath);
		if(!file.exists()) {
			System.out.println("folderList - 积己!");
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
					try {
						CloudFileDTO cloudFileDTO = cloudFileService.selectOne(temp);
						temp = cloudFileDTO.getOriname();
						
					} catch (Exception e) {
						e.printStackTrace();
					}
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
