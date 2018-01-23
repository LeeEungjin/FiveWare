package com.five.ware.community;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.erp.human.member.MemberDTO;
import com.five.ware.file.FileDTO;

@Transactional
@Service
public class BlackListService {
	
	@Inject
	private BlackListDAO blackListDAO;
	
	public ModelAndView blackList()throws Exception{
		ModelAndView mv=new ModelAndView();
		List<MemberDTO> blackList=new ArrayList<MemberDTO>();
		List<String> writerList=blackListDAO.writerList();
		MemberDTO memberDTO=new MemberDTO();
		List<FileDTO> fileList=new ArrayList<FileDTO>();
		int i=0;
		
		for (String writer : writerList) {
			memberDTO=blackListDAO.blackList(writer);
			
			blackList.add(memberDTO);
			fileList.add(blackListDAO.blackFile(memberDTO.getCode()));
		}
		
		
		mv.addObject("file", fileList);
		mv.addObject("blackList", blackList);
		mv.setViewName("human/blackList/blackList");
		
		return mv;
	}
	
	public int insert(BlackListDTO blackListDTO)throws Exception{
		int result=0;
			
			result=blackListDAO.insert(blackListDTO);
			
		return result;
	}
	
	public String[] codeCheck(int num)throws Exception{
		String code=null;
		String [] codes=null;
		
		code=blackListDAO.codeCheck(num);
		
			codes=code.split(",");
		
		return codes;
	}
	
	public int reportUpdate(int num)throws Exception{
		int result=0;
		
			result=blackListDAO.reportUpdate(num);
			
		return result;
	}
	
	public int namesUpdate(BlackListDTO blackListDTO)throws Exception{
		int result=0;
		
			result=blackListDAO.namesUpdate(blackListDTO);
			
		return result;
	}
	
	public int reportCount(int num)throws Exception{
		int report=0;
		
		report=blackListDAO.reportCount(num);
		
		return report;
	}
	
}
