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
		
		int moneytotal=0;
		
		for(int i=0; i<ar.size(); i++){
			//ar은 큰 배열 안에 작은 ar을 생성해서 index0번에 String, 1번에 int를 넣는다.
			graphAr = new ArrayList<Object>();
		
			graphAr.add("'"+ar.get(i).getProduct()+"'");
			graphAr.add(ar.get(i).getProductSales());
			
			moneytotal = moneytotal+ar.get(i).getProductSales();
			
			
			result.add(graphAr);
			
		}
		
		String todayMoney = "";
		
		for(int i=0; i<result.size(); i++){
			todayMoney=todayMoney+result.get(i)+",";
		}
		
		model.addAttribute("moneytotal", moneytotal);
		model.addAttribute("todayMoney", todayMoney);
		model.addAttribute("list", ar);
	}
	
	public int storeMoneySum(String startdate, String store) throws Exception{
		 int result = storeMoneyDAO.storeMoneySum(startdate, store);
		
		return result;
	}
	
	public int storeMoneyWeekSum(String regdate, String sdate, String store) throws Exception{
		int result = storeMoneyDAO.storeMoneyWeekSum(regdate, sdate, store);
		
		return result;
	}
}
