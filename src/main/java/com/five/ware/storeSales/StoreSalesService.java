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

				storeSalesDTO.setProduct(str);
				
				StoreMoneyDTO storeMoneyDTO=new StoreMoneyDTO();
				storeMoneyDTO.setProduct(str);
				storeMoneyDTO.setSalesAmount(storeSalesDAO.salesAmount(storeSalesDTO));
				storeMoneyDTO.setProductSales(storeSalesDAO.productSales(storeSalesDTO));
				storeMoneyDTO.setStore(storeSalesDTO.getStore());
				storeMoneyDTO.setStoreCode(storeCode);
				storeMoneyDTO.setRegdate(storeSalesDTO.getRegdate());
			
				
				list.add(storeMoneyDTO);
			}
			
			for (StoreMoneyDTO storeMoneyDTO : list) {
				
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
		
		
		
		//salesList
		public ModelAndView salesList(String store, String product, String regdate)throws Exception{
			ModelAndView mv=new ModelAndView();
			
			List<StoreMoneyDTO> ar=new ArrayList<StoreMoneyDTO>();
			ar=storeSalesDAO.salesList(store, product, regdate);
			mv.addObject("list", ar);
			
			return mv;
		}
		//insert
		public int insert(StoreSalesDTO storeSalesDTO,int [] salesAmount, int [] productSales)throws Exception{

			String product=storeSalesDTO.getProduct();
		
			String pro[]=product.split(",");
			
			
			int result=0;
			
			storeSalesDTO.setNum(storeSalesDAO.getNum());
			
						
				for(int i=0; i<pro.length; i++){
					System.out.println(salesAmount[i]);
					
					storeSalesDTO.setProduct(pro[i]);
					storeSalesDTO.setSalesAmount(salesAmount[i]);
					storeSalesDTO.setProductSales(productSales[i]);
					
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
