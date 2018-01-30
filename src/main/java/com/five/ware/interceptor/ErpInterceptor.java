package com.five.ware.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.five.ware.common.CommonDTO;
import com.five.ware.erp.human.member.MemberDTO;
import com.five.ware.erp.storeRegist.StoreRegistDTO;

public class ErpInterceptor extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		boolean check = false;
		
		HttpSession session = request.getSession();
		
		if(((CommonDTO)session.getAttribute("member")) != null) {
			String kind = (String)session.getAttribute("kind");
			if(kind.equals("member")) {
				modelAndView.setViewName("common/notErpResult");
				modelAndView.addObject("check", !check);
			}
			
		}
		
	}
}
