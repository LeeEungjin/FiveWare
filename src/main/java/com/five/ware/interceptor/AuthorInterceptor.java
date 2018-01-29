package com.five.ware.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.five.ware.common.CommonDTO;
import com.five.ware.erp.human.member.MemberDTO;
import com.five.ware.erp.storeRegist.StoreRegistDTO;

public class AuthorInterceptor extends HandlerInterceptorAdapter {

   @Override
   public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
         ModelAndView modelAndView) throws Exception {
	   // 본사 SRM 서로 못들어가게!!!
      boolean check = false;
      
      HttpSession session = request.getSession();
      
      if(((CommonDTO)session.getAttribute("member")) == null) {
         modelAndView.setViewName("common/authorResult");
         modelAndView.addObject("check", !check);
         
      } else { // when session is
    	  if(session.getAttribute("kind").equals("member")) {
    		 MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
    		 
    		 if(memberDTO.getCode().equals(memberDTO.getPw())) {
    			 modelAndView.setViewName("common/passwordResult");
    	         modelAndView.addObject("check", !check);
    		 }
    		 
    		  
    	  } else {
    		 StoreRegistDTO storeRegistDTO = (StoreRegistDTO)session.getAttribute("member");
    		 
    		 if(storeRegistDTO.getCode().equals(storeRegistDTO.getPw())) {
    			 modelAndView.setViewName("common/passwordResult");
    	         modelAndView.addObject("check", !check);
    		 }
    		 
    	  }
      }
   }
}
      
