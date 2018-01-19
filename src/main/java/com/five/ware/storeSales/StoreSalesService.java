package com.five.ware.storeSales;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class StoreSalesService {

		@Inject
		StoreSalesDAO storeSalesDAO;
		
		public int insert(StoreSalesDTO storeSalesDTO)throws Exception{
			int result=storeSalesDAO.insert(storeSalesDTO);
			return result;
		}
}
