package com.five.ware;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.five.ware.erp.human.member.MemberDTO;
import com.five.ware.groupware.epayment.EpaymentService;

@Controller
@RequestMapping(value="/message/**")
public class MessageController {
	
	@Inject
	EpaymentService epaymentService;
	
	
	@RequestMapping(value="messageList")
	@ResponseBody
	public List<Object> signData() throws Exception{
		List<String> temps = epaymentService.tempList();
		List<Object> ar = new ArrayList<Object>();
		
		ar.add(temps);
		
		return ar;
	}
	

	@RequestMapping(value="memberList")
	@ResponseBody
	public List<MemberDTO> tempMember(String temp) throws Exception{
		
		List<MemberDTO> members=epaymentService.tempMember(temp);
		
		return members;
	}

}
