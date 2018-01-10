package com.five.ware.jh;

import static org.junit.Assert.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.five.ware.AbstractTest;
import com.five.ware.erp.menuRegist.MenuRegistDAO;
import com.five.ware.erp.menuRegist.MenuRegistDTO;
import com.five.ware.erp.menuRegist.MenuRegistService;
import com.five.ware.erp.storageRegist.StorageRegistDAO;
import com.five.ware.mater.MaterDAO;
import com.five.ware.mater.MaterOrderDTO;
import com.five.ware.util.RowNum;

public class menuRegist extends AbstractTest {
	
	@Inject
	private MenuRegistService menuRegist;
	
	@Inject
	private MenuRegistDAO menuRegistDAO;
	
	@Inject
	private MaterDAO materDAO;
	
	@Autowired
	private StorageRegistDAO storageRegistDAO;
	
	
	
	
	public void insertDAO()throws Exception{
		MenuRegistDTO menuRegistDTO=new MenuRegistDTO();

		menuRegistDTO.setMenuCode("123");
		menuRegistDTO.setMenuKind("而ㅽ뵾");
		menuRegistDTO.setMenuName("�씠由�");
		menuRegistDTO.setImgNull("1");
		menuRegistDTO.setPrice(6000);
		menuRegistDTO.setRecipe("�젅�떆�뵾");
		menuRegistDTO.setMenuOption("option");

		menuRegistDAO.memuRegistinsert(menuRegistDTO);
	}
	
	
	public void insert(MenuRegistDTO menuRegistDTO)throws Exception{
		menuRegistDTO.setMenuCode("123");
		menuRegistDTO.setMenuKind("而ㅽ뵾");
		menuRegistDTO.setMenuName("�씠由�");
		menuRegistDTO.setImgNull("null");
		menuRegistDTO.setPrice(6000);
		menuRegistDTO.setRecipe("�젅�떆�뵾");
		menuRegistDTO.setMenuOption("option");
		
		menuRegist.menuRegistInsert(menuRegistDTO);
	}
	
	@Test
	public void totalCount() {
		RowNum rowNum = new RowNum();
		rowNum.setKind("storagename");
		rowNum.setSearch("");
		
		int result = 0;
		try {
			result = storageRegistDAO.totalCount(rowNum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		assertTrue(result == 0);
		System.out.println(result);
	}
	
	@Override @Test
	public void test() {
		
	}

	/*@Test
	public void test() {
		List<MaterOrderDTO> ar=null;
		try {
			ar=materDAO.materOrder();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		for(int i=0; i<ar.size(); i++){
			System.out.println(ar.get(i).getOrderCode());
			System.out.println(ar.get(i).getAccount());
			System.out.println(ar.get(i).getCode());
		}
		
	}*/

}
