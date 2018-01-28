package com.five.ware.storeSales;


import java.util.ArrayList;

import java.util.List;


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
			List<StoreSalesDTO> ar=storeSalesDAO.selectOne(num);
	
			
			mv.addObject("list", ar);
	
			return mv;
		}
		
		//list
		public ModelAndView selectList(StoreSalesDTO storeSalesDTO)throws Exception{
			
			ModelAndView mv=new ModelAndView();
			
			
			List<StoreSalesDTO> ar=new ArrayList<StoreSalesDTO>();

			
			ar=storeSalesDAO.selectList(storeSalesDTO);
			

			
			mv.addObject("list", ar);
			
			return mv;
		}
		
		//insert
		public int insert(StoreSalesDTO storeSalesDTO)throws Exception{

			String product=storeSalesDTO.getProduct();
			String salesAmount=storeSalesDTO.getSalesAmount();
			String productSales=storeSalesDTO.getProductSales();

			String pro[]=product.split(",");
			String amount[]=salesAmount.split(",");
			String sales[]=productSales.split(",");

			
			storeSalesDTO.setNum(storeSalesDAO.getNum());
			
			int result=0;
						
				for(int i=0; i<pro.length; i++){
					storeSalesDTO.setProduct(pro[i]);
					storeSalesDTO.setSalesAmount(amount[i]);
					storeSalesDTO.setProductSales(sales[i]);
					
					try {
						result=storeSalesDAO.insert(storeSalesDTO);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
			return result;
		}
}
