package com.five.ware.ar.controller;


import java.io.BufferedReader;
import java.io.File;
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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.five.ware.erp.human.member.MemberDTO;
import com.five.ware.file.FileDTO;
import com.five.ware.groupware.epayment.EpaymentDTO;
import com.five.ware.groupware.epayment.EpaymentLeaveDTO;
import com.five.ware.groupware.epayment.EpaymentLeaveService;
import com.five.ware.groupware.epayment.EpaymentService;
import com.five.ware.groupware.epayment.FormListDTO;
import com.five.ware.groupware.epayment.FormListService;
import com.five.ware.util.FileSaver;
import com.five.ware.util.ListData;
import com.five.ware.util.RowNum;

@Controller
@RequestMapping(value="GroupWare/epayment/**")
public class GroupWareEpaymentContorller {

	@Inject
	FormListService formListService;
	@Inject
	EpaymentService epaymentService;
	@Inject
	EpaymentLeaveService epaymentLeaveService;
	
	// 전체 결재함
	@RequestMapping(value="epaymentTotalList")
	public String totalList(String state, ListData listData, Model model) throws Exception{
		epaymentLeaveService.totalList(state, listData, model);
		
		model.addAttribute("title", state);
		model.addAttribute("state", state);
		model.addAttribute("kind", listData.getKind());
		model.addAttribute("search", listData.getSearch());
		
		return "GroupWare/epayment/epaymentTotalList";
	}
	
	//수신함
		@RequestMapping(value="epaymentReceive")
		public String myepaymentList(@RequestParam(defaultValue="0", required=false)int statenum,String code,HttpSession session, Model model, ListData listData) throws Exception{
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			code = memberDTO.getCode();
			
			String title = "";
			
			if(statenum==0){
				title="미결함";
			}else if(statenum==1){
				title="기결함";
			}else if(statenum== -1){
				title="반려함";
			}
			
			epaymentLeaveService.myepaymentList(statenum, code,model, listData);
			
			model.addAttribute("type", statenum);
			model.addAttribute("title", title);
			model.addAttribute("kind", listData.getKind());
			model.addAttribute("search", listData.getSearch());
			
			return "GroupWare/epayment/epaymentReceive";
		}
	
	@RequestMapping(value="epaymentContents")
	public String epaymentContents(String docunum, String statenum, Model model) throws Exception{
		
		epaymentLeaveService.epaymentContents(docunum, model);
		model.addAttribute("type", statenum);
		return "GroupWare/epayment/epaymentView";
	}
	
	/*//내가 올린 결재문서만 보기
	@RequestMapping(value="epaymentDispatch")
	public ModelAndView epaymentDispatch(ListData listData){
		
		
		ModelAndView mv=null;
	
		
		try {
			mv=epaymentService.myEpaymentList(listData);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.setViewName("GroupWare/epayment/epaymentDispatch");
		
		return mv;

	}*/
	
	@RequestMapping(value="stampok")
	public String stampok(EpaymentLeaveDTO epaymentLeaveDTO, String ranking, String approvalcode, HttpSession session,RedirectAttributes rd) throws Exception{
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		epaymentLeaveDTO.setApprovalcode(memberDTO.getCode());
		
		epaymentLeaveDTO.setRanking(ranking);
		epaymentLeaveDTO.setApprovalcode(approvalcode);
		
		String message = epaymentLeaveService.stampok(epaymentLeaveDTO);
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:./epaymentReceive";
	}
	
	
	@RequestMapping(value="formList")
	public String formList(String search, String perPage, int curPage, ListData listData, Model model) throws Exception{
		
		formListService.formList(search, perPage, curPage, model);
		 
		 if(perPage==null) {
			 model.addAttribute("perPage", "10");
		 }else{
			 model.addAttribute("perPage", perPage);
		 }
		 
		model.addAttribute("search", listData.getSearch());
		
		return "GroupWare/epayment/formList";
	}
	
	@RequestMapping(value="explanatory")
	public ModelAndView explanatory(HttpSession session) throws Exception{
		Calendar ca = Calendar.getInstance();
		
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		
		String sysdate = sd.format(ca.getTime());
		
		
		////////////////////////////// 문서 번호
		String filePath = session.getServletContext().getRealPath("/resources/code");
		String fileName= "docunum";
		
		File f= new File(filePath, fileName);
		
		FileReader fr = new FileReader(f);
		
		BufferedReader br = new BufferedReader(fr);
		
		fileName=br.readLine();
		
		String code = fileName;
		char codeChar=code.charAt(0);
		
		code=code.substring(1);
		int num = Integer.parseInt(code);
		
		num++;
		
		code=String.valueOf(num);
		String codeNum="";
		
		for(int i=0; i<3-code.length(); i++){
			codeNum = "0"+codeNum;
		}
		
		
		code=codeChar+codeNum+code;
		
		FileWriter fw = new FileWriter(f);
		
		fw.write(code);
		
		fw.flush();
		
		fw.close();
		br.close();
		fr.close();
///////////////////////////////////////////////		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("sysdate", sysdate);
		mv.addObject("docunum", code);
		mv.setViewName("GroupWare/epayment/explanatory");
		
		return mv;
	}
	
/*	@RequestMapping(value="epaymentInsert", method=RequestMethod.POST)
	public ModelAndView epaymentInsert(EpaymentDTO epaymentDTO, String [] approvalcode, String [] approvalname, String [] approvaltemp, String [] approvalrank) throws Exception{
		
		for(int i=0; i<approvalcode.length; i++){
			System.out.println(approvalcode[i]);
			System.out.println(approvalname[i]);
			System.out.println(approvaltemp[i]);
			System.out.println(approvalrank[i]);
		}
		ModelAndView mv = new ModelAndView();
		
		
		mv.setViewName("common/result");
		
		return mv;
	}*/
	@RequestMapping(value="epaymentStorageList")
	public String storageList(String code, String state, HttpSession session, ListData listData, Model model) throws Exception{
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		
		model.addAttribute("kind", listData.getKind());
		model.addAttribute("search", listData.getSearch());
		
		code = memberDTO.getCode();
		
		epaymentLeaveService.storageList(code, state, listData, model);
		
		return "GroupWare/epayment/epaymentStorageList";
		
	}
	
