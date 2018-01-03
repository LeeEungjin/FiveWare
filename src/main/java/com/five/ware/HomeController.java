package com.five.ware;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.FilterWriter;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
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
	public String erp(){
		return "AfterLoginMain/erp";
	}
	
	@RequestMapping(value="/groupware")
	public String groupware(){
		return "AfterLoginMain/groupware";
	}
	
	@RequestMapping(value="/srm")
	public String srm(){
		return "AfterLoginMain/srm";
	}
	
	@RequestMapping(value="/codeName")
	@ResponseBody
	public String codeName(HttpSession session) throws Exception{
		
		String filePath = session.getServletContext().getRealPath("resources/code");
		System.out.println(filePath);
		String fileName = "code.code";
		
		File f = new File(filePath, fileName);
		
	
			FileReader fr = new FileReader(f);
			
			BufferedReader br = new BufferedReader(fr);
			
			fileName=br.readLine();
		
		
		System.out.println(fileName);
		String code=fileName;
		char codeChar= code.charAt(0);
		
		String [] cod=code.split("");
		
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
