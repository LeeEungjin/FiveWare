package com.five.ware.groupware.epayment;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class EpaymentService {

	@Inject
	EpaymentDAO epaymentDAO;
	
	public int epaymentInsert(EpaymentDTO epaymentDTO) throws Exception{
		int result = epaymentDAO.epaymentInsert(epaymentDTO);
		
		return result;
	}
}
