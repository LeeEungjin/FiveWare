package com.five.ware.storeSales;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.erp.menuRegist.MenuRegistDTO;

@Service
public class StoreSalesService {

		@Inject
		StoreSalesDAO storeSalesDAO;
		
		
		//insert
		public int storeMoney(StoreSalesDTO storeSalesDTO,String storeCode)throws Exception{
			List<StoreMoneyDTO> list = new ArrayList<StoreMoneyDTO>();
			List<String> ar=new ArrayList<String>();
			ar=storeSalesDAO.menuList();
			
			int result=0;
			
			for(String str : ar){
				System.out.println(str);
				storeSalesDTO.setProduct(str);
				
				StoreMoneyDTO storeMoneyDTO=new StoreMoneyDTO();
				storeMoneyDTO.setProduct(str);
				///////////////////////////////////////////////////////////////////////
				storeMoneyDTO.setSalesAmount(storeSalesDAO.salesAmount(storeSalesDTO));
				storeMoneyDTO.setProductSales(storeSalesDAO.productSales(storeSalesDTO));
				storeMoneyDTO.setStore(storeSalesDTO.getStore());
				storeMoneyDTO.setStoreCode(storeCode);
				
				System.out.println("--------------StoreMoneyDTO-------------");
				System.out.println(storeMoneyDTO.getProduct());
				System.out.println(storeMoneyDTO.getProductSales());
				System.out.println(storeMoneyDTO.getSalesAmount());
				System.out.println(storeMoneyDTO.getStore());
				System.out.println(storeMoneyDTO.getStoreCode());
				System.out.println("---------------------------------------");
				
				list.add(storeMoneyDTO);
			}
			
			for (StoreMoneyDTO storeMoneyDTO : list) {
				/////////////////////여기여기여기여기여기여기여기여기//////////////////////////
				result=storeSalesDAO.storeMoneyInsert(storeMoneyDTO);
				
			}
			
				return result;
			
		}
		
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
			int salesAmount=storeSalesDTO.getSalesAmount();
			int productSales=storeSalesDTO.getProductSales();
			String tempSales = String.valueOf(salesAmount);
			String tempProducts = String.valueOf(productSales);

			String pro[]=product.split(",");
			String amount[]=tempSales.split(",");
			String sales[]=tempProducts.split(",");

			
			storeSalesDTO.setNum(storeSalesDAO.getNum());
			
			int result=0;
						
				for(int i=0; i<pro.length; i++){
					storeSalesDTO.setProduct(pro[i]);
					storeSalesDTO.setSalesAmount(Integer.parseInt(amount[i]));
					storeSalesDTO.setProductSales(Integer.parseInt(sales[i]));
					
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
