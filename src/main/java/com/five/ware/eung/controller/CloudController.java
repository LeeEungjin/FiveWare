package com.five.ware.eung.controller;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.cloud.CloudDTO;
import com.five.ware.cloud.CloudFileDTO;
import com.five.ware.cloud.CloudFileService;
import com.five.ware.cloud.CloudService;
import com.five.ware.erp.human.member.MemberDTO;
import com.five.ware.util.FileSaver;


@Controller 
@RequestMapping(value="/GroupWare/cloud/**")
public class CloudController {
	
	@Inject
	private CloudService cloudService;
	
	@Inject
	private CloudFileService cloudFileService;
	
	// Cloud Search
	@RequestMapping(value="cloudSearch", method=RequestMethod.POST)
	@ResponseBody
	public List<CloudDTO> cloudSearch(String foldername) {
		List<CloudDTO> list = null;
		
		try {
			list = cloudService.search(foldername);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	// Download
	@RequestMapping(value="fileDown")
	public ModelAndView fileDown(HttpSession session, CloudFileDTO cloudFileDTO, String path){
		String filePath = session.getServletContext().getRealPath(path);
		System.out.println("fileDown - filepath: "+filePath);
		System.out.println("fileDown - oriname: "+cloudFileDTO.getOriname());
		System.out.println("fileDown - filename: "+cloudFileDTO.getFilename());
		
		//
		File file = new File(filePath, cloudFileDTO.getFilename());
		ModelAndView mv = new ModelAndView();
		mv.addObject("down", file);
		mv.addObject("oriname", cloudFileDTO.getOriname());
		//viewName�� 
		mv.setViewName("filedown");
		
		return mv;
	}
	
	//Delete
	@RequestMapping(value="fileDelete", method=RequestMethod.POST)
	public String fileDelete(HttpSession session, String path, String filename) {
		String filepath = session.getServletContext().getRealPath(path+"/"+filename);
		System.out.println("fileDelete - filepath: "+filepath);
		
		try {
			File file = new File(filepath);
			if(file.exists()) { 
				if(file.delete()) {
					// 폴더 파일 구분
					int result = cloudService.delete(filename, path);
					if(result < 1) {
						result = cloudFileService.delete(filename);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:./myCloud";
	}
	
	//FileUpload
	@RequestMapping(value="fileUpload", method=RequestMethod.POST)
	public ModelAndView fileUpload(HttpSession session, MultipartFile file, String path) {
		ModelAndView mv = new ModelAndView();
		FileSaver fileSaver = new FileSaver();
		
		try {
			CloudFileDTO cloudFileDTO = fileSaver.cloudFileSave(session, file, path);
			cloudFileDTO.setFoldername(path.substring(path.lastIndexOf("/")+1));
			cloudFileService.insert(cloudFileDTO);
					
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		folderList(mv, session, path);
		mv.setViewName("GroupWare/cloud/myCloud");
		
		return mv;
	}
	
	// Create Folder
	@RequestMapping(value="createFolder", method=RequestMethod.POST)
	public ModelAndView createFolder(HttpSession session, String folderName) {
		System.out.println("In createFodler");
		ModelAndView mv = new ModelAndView();
		
		System.out.println("createFolder - foderName: "+folderName);
		
		String filepath = session.getServletContext().getRealPath(folderName);
		
		try {
			File f = new File(filepath);
			if(!f.exists()) {
				if(f.mkdirs()) {
					cloudService.insert(session, folderName);	
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
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
		
		if(memberDTO != null) {
			String path = "resources/cloud/private/"+memberDTO.getCode();
			
			if(!folderName.equals("")) {
				path = folderName;
			}
			
			System.out.println("cloudList - path : " + path);
			
			folderList(mv, session, path);
			mv.setViewName("GroupWare/cloud/myCloud");
		}
		
		return mv;
	}
	
	@SuppressWarnings("unchecked")
	private void folderList(ModelAndView mv, HttpSession session, String path) {
		JSONArray jsonFolder = new JSONArray();
		JSONArray jsonFile = new JSONArray();
		
		String code = ((MemberDTO)session.getAttribute("member")).getCode();
		String filePath = session.getServletContext().getRealPath(path);
		System.out.println("folderList - filePath: "+filePath);
		
		File file = new File(filePath);
		if(!file.exists()) {
			file.mkdirs();
			System.out.println("folderList - folder create!!");
		}
		

		//File[] files = file.listFiles();
		List<CloudDTO> folders = null;
		List<CloudFileDTO> files = null;
		try {
			String filename = path.substring(path.lastIndexOf("/")+1);
			folders = cloudService.selectList(code, filename);
			files = cloudFileService.fileList(code, filename);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		
		if(folders != null && folders.size() > 0) {
			for (CloudDTO tempFile : folders) {
				String temp = tempFile.getFoldername();
				String ext = null;

				if(temp.lastIndexOf(".") == -1) {
					ext = "folder";
					
					JSONObject obj = new JSONObject();
					obj.put("name", temp);
					obj.put("ext", ext);
					jsonFolder.add(obj);
					
				} /*else {
					String oriname = null;
					String filename = null;
					try {
						CloudFileDTO cloudFileDTO = cloudFileService.selectOne(temp);
						oriname = cloudFileDTO.getOriname();
						filename = cloudFileDTO.getFilename();
						
					} catch (Exception e) {
						e.printStackTrace();
					}
					ext = temp.substring(temp.lastIndexOf(".")+1);
					
					JSONObject obj = new JSONObject();
					obj.put("name", oriname);
					obj.put("filename", filename);
					obj.put("ext", ext);
					jsonFile.add(obj);
				}*/
			}
		} //END if -> Size() > 0
		
		if(files != null && files.size() > 0) {
			for (CloudFileDTO cloudFileDTO : files) {
				String oriname = null;
				String filename = null;
				String ext = null;
				
				try {
					CloudFileDTO cFileDTO = cloudFileService.selectOne(cloudFileDTO.getFilename());
					oriname = cFileDTO.getOriname();
					filename = cFileDTO.getFilename();
					ext = cloudFileDTO.getFilename().substring(cloudFileDTO.getFilename().lastIndexOf(".")+1);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			
				JSONObject obj = new JSONObject();
				obj.put("name", oriname);
				obj.put("filename", filename);
				obj.put("ext", ext);
				jsonFile.add(obj);
			}
		}
		
		mv.addObject("folderList", jsonFolder);
		mv.addObject("fileList", jsonFile);
		mv.addObject("filePath", path);
		
	}// End folderList()
	
}
