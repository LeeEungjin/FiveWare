package com.five.ware.jh;

import static org.junit.Assert.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;

import com.five.ware.AbstractTest;
import com.five.ware.erp.menuRegist.MenuRegistDAO;
import com.five.ware.erp.menuRegist.MenuRegistDTO;
import com.five.ware.erp.menuRegist.MenuRegistService;
import com.five.ware.mater.MaterDAO;
import com.five.ware.mater.MaterOrderDTO;

public class menuRegist extends AbstractTest {
	
	@Inject
	private MenuRegistService menuRegist;
	
	@Inject
	private MenuRegistDAO menuRegistDAO;
	
	@Inject
	private MaterDAO materDAO;
	
	
	
	
	public void insertDAO()throws Exception{
		MenuRegistDTO menuRegistDTO=new MenuRegistDTO();

		menuRegistDTO.setMenuCode("123");
		menuRegistDTO.setMenuKind("커피");
		menuRegistDTO.setMenuName("이름");
		menuRegistDTO.setImgNull("1");
		menuRegistDTO.setPrice(6000);
		menuRegistDTO.setRecipe("레시피");
		menuRegistDTO.setMenuOption("option");

		menuRegistDAO.memuRegistinsert(menuRegistDTO);
	}
	
	
	public void insert(MenuRegistDTO menuRegistDTO)throws Exception{
		menuRegistDTO.setMenuCode("123");
		menuRegistDTO.setMenuKind("커피");
		menuRegistDTO.setMenuName("이름");
		menuRegistDTO.setImgNull("null");
		menuRegistDTO.setPrice(6000);
		menuRegistDTO.setRecipe("레시피");
		menuRegistDTO.setMenuOption("option");
		
		menuRegist.menuRegistInsert(menuRegistDTO);
	}

	@Test
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
		
	}

}
