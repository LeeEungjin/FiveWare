package com.five.ware.storeSales;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class StoreMoneyService {

	@Inject
	StoreMoneyDAO storeMoneyDAO;
	
	
	public void storeMoneyList(String regdate, String store, String sdate, Model model) throws Exception{
		List<StoreMoneyDTO> ar = storeMoneyDAO.storeMoneyList(regdate, store, sdate);
		
		List<List<Object>> result = new ArrayList<List<Object>>();
		List<Object> graphAr= null;
		
		for(int i=0; i<ar.size(); i++){
			//ar은 큰 배열 안에 작은 ar을 생성해서 index0번에 String, 1번에 int를 넣는다.
			graphAr = new ArrayList<Object>();
		
			graphAr.add("'"+ar.get(i).getProduct()+"'");
			graphAr.add(ar.get(i).getProductSales());
			
			result.add(graphAr);
			
		}
		
		String todayMoney = "";
		
		for(int i=0; i<result.size(); i++){
			todayMoney=todayMoney+result.get(i)+",";
		}
		
		model.addAttribute("todayMoney", todayMoney);
		model.addAttribute("list", ar);
	}
	
	public void storeMoneySum(String regdate, String store,Model model ) throws Exception{
		List<Integer> ar = storeMoneyDAO.storeMoneySum(regdate, store);
		
		List<List<Object>> result = new ArrayList<List<Object>>();
		List<Object> graphAr= null;
		
		for(int i=0; i<ar.size(); i++){
			//ar은 큰 배열 안에 작은 ar을 생성해서 index0번에 String, 1번에 int를 넣는다.
			graphAr = new ArrayList<Object>();
		
			graphAr.add("'"+regdate+"'");
			graphAr.add(ar.get(i));
			
			result.add(graphAr);
			
		}
		
		String weekMoney = "";
		
		for(int i=0; i<result.size(); i++){
			weekMoney=weekMoney+result.get(i)+",";
		}
		
		model.addAttribute("weekMoney", weekMoney);
		model.addAttribute("list1", ar);
		
		
	}
}
