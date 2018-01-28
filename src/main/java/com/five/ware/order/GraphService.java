package com.five.ware.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mortbay.util.ajax.JSON;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@Service
public class GraphService {
	
	@Inject
	private GraphDAO graphDAO;
	
	public ModelAndView amountGraph()throws Exception{
		ModelAndView mv=new ModelAndView();
		
		List<String> codeList=new ArrayList<String>();
		List<Integer> amountList=new ArrayList<Integer>();
		List<Object> graphAr= null;
		List<List<Object>> result=new ArrayList<List<Object>>();
		int amount=0;
		List<Double> amountAvg=new ArrayList<Double>();
		List<Double> priceAvg=new ArrayList<Double>();
		double Aavg=0.0;
		double Pavg=0.0;
		Map<String, Object> map=new HashMap<String, Object>();
		
		codeList=graphDAO.codeList();
		
		for(String code : codeList){
			Aavg=graphDAO.amountAvg(code);
			Pavg=graphDAO.priceAvg(code);
			
			amountAvg.add(Aavg);
			priceAvg.add(Pavg);
		}
		
		
		for(String code : codeList){
			amount=graphDAO.amoutSum(code);
			
			amountList.add(amount);
		}
		
		
		for(int i=0; i<codeList.size(); i++){
			//ar은 큰 배열 안에 작은 ar을 생성해서 index0번에 String, 1번에 int를 넣는다.
			graphAr = new ArrayList<Object>();
		
			graphAr.add("'"+codeList.get(i)+"'");
			graphAr.add(amountList.get(i));
			
			result.add(graphAr);
			
		}
		
		String a="";
		
		for(int j=0; j<result.size(); j++){
			a=a+result.get(j)+",";
		}
		
		map.put("code", codeList);
		map.put("amount", amountAvg);
		map.put("price", priceAvg);
		
		mv.addObject("a", a);
		mv.addObject("count", codeList.size());
		mv.addObject("map", map);
		
		/*mv.addObject("codeList", codeList);
		mv.addObject("Aavg", amountAvg);
		mv.addObject("Pavg", priceAvg);*/
		
		return mv;
		
	}
	
	

}
