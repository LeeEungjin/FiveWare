package com.five.ware.ar.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.file.FileDTO;
import com.five.ware.srm.contest.ContestListDTO;
import com.five.ware.srm.contest.ContestService;

@Controller
@RequestMapping(value="srm/contest/**")
public class SrmContestController {

	@Inject
	private ContestService contestService;
	
	@RequestMapping(value="contest")
	public void contest() throws Exception{
		
	}
	
	@RequestMapping(value="contestList")
	public ModelAndView contestList() throws Exception{
		List<ContestListDTO> ar = contestService.contestList();
		List<FileDTO> files = contestService.fileList();
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("list", ar);
		mv.addObject("files", files);
		mv.setViewName("srm/contest/contestList");
		
		return mv;
	}
	
	@RequestMapping(value="contestWrite")
	public ModelAndView contestWrite(HttpSession session) throws Exception{
		Calendar ca = Calendar.getInstance();
		
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		
		String sysdate = sd.format(ca.getTime());
		
		// 공모전 코드
		String filePath = session.getServletContext().getRealPath("resources/code");
		String fileName = "contestCode";
		
		File f = new File(filePath, fileName);
		
		FileReader fr=new FileReader(f);
		
		BufferedReader br = new BufferedReader(fr);
		
		fileName=br.readLine();
		
		String code = fileName;
		char codeChar = code.charAt(0);
		
		code=code.substring(1);
		int num = Integer.parseInt(code);
		
		num++;
		
		code=String.valueOf(num);
		String codeNum="";
		
		for(int i=0; i<3-code.length(); i++){
			codeNum= "0"+codeNum;
		}
		
		code=codeChar+codeNum+code;
		
		FileWriter fw = new FileWriter(f);
		
		fw.write(code);
		
		fw.flush();
		
		fw.close();
		br.close();
		fr.close();
		////////////
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("sysdate", sysdate);
		mv.addObject("code", code);
		mv.setViewName("srm/contest/contestWrite");
		
		return mv;
		
		
	}
	
	@RequestMapping(value="contestWrite", method=RequestMethod.POST)
	public ModelAndView contestInsert(ContestListDTO contestListDTO, MultipartFile[] oriname, HttpSession session) throws Exception{
		String filePath = session.getServletContext().getRealPath("resources/contest");
		
		File f = new File(filePath);
		
		if(!f.exists()){
			f.mkdirs();
		}
		
		int fileresult =0;
		
		FileDTO fileDTO = new FileDTO();
		
		fileDTO.setCode(contestListDTO.getCode());
		
		for(MultipartFile ori : oriname){
			String fileName = ori.getOriginalFilename();
			fileDTO.setOriname(fileName);
			
			fileName=fileName.substring(fileName.lastIndexOf("."));
			
			String name = UUID.randomUUID().toString();
			
			fileName=name+fileName;
			
			fileDTO.setFilename(fileName);
			
			f = new File(filePath,fileName);
			
			System.out.println(filePath);
			
			fileresult=contestService.contestFileInsert(fileDTO);
			
			ori.transferTo(f);
		}
		
		int result = contestService.contestInsert(contestListDTO);
		
		String message="등록 실패";
		
		if((result>0 && fileresult>0) || oriname.length==0){
			message="공모전이 등록되었습니다.";
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("message", message);
		mv.addObject("addr", "contestList");
		
		mv.setViewName("common/result");
		
		return mv;
	}
}
