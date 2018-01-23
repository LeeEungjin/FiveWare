package com.five.ware.jh;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Test;

import com.five.ware.AbstractTest;
import com.five.ware.groupware.epayment.EpaymentDAO;
import com.five.ware.groupware.epayment.EpaymentDTO;
import com.five.ware.groupware.epayment.EpaymentLeaveDAO;
import com.five.ware.groupware.epayment.EpaymentLeaveDTO;
import com.five.ware.groupware.epayment.EpaymentLeaveService;
import com.five.ware.groupware.epayment.EpaymentService;

public class epayTest extends AbstractTest {
	
	@Inject
	private EpaymentLeaveDAO epayDAO;
	@Inject
	private EpaymentLeaveService eService;
	
	public void update()throws Exception{
		
		EpaymentDTO epaymentDTO=new EpaymentDTO();
		epaymentDTO.setTitle("2");
		epaymentDTO.setContents("2");
		epaymentDTO.setDocunum("D205");
		
		eService.epaymentUpdate(epaymentDTO);
		
	}
	
	@Test
	public void test() {
		try {
			this.update();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
