package com.five.ware.ar.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.erp.human.member.MemberDTO;
import com.five.ware.erp.storeRegist.StoreRegistDAO;
import com.five.ware.erp.storeRegist.StoreRegistDTO;
import com.five.ware.file.FileDTO;
import com.five.ware.srm.contest.ContestJoinDTO;
import com.five.ware.srm.contest.ContestLikeDTO;
import com.five.ware.srm.contest.ContestListDTO;
import com.five.ware.srm.contest.ContestService;
import com.five.ware.util.FileSaver;
import com.five.ware.util.ListData;
import com.five.ware.util.RowNum;

@Controller
@RequestMapping(value="/srm/contest/**")
public class SrmContestController {

	@Inject
	private ContestService contestService;
	
	@RequestMapping(value="contest")
	public String contest(Model model,@RequestParam(defaultValue="1", required=false) int curPage, HttpSession session) throws Exception{
		ListData listData = new ListData(3);
		listData.setCurPage(curPage);
		
		StoreRegistDTO storeRegistDTO = (StoreRegistDTO) session.getAttribute("member");
		String store = storeRegistDTO.getCode();
		
		contestService.contestList(listData, model);
		List<ContestJoinDTO> ar2 = contestService.contestJoinList();
		List<ContestLikeDTO> result2 = new ArrayList<ContestLikeDTO>();
		
		for(ContestJoinDTO contestJoinDTO : ar2){
			ContestLikeDTO contestLikeDTO = new ContestLikeDTO();
			
			contestLikeDTO.setCode(contestJoinDTO.getCode());
			contestLikeDTO.setStore(store);
			
			System.out.println(contestJoinDTO.getCode());
			
			contestLikeDTO = contestService.likeSelectOne(contestLikeDTO);
			
			result2.add(contestLikeDTO);
		}
		
		model.addAttribute("list2", ar2);
		model.addAttribute("result", result2);
		
		return "srm/contest/contest";
	}
	
	@RequestMapping(value="contestList")
	public String contestList(Model model, @RequestParam(defaultValue="1", required=false) int curPage) throws Exception{
		ListData listData = new ListData(3);
		listData.setCurPage(curPage);
		
		contestService.contestList(listData, model);
		List<FileDTO> files = contestService.fileList();
		
		model.addAttribute("files", files);
		
		return "srm/contest/contestList";
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
	
	@RequestMapping(value="contestJoin", method=RequestMethod.POST)
	public ModelAndView contestJoinInsert(ContestJoinDTO contestJoinDTO, MultipartFile menuphoto, HttpSession session) throws Exception{
		FileSaver fileSaver = new FileSaver();
		
		String fileName=fileSaver.fileSave(menuphoto, session, "contest");
		System.out.println(fileName);
		
		FileDTO fileDTO = new FileDTO();
		
		fileDTO.setCode(contestJoinDTO.getCode()+contestJoinDTO.getCnum());
		fileDTO.setOriname(menuphoto.getOriginalFilename());
		fileDTO.setFilename(fileName);
		
		contestJoinDTO.setPhoto(fileName);
		
		int result = contestService.contestJoinInsert(contestJoinDTO);
		int file = contestService.contestFileInsert(fileDTO);
		
		String message="등록 실패";
		
		if(result>0 && file>0){
			message="제출되었습니다.";
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("message", message);
		mv.addObject("addr", "contest");
		
		mv.setViewName("common/result");
		
		return mv;
	}
	
	@RequestMapping(value="like")
	@ResponseBody
	public String like(int ccnum, String code, String store, String state) throws Exception{
		int result =0;
		String kind="";
		
		if(state.equals("fa")){
			result=contestService.likeInsert(ccnum, code, store);
			if(result>0){
				kind="like";
			}
		}else{
			result=contestService.likeDelete(ccnum);
			if(result>0){
				kind="cancel";
			}
		}
		
		return kind;
	}
}
