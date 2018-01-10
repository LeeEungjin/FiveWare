package com.five.ware;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.excel.ExcelRoom;
import com.five.ware.excel.ExcelView2003;

@Controller
public class ExcelController {
	
	@RequestMapping(value="/exportExcel2003", method=RequestMethod.GET)
	public ModelAndView downloadExcel2003(HttpServletResponse response){
		
		response.setHeader("Content-disposition", "attachment; filename=" + "excel_2003" + ".xls");

		List<ExcelRoom> listRooms=new ArrayList<ExcelRoom>();
		
		listRooms.add(new ExcelRoom(1, "Room1", 10));
		listRooms.add(new ExcelRoom(2, "Room2", 20));
		listRooms.add(new ExcelRoom(3, "Room3", 30));
		
		return new ModelAndView("excelView2003", "listRooms", listRooms);
	}
	
	@RequestMapping(value="/exportExcel2007", method=RequestMethod.GET)
	public ModelAndView downloadExcel2007(HttpServletResponse response){
		response.setHeader("Content-disposition", "attachment; filename=" + "excel_2007" + ".xls");
		
		List<ExcelRoom> listRooms=new ArrayList<ExcelRoom>();
		
		listRooms.add(new ExcelRoom(1, "Room1", 10));
		listRooms.add(new ExcelRoom(2, "Room2", 20));
		listRooms.add(new ExcelRoom(3, "Room3", 30));
		
		return new ModelAndView("excelView2007", "listRooms", listRooms);
	}
}
