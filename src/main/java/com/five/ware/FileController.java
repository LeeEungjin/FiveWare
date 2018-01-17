package com.five.ware;

import java.io.File ;  

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.community.CommunityDTO;


import com.five.ware.file.FileDTO;

import com.five.ware.file.PhotoDTO;
import com.five.ware.util.FileSaver;


@Controller
@RequestMapping(value="/file/**")
public class FileController {


		

/*	@RequestMapping(value="fileDown")
	public ModelAndView fileDown(NoticeDTO noticeDTO, HttpSession session) throws Exception	{

		String filePath = session.getServletContext().getRealPath("resources/upload");
		System.out.println("filePath : " +filePath);
		
		File file = new File(filePath, communityDTO.getFilename());
		System.out.println("filename : "+communityDTO.getFilename());
		ModelAndView mv = new ModelAndView();
		mv.addObject("down", file);
		mv.addObject("oriname", communityDTO.getOriname());
		mv.setViewName("fileDown");
		
		return mv;
	}*/
	
	@RequestMapping(value="photoUpload", method=RequestMethod.POST)
	public String smartEditor(PhotoDTO photoDTO, HttpSession session){
		// service �꽆湲곕뒗 肄붾뱶
		String filePath=session.getServletContext().getRealPath("/");
		filePath=filePath+"resources"+File.separator+"upload";
		File file = new File(filePath);		
		System.out.println(filePath);
		
		if(!file.exists()){
			file.mkdirs();
		}
		
		FileSaver fs = new FileSaver();
		String fileName="";
		StringBuffer stringBuffer = new StringBuffer();
		//String result="";
		try {
			fileName=fs.save1(filePath, photoDTO.getFiledata());
			//result="&bNewLine=true&sFileName="+photoDTO.getFiledata().getOriginalFilename()+"&sFileURL="+session.getServletContext().getContextPath()+File.separator+"upload"+File.separator+fileName;
			stringBuffer.append("&bNewLine=true&sFileName=");
			stringBuffer.append(photoDTO.getFiledata().getOriginalFilename());
			stringBuffer.append("&sFileURL=");
			stringBuffer.append(session.getServletContext().getContextPath());
			stringBuffer.append(File.separator);
			stringBuffer.append("/resources/");
			stringBuffer.append("upload");
			stringBuffer.append(File.separator);
			stringBuffer.append("/");
			stringBuffer.append(fileName);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("redirect:./"+photoDTO.getCallback()+photoDTO.getCallback_func()+stringBuffer.toString());
		
		return "redirect:./"+photoDTO.getCallback()+photoDTO.getCallback_func()+stringBuffer.toString();
	}
	
	
}
