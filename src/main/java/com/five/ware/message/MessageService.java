package com.five.ware.message;

import java.util.ArrayList; 
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

@Service
public class MessageService {

	@Inject
	private MessageDAO messageDAO;
	
	//read Count
	public int readCount(String rCode)throws Exception{
		
		System.out.println(rCode);
		
		int readCount=messageDAO.readCount(rCode);

		System.out.println(readCount);
		
		return readCount;
	}
	
	
	//delete
	public int delete(int num)throws Exception{
		int result=messageDAO.delete(num);
		return result;
	}
	
	//update
	public int readUpdate(int num)throws Exception{
		int result=messageDAO.readUpdate(num);
		return result;
	}
	
	//selectOne
	public MessageDTO selectOne(int num)throws Exception{
		MessageDTO messageDTO=messageDAO.selectOne(num);
		return messageDTO;
	}
	
	//받은 리스트
	public ModelAndView rList(String rCode)throws Exception{
		ModelAndView mv=new ModelAndView();
		List<MessageDTO> rList=messageDAO.rList(rCode);
		mv.addObject("sList", rList);
		return mv;
	}
	
	//보낸 리스트
	public ModelAndView sList(String sCode)throws Exception{
		ModelAndView mv=new ModelAndView();
		List<MessageDTO> sList=messageDAO.sList(sCode);
		mv.addObject("sList", sList);
		return mv;
	
	}
	
	//insert
	public int insert(MessageDTO messageDTO)throws Exception{
		int result=messageDAO.insert(messageDTO);
		return result;
	}
}
