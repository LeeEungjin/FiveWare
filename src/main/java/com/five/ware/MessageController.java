package com.five.ware;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.erp.human.member.MemberDTO;
import com.five.ware.groupware.epayment.EpaymentService;
import com.five.ware.message.MessageDTO;
import com.five.ware.message.MessageService;

@Controller
@RequestMapping(value="/message/**")
public class MessageController {
	
	@Inject
	EpaymentService epaymentService;
	@Inject
	MessageService messageService;
	
	
	//delete
	@RequestMapping(value="delete")
	@ResponseBody
	public String delete(int num)throws Exception{
		int result=messageService.delete(num);
		String message="fail";
		if(result>0){
			message="success";
		}
		return message;
	}
	
	//읽음확인
	@RequestMapping(value="readUpdate")
	@ResponseBody
	public void readUpdate(int num)throws Exception{
		messageService.readUpdate(num);
		
	}
	
	
	//selectOne
	@RequestMapping(value="view")
	@ResponseBody
	public MessageDTO selectOne(int num)throws Exception{
		MessageDTO messageDTO=messageService.selectOne(num);
		return messageDTO;
	}
	
	//받은쪽지함
	@RequestMapping(value="rList")
	@ResponseBody
	public ModelAndView rList(String rCode){
		
		ModelAndView mv=new ModelAndView();
	
		try {
			mv=messageService.rList(rCode);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mv.setViewName("/message/messageRList");
		
		return mv;
		
	}
	
	//보낸쪽지함
	@RequestMapping(value="sList")
	@ResponseBody
	public ModelAndView sList(String sCode){
		ModelAndView mv=new ModelAndView();
	
		try {
			mv=messageService.sList(sCode);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mv.setViewName("/message/messageList");
		
		return mv;
		
	}
	
	@RequestMapping(value="memberList")
	@ResponseBody
	public List<MemberDTO> tempMember(String temp) throws Exception{
		
		List<MemberDTO> members=epaymentService.tempMember(temp);

			
		return members;
	}

	
	//insert
	@RequestMapping(value="messageSend")
	@ResponseBody
	public String insert(MessageDTO messageDTO){
		int result=0;
		try {
			result=messageService.insert(messageDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String message="fail";
		
		
		if(result>0){
			message="success";
		}
		
		return message;
		
	}
	
	@RequestMapping(value="messageList")
	@ResponseBody
	public List<Object> signData(HttpSession session, Model model) throws Exception{
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
	
		List<String> temps = epaymentService.tempList();
		List<Object> ar = new ArrayList<Object>();
		
		ar.add(temps);

		
		int readCount=messageService.readCount(memberDTO.getCode());
		
		ar.add(readCount);
		
		return ar;
	}
	


}
