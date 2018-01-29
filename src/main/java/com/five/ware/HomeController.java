package com.five.ware;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.FilterWriter;
import java.io.IOException;
import java.lang.annotation.Inherited;
import java.nio.Buffer;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.community.CommunityDTO;
import com.five.ware.community.CommunityService;
import com.five.ware.community.FreeDTO;
import com.five.ware.community.FreeService;
import com.five.ware.event.EventDTO;
import com.five.ware.event.EventService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Inject
	private CommunityService communityService;
	
	@Inject
	private FreeService freeService;
	
	@Inject
	private EventService eventService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value="/afterLoginHome")
	public String AfterLoginHome(){
		return "AfterLoginMain/AfterLoginHome";
	}
	
	@RequestMapping(value="/erp")
	public ModelAndView erp(){
		List<CommunityDTO> randomList=new ArrayList<CommunityDTO>();
		Calendar ca = Calendar.getInstance();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		String sysdate = sd.format(ca.getTime());
		ModelAndView mv = new ModelAndView();
		
		try {
			randomList=communityService.randomNotice();
			
			System.out.println(randomList.size());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("randomList", randomList);
		mv.addObject("sysdate", sysdate);
		mv.setViewName("AfterLoginMain/erp");
		
		return mv;
	}
	
	@RequestMapping(value="/GroupWare")
	public ModelAndView groupware(){
		ModelAndView mv=new ModelAndView();
		List<FreeDTO> randomList=new ArrayList<FreeDTO>();
		
		System.out.println("????");
		
		try {
			randomList=freeService.randomNotice();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("randomList", randomList);
		mv.setViewName("AfterLoginMain/GroupWare");
		
		return mv;
	}
	
	@RequestMapping(value="/srm")
	public ModelAndView srm(){
		ModelAndView mv=new ModelAndView();
		List<EventDTO> randomList=new ArrayList<EventDTO>();
		
		try {
			randomList=eventService.randomNotice();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("randomList", randomList);
		mv.setViewName("AfterLoginMain/srm");
		
		return mv;
	}
	
	
	@RequestMapping(value="/codeName")
	@ResponseBody
	public String codeName(HttpSession session) throws Exception{
		String filePath = session.getServletContext().getRealPath("resources/code");
		String fileName = "code.code";
		File f = new File(filePath, fileName);		
		// 占쎈솁占쎌뵬 占쎌뵭占쎌뱽 餓ο옙�뜮占�
			FileReader fr = new FileReader(f);
			// 占쎈솁占쎌뵬 占쎌뵭疫뀐옙
			BufferedReader br = new BufferedReader(fr);
			// 占쎈립 餓κ쑴�뱽 占쎌뵭占쎈선占쏙옙占쎌뵬
			fileName=br.readLine();
		
		String code=fileName;
		char codeChar= code.charAt(0);
		
		// String [] cod=code.split("");
		
		code=code.substring(1);
		int num=Integer.parseInt(code);
		
		num++;
		
		if(num>999){
			num=0;
		}
		
		code=String.valueOf(num);
		String codeNum="";
		
		for(int i=0; i<3-code.length(); i++){
			codeNum="0"+codeNum;
		}
		
		code=codeNum+code;
		
		if(code.equals("000")){
			num=codeChar;
			num++;
			codeChar=(char)num;
		}
		
		code = codeChar + code;

		FileWriter fw = new FileWriter(f);
		
		fw.write(code);
		
		fw.flush();
		
		fw.close();
		br.close();
		fr.close();
		
		return code;
	
	}
	
	@RequestMapping(value="/memberNum")
	@ResponseBody
	public String memberNum(HttpSession session) throws Exception{
		String filePath = session.getServletContext().getRealPath("resources/code");
		
		Calendar ca = Calendar.getInstance();		
		SimpleDateFormat sd = new SimpleDateFormat("yyMMdd");
		
		String fileName=sd.format(ca.getTime());
		
		File f = new File(filePath, "memberCode");
		
		FileReader fr = new FileReader(f);		
		BufferedReader br = new BufferedReader(fr);		
		String code = br.readLine();
		
		String [] ar = code.split("-");
		
		if(ar[0].equals(fileName)){
			int num = Integer.parseInt(ar[1]);
			
			num++;
			
			code=String.valueOf(num);
			
			String codeNum="";
			
			for(int i=0; i<3-code.length(); i++){
				codeNum="0"+codeNum;
			}
			
			code=codeNum+code;
			code=ar[0]+"-"+code;
			
		}else {
			code=fileName+"-001";			
		}
		
		FileWriter fw = new FileWriter(f);
		
		fw.write(code);
		fw.flush();
		fw.close();
		
		System.out.println("�굜遺얜굡:"+code);		
		
		return code;
	}
	
	@RequestMapping(value="/storeNum")
	@ResponseBody
	public String storeNum(HttpSession session) throws Exception{
		String filePath = session.getServletContext().getRealPath("resources/code");
		String fileName = "storeCode";
		File f = new File(filePath, fileName);		
		// 占쎈솁占쎌뵬 占쎌뵭占쎌뱽 餓ο옙�뜮占�
			FileReader fr = new FileReader(f);
			// 占쎈솁占쎌뵬 占쎌뵭疫뀐옙
			BufferedReader br = new BufferedReader(fr);
			// 占쎈립 餓κ쑴�뱽 占쎌뵭占쎈선占쏙옙占쎌뵬
			fileName=br.readLine();
		
		String code=fileName;
		char codeChar= code.charAt(0);
		
		// String [] cod=code.split("");
		
		code=code.substring(1);
		int num=Integer.parseInt(code);
		
		num++;
		
		if(num>999){
			num=0;
		}
		
		code=String.valueOf(num);
		String codeNum="";
		
		for(int i=0; i<3-code.length(); i++){
			codeNum="0"+codeNum;
		}
		
		code=codeNum+code;
		
		if(code.equals("000")){
			num=codeChar;
			num++;
			codeChar=(char)num;
		}
		
		code = codeChar + code;

		FileWriter fw = new FileWriter(f);
		
		fw.write(code);
		
		fw.flush();
		
		fw.close();
		br.close();
		fr.close();
		
		return code;
	}
	
}
