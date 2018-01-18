package com.five.ware.jh;

import static org.junit.Assert.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;

import com.five.ware.AbstractTest;
import com.five.ware.map.MapDAO;
import com.five.ware.map.MapService;

public class mapTest extends AbstractTest {
	
	@Inject
	private MapDAO mapDAO;
	
	@Inject
	private MapService mapService;
	
	public void map()throws Exception{
		
	}
	
	public void mapList()throws Exception{
		List<String> mapList=mapDAO.mapList();
		
		for (String location : mapList) {
			System.out.println(location);
			Float[] geo=mapDAO.geoCoding(location);
			
			for (Float float1 : geo) {
				System.out.println("---------");
				System.out.println(float1);
			}
			
		}
		
	}
	
	public void geoCoding(String location){
		
	}
	
	@Test
	public void test() {
		try {
			this.mapList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
