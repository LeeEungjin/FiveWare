package com.five.ware.jh;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Test;

import com.five.ware.AbstractTest;
import com.five.ware.erp.menuRegist.MenuRegistDAO;
import com.five.ware.erp.menuRegist.MenuRegistDTO;
import com.five.ware.erp.menuRegist.MenuRegistService;

public class menuRegist extends AbstractTest {
	
	@Inject
	private MenuRegistService menuRegist;
	
	@Inject
	private MenuRegistDAO menuRegistDAO;
	
	
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
		MenuRegistDTO menuRegistDTO=new MenuRegistDTO();

		menuRegistDTO.setMenuCode("123");
		menuRegistDTO.setMenuKind("커피");
		menuRegistDTO.setMenuName("이름");
		menuRegistDTO.setImgNull("null");
		menuRegistDTO.setPrice(6000);
		menuRegistDTO.setRecipe("레시피");
		menuRegistDTO.setMenuOption("option");
		
		try {
			menuRegist.menuRegistInsert(menuRegistDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
