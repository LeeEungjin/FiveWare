package com.five.ware.ar.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.five.ware.erp.storeRegist.StoreRegistDTO;
import com.five.ware.storeSales.StoreMoneyDTO;
import com.five.ware.storeSales.StoreMoneyService;

@Controller
@RequestMapping(value="srm/pos/**")
public class StoreMoneyController {
	
	@Inject
	StoreMoneyService storeMoneyService;

	@RequestMapping(value="revenueTable")
	public String revenueTable(String regdate, String sdate, String kind, HttpSession session, Model model) throws Exception{
		Calendar ca = Calendar.getInstance();
		
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		String todayd = sd.format(ca.getTime());
		
		if(regdate==null){
			regdate=todayd;
		}
		
		//ca.set(year, month, date);
		//ca.add(field, amount); 
		//날짜를 꺼내서 찍어보기 몇년도 몇월 며칠이냐  // 잘 나왔나
		
		if(kind==null){
			kind="today";
		}
		
		System.out.println(kind);
		
		String[] ymd = regdate.split("-");
		
		if(kind.equals("today")){
			sdate=regdate;
			System.out.println("today:"+sdate);
		}else if(kind.equals("week")){
			int day = Integer.parseInt(ymd[2]);
			
			day = day-7;
			System.out.println(day);
			sdate = String.valueOf(day);
			sdate=ymd[0]+"-"+ymd[1]+"-"+sdate;
			System.out.println("일주일 전 날짜: "+sdate);
		}else if(kind.equals("month")){
			int month = Integer.parseInt(ymd[1]);
			
			month = month-1;
			
			if(month==0){
				month=12;
				int year=Integer.parseInt(ymd[0]);
				year = year-1;
				ymd[0]=String.valueOf(year);
			}

			sdate=String.valueOf(month);
			sdate=ymd[0]+"-"+sdate+"-"+ymd[2];
			System.out.println("한달 전 날짜"+sdate);
		}
		
		StoreRegistDTO storeDTO= (StoreRegistDTO) session.getAttribute("member");
		String store = storeDTO.getStore();
		
		Date d=(Date)sd.parse(sdate);
		
		System.out.println(d);
		String s = sd.format(d);
		System.out.println(s);
		storeMoneyService.storeMoneyList(regdate, store, sdate, model);
	/*	for(String i=sdate; i<=regdate; i++){
			
		}*/
		storeMoneyService.storeMoneySum(regdate, store, model);
		
		model.addAttribute("kind", kind);
		model.addAttribute("todayd", regdate);
		
		return "srm/pos/revenueTable";
		
	}
}