	@RequestMapping(value="epaymentInsert", method=RequestMethod.POST)
	public ModelAndView epaymentInsert(EpaymentDTO epaymentDTO, MultipartFile [] oriname, HttpSession session,String state, EpaymentLeaveDTO epaymentLeaveDTO) throws Exception{
		
		FileDTO fileDTO = new FileDTO();
		
		//file
		String filePath=session.getServletContext().getRealPath("resources/epayment");
		
		File file=new File(filePath);
		
		if(!file.exists()){
			file.mkdirs();
		}
		
		int result3 = 0;
		
		fileDTO.setCode(epaymentDTO.getDocunum());
		
		for(MultipartFile f2 : oriname){			
			String fileName=f2.getOriginalFilename();
			fileDTO.setOriname(fileName);
			fileName=fileName.substring(fileName.lastIndexOf("."));
			
			String name=UUID.randomUUID().toString();
			fileName=name+fileName;
			
			file=new File(filePath, fileName);
			System.out.println(filePath);
			
			fileDTO.setFilename(fileName);
			
			
			result3 = epaymentLeaveService.epaymentFile(fileDTO);
			
			f2.transferTo(file);		
		}
		
	/*	FileSaver fileSaver = new FileSaver();
		
		for(MultipartFile f : oriname){
			String fileName = fileSaver.fileSave(f, session, "epayment");
		}*/
		//////////////////////////////////////
		
		epaymentDTO.setState(state);
		
		int result = epaymentService.epaymentInsert(epaymentDTO);
		int result2 = epaymentLeaveService.approvalInsert(epaymentLeaveDTO);
	
		String message = "결재 요청 실패";
		
		if(result>0 && result2>0){
			if((oriname.length==0 && state.equals("임시저장")) || (result3>0 && state.equals("임시저장"))){
				message="임시저장 되었습니다.";				
				}	else{
					message="결재 요청되었습니다.";
				}
		}
		
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("message", message);
		mv.addObject("addr", "formList?curPage=1");
		mv.setViewName("common/result");
		
		return mv;
	}
	
	@RequestMapping(value="explanatory_modal")
	public void epaymentModal() throws Exception{
		System.out.println("들어오냐?");
	}
	
	@RequestMapping(value="signData")
	@ResponseBody
	public List<Object> signData() throws Exception{
		List<String> temps = epaymentService.tempList();
		List<Object> ar = new ArrayList<Object>();
		
		ar.add(temps);
		
		return ar;
	}
	
	@RequestMapping(value="tempMember")
	@ResponseBody
	public List<MemberDTO> tempMember(String temp) throws Exception{
		List<MemberDTO> members=epaymentService.tempMember(temp);
		
		return members;
	}
	
	@RequestMapping(value="memberSelect")
	@ResponseBody
	public MemberDTO memberSelect(String code) throws Exception{
		MemberDTO memberDTO = epaymentService.memberSelect(code);
		
		return memberDTO;
	}
	
	@RequestMapping(value="epaymentViewUpdate")
	public String epaymentViewUpdate(String docunum, Model model) throws Exception{
		EpaymentDTO epaymentDTO = epaymentLeaveService.viewOneModal(docunum);
		
		model.addAttribute("docuC", epaymentDTO);
		
		return "GroupWare/epayment/epaymentViewUpdate";
	}
	
	@RequestMapping(value="myEpayment")
	public String sendEpaymentList(String code, ListData listData , Model model, HttpSession session) throws Exception{
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		code = memberDTO.getCode();
		
		epaymentLeaveService.sendEpaymentList(code, listData, model);
		
		model.addAttribute("kind", listData.getKind());
		model.addAttribute("search", listData.getSearch());
		
		return "GroupWare/epayment/myEpayment";
	}
	
	@RequestMapping(value="epaymentUpdate", method=RequestMethod.POST)
	public ModelAndView epaymentUpdate(EpaymentDTO epaymentDTO) throws Exception{
		System.out.println("들어오니");
		System.out.println(epaymentDTO.getTitle());
		System.out.println(epaymentDTO.getContents());
		System.out.println(epaymentDTO.getDocunum());
		int result = epaymentLeaveService.epaymentUpdate(epaymentDTO);
		
		String message = "수정 실패";
		
		if(result>0){
			message="결재 요청되었습니다.";
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("message", message);
		mv.addObject("addr", "./myEpayment");
		
		mv.setViewName("common/result");
		
		return mv;
	}
	
	@RequestMapping(value="epaymentDelete", method=RequestMethod.POST)
	@ResponseBody
	public String epaymentDelete(String docunum) throws Exception{
		System.out.println("삭제되거라!!");
		int result = epaymentLeaveService.epaymentDelete(docunum);
		
		String message="삭제 실패";
		
		if(result>0){
			message="삭제되었습니다.";
		}
		
		return message;
	}
}
