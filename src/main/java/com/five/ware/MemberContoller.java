package com.five.ware;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.five.ware.erp.human.member.MemberDTO;
import com.five.ware.erp.human.member.MemberService;
import com.five.ware.erp.storeRegist.StoreRegistDTO;
import com.five.ware.erp.storeRegist.StoreRegistService;

@Controller
@RequestMapping(value="/member/**")
public class MemberContoller {

	@Inject
	MemberService memberService;
	@Inject
	StoreRegistService storeRegistService;
	
	//Checl
	@RequestMapping(value="checkLogin", method={RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public Map<String, Object> checkLogin(HttpSession session, String code, String pw, String login) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean ch = false;

		try {
			if(login.equals("member")) {
				MemberDTO memberDTO = this.memberCheck(code, pw);
				
				if(memberDTO != null) {
					session.setAttribute("member", memberDTO);
					session.setAttribute("kind", "member");
					map.put("name", memberDTO.getName());
					ch = true;
				}
			} else {
				StoreRegistDTO storeRegistDTO = this.storeCheck(code, pw);
				
				if(storeRegistDTO != null) {
					session.setAttribute("member", storeRegistDTO);
					session.setAttribute("kind", "store");
					map.put("name", storeRegistDTO.getName());
					ch = true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		map.put("ch", ch);
		
		return map;
	}
	
	private MemberDTO memberCheck(String code, String pw) throws Exception {
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setCode(code);
		memberDTO.setPw(pw);
		
		return memberService.login(memberDTO);
	}
	
	private StoreRegistDTO storeCheck(String code, String pw) throws Exception {
		StoreRegistDTO storeRegistDTO = new StoreRegistDTO();
		storeRegistDTO.setCode(code);
		storeRegistDTO.setPw(pw);
		
		return storeRegistService.login(storeRegistDTO);
	}
	
	/**********************************************************************/
	
	//storelogin
	@RequestMapping(value="storeLogin", method=RequestMethod.POST)
	public String storeLogin(StoreRegistDTO storeRegistDTO,HttpSession session,RedirectAttributes rd){
		 try {
			storeRegistDTO=storeRegistService.login(storeRegistDTO);
		} catch (Exception e) {
			storeRegistDTO=null;
			e.printStackTrace();
		}
		 if(storeRegistDTO !=null){
			 session.setAttribute("member", storeRegistDTO);
			 session.setAttribute("kind", "store");
		 }
		 
		 return "redirect:/";
	}
	
	
	//logout
	@RequestMapping(value="memberLogout")
	public String memberLogout(HttpSession session) throws Exception{
		session.invalidate();
		
		return "redirect:/";
	}
	
	
	//login
	@RequestMapping(value="memberLogin")
	public String memberLogin(MemberDTO memberDTO,HttpSession session,RedirectAttributes rd){
		
		String message="";
		
		 try {
			memberDTO=memberService.login(memberDTO);
		} catch (Exception e) {
			memberDTO=null;
			e.printStackTrace();
		}
		 if(memberDTO !=null){
			 session.setAttribute("member", memberDTO);
			 session.setAttribute("kind", "member");
		 }else{
			 message="�븘�씠�뵒�� 鍮꾨�踰덊샇瑜� �솗�씤�빐二쇱꽭�슂.";
		 }
		 
		 rd.addFlashAttribute("message", message);
		 
		 
		 return "redirect:/";
	}
	
}
