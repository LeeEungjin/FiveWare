package com.five.ware;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.erp.human.dili.MemberWorkDAO;
import com.five.ware.erp.human.dili.MemberWorkDTO;
import com.five.ware.erp.human.dili.MemberWorkService;
import com.five.ware.erp.product.ProductDTO;
import com.five.ware.excel.ExcelRoom;
import com.five.ware.excel.ExcelView2003;

@Controller
@RequestMapping(value="/excel/**")
public class ExcelController {
	
	@Inject
	private MemberWorkDAO memberWorkDAO;
	@Inject
	private MemberWorkService memberWorkService;
	
	@RequestMapping(value="exportExcel2003", method=RequestMethod.GET)
	public ModelAndView downloadExcel2003(HttpServletResponse response){
		
		response.setHeader("Content-disposition", "attachment; filename=" + "excel_2003" + ".xls");

		List<ExcelRoom> listRooms=new ArrayList<ExcelRoom>();
		
		listRooms.add(new ExcelRoom(1, "Room1", 10));
		listRooms.add(new ExcelRoom(2, "Room2", 20));
		listRooms.add(new ExcelRoom(3, "Room3", 30));
		
		return new ModelAndView("excelView2003", "listRooms", listRooms);
	}
	
	@RequestMapping(value="exportExcel2007", method=RequestMethod.GET)
	public ModelAndView downloadExcel2007(HttpServletResponse response){
		response.setHeader("Content-disposition", "attachment; filename=" + "excel_2007" + ".xls");
		
		List<ExcelRoom> listRooms=new ArrayList<ExcelRoom>();
		
		listRooms.add(new ExcelRoom(1, "Room1", 10));
		listRooms.add(new ExcelRoom(2, "Room2", 20));
		listRooms.add(new ExcelRoom(3, "Room3", 30));
		
		return new ModelAndView("excelView2007", "listRooms", listRooms);
	}
	
	@RequestMapping(value="excelProduct", method=RequestMethod.GET)
	public ModelAndView excelProduct(HttpServletResponse response){
		response.setHeader("Content-disposition", "attachment; filename=" + "excelProduct" + ".xls");
		
		List<ProductDTO> listRooms=new ArrayList<ProductDTO>();
		
		
		
		
		return new ModelAndView("excelView2007", "listRooms", listRooms);
	}
	
	@RequestMapping(value="diliSearchExcel", method=RequestMethod.GET)
	public ModelAndView diliSearchExcel(HttpServletResponse response, String search) throws Exception{
		
		response.setHeader("Content-disposition", "attachment; filename=" + "diliSearchExcel" + ".xls");
		
		ModelAndView mv = new ModelAndView();
		
		memberWorkService.mWorkList(search, mv);
		
		mv.setViewName("excelDiliSearch2007");
		
		
		return mv;
	}
	
	
	
	
	
}
