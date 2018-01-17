package com.five.ware.ar.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.erp.human.member.MemberDTO;
import com.five.ware.groupware.epayment.EpaymentDTO;
import com.five.ware.groupware.epayment.EpaymentLeaveDTO;
import com.five.ware.groupware.epayment.EpaymentLeaveService;
import com.five.ware.groupware.epayment.EpaymentService;
import com.five.ware.groupware.epayment.FormListDTO;
import com.five.ware.groupware.epayment.FormListService;

@Controller
@RequestMapping(value="GroupWare/epayment/**")
public class GroupWareEpaymentContoller {

	@Inject
	FormListService formListService;
	@Inject
	EpaymentService epaymentService;
	@Inject
	EpaymentLeaveService epaymentLeaveService;
	
	@RequestMapping(value="formList")
	public ModelAndView formList(String search) throws Exception{
		List<FormListDTO> ar = formListService.formList(search);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("listnum", ar.size());
		mv.addObject("formList", ar);
		mv.setViewName("GroupWare/epayment/formList");
		
		return mv;
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
		System.out.println("결과"+code);
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
	
	
	@RequestMapping(value="epaymentInsert", method=RequestMethod.POST)
	public ModelAndView epaymentInsert(EpaymentDTO epaymentDTO, EpaymentLeaveDTO epaymentLeaveDTO) throws Exception{
		int result = epaymentService.epaymentInsert(epaymentDTO);
		int result2 = epaymentLeaveService.approvalInsert(epaymentLeaveDTO);
		
		String message = "결재 요청 실패";
		
		if(result>0 && result2>0){
			message="결재가 요청되었습니다.";
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("message", message);
		mv.addObject("addr", "formList");
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
	
	
}
