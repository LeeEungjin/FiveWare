package com.five.ware.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.five.ware.common.CommonDTO;

public class AuthorInterceptor extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		boolean check = false;
		
		HttpSession session = request.getSession();
		
		if(((CommonDTO)session.getAttribute("member")) == null) {
			modelAndView.setViewName("common/authorResult");
			modelAndView.addObject("check", !check);
			
		} // END if
		
	}
}
