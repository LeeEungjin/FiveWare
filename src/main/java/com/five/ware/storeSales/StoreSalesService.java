package com.five.ware.storeSales;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class StoreSalesService {

		@Inject
		StoreSalesDAO storeSalesDAO;
		
		
		//selectOne
		public ModelAndView selectOne(int num)throws Exception{
			ModelAndView mv=new ModelAndView();
			StoreSalesDTO storeSalesDTO=storeSalesDAO.selectOne(num);
			List<String> ar1=new ArrayList<String>();
			
			String[] product=storeSalesDTO.getProduct().split(",");
			String [] amount=storeSalesDTO.getSalesAmount().split(",");
			String [] price=storeSalesDTO.getProductSales().split(",");
			
			
		
			for(String dto_product : product){

				ar1.add(dto_product);
			}
		
			List<String> ar2=new ArrayList<String>();
			for(String dto_amount : amount){

				ar2.add(dto_amount);
			}
			
			List<String> ar3=new ArrayList<String>();
			for(String dto_price : price){

				ar3.add(dto_price);
			}
			
			
			mv.addObject("list", storeSalesDTO);
			mv.addObject("ar1", ar1);
			mv.addObject("ar2", ar2);
			mv.addObject("ar3", ar3);
			
			
			return mv;
		}
		
		//list
		public ModelAndView selectList(StoreSalesDTO storeSalesDTO)throws Exception{
			storeSalesDTO.setStore("강남점");
			ModelAndView mv=new ModelAndView();
			
			
			List<StoreSalesDTO> ar=new ArrayList<StoreSalesDTO>();

			
			ar=storeSalesDAO.selectList(storeSalesDTO);
			

			
			mv.addObject("list", ar);
			
			return mv;
		}
		
		//insert
		public int insert(StoreSalesDTO storeSalesDTO)throws Exception{
			int result=storeSalesDAO.insert(storeSalesDTO);
			return result;
		}
}
