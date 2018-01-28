package com.five.ware.ar.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import oracle.security.o3logon.a;

@Controller
@RequestMapping(value="srm/pos/**")
public class StoreMoneyController {
	
	@Inject
	StoreMoneyService storeMoneyService;

	@RequestMapping(value="revenueTable")
	public String revenueTable(String regdate, String sdate, String kind, HttpSession session, Model model) throws Exception{
		StoreRegistDTO storeDTO= (StoreRegistDTO) session.getAttribute("member");
		String store = storeDTO.getStore();
		
		Calendar ca = Calendar.getInstance();
		
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		String todayd = sd.format(ca.getTime());
		
		if(regdate==null){
			regdate=todayd;
		}
		
		
		
		if(kind==null){
			kind="today";
		}
		
		String[] ymd = regdate.split("-");
		String state="";
		int moneytotal=0;
		
		List<Integer> weeksum=new ArrayList<Integer>();
		List<String> weekday=new ArrayList<String>();
		List<List<Object>> result=new ArrayList<List<Object>>();
		List<Object> graphAr= null;
		
		if(kind.equals("today")){
			sdate=regdate;
			state="오늘";
			System.out.println("today:"+sdate);
		}else if(kind.equals("week")){
			state="지난 일주일";
			int year = Integer.parseInt(ymd[0]);
			int month = Integer.parseInt(ymd[1]);
			int day = Integer.parseInt(ymd[2]);
			
			ca.set(year, month-1, day);
			ca.add(Calendar.DAY_OF_MONTH, -6); 
			
			sdate = sd.format(ca.getTime());
			
			System.out.println("일주일 전 날짜: "+sdate);
			
			int start = Integer.parseInt(ymd[2]);
			
			for(int i=6; i>=0; i--){
				int s=start-i;
				
				ca.set(Calendar.DAY_OF_MONTH, s);
				String startdate=sd.format(ca.getTime());
				
				System.out.println(startdate);
				int sum=storeMoneyService.storeMoneySum(startdate, store);
				
				weeksum.add(sum);
				weekday.add(startdate);
				moneytotal=moneytotal+sum;
				
				System.out.println(weeksum);
				System.out.println(moneytotal);
			}
			model.addAttribute("moneytotal", moneytotal);
			
			for(int i=0; i<weekday.size(); i++){
				//ar은 큰 배열 안에 작은 ar을 생성해서 index0번에 String, 1번에 int를 넣는다.
				graphAr = new ArrayList<Object>();
			
			/*	graphAr.add(i+1);*/
				graphAr.add("'"+weekday.get(i)+"'");
				graphAr.add(weeksum.get(i));
				
				result.add(graphAr);
			}
			
			String sumgraph="";
			
			for(int j=0; j<result.size(); j++){
				sumgraph=sumgraph+result.get(j)+",";
			}
			
			model.addAttribute("sumgraph", sumgraph);
			
		}else if(kind.equals("month")){
			state="지난 한달";
			int year = Integer.parseInt(ymd[0]);
			int month = Integer.parseInt(ymd[1]);
			int day = Integer.parseInt(ymd[2]);
			
			ca.set(year, month-1, day);
			
			sdate = sd.format(ca.getTime());
			
			String edate=regdate;
			for(int i=1; i<=5; i++){
				ca.add(Calendar.DAY_OF_MONTH, -6); 
				
				sdate = sd.format(ca.getTime());
				
				System.out.println("일주일 전:" + sdate);
				System.out.println("edate before : " + edate);
				int monthsum = storeMoneyService.storeMoneyWeekSum(edate, sdate, store);
				
				System.out.println(monthsum);
				edate=sdate;
				System.out.println("edate after : " + edate);
				weeksum.add(monthsum);
				weekday.add(i+"주일 전");
				moneytotal=moneytotal+monthsum;
			}
			model.addAttribute("moneytotal", moneytotal);
			
			for(int i=0; i<weeksum.size(); i++){
				
				graphAr=new ArrayList<Object>();
				
				graphAr.add("'"+weekday.get(i)+"'");
				graphAr.add(weeksum.get(i));
				
				result.add(graphAr);
			}
			
			String monthsum="";
			
			for(int i=0; i<result.size(); i++){
				monthsum=monthsum+result.get(i)+",";
			}
			
			model.addAttribute("monthsum", monthsum);
			
		}
		
		
		storeMoneyService.storeMoneyList(regdate, store, sdate, model);
	
		
		model.addAttribute("kind", kind);
		model.addAttribute("todayd", regdate);
		model.addAttribute("state", state);
		
		return "srm/pos/revenueTable";
		
	}
}
