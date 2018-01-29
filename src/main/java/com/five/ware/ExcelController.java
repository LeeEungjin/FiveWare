package com.five.ware;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.erp.into.IntoDTO;
import com.five.ware.erp.into.IntoService;
import com.five.ware.erp.human.dili.MemberWorkDAO;
import com.five.ware.erp.human.dili.MemberWorkDTO;
import com.five.ware.erp.human.dili.MemberWorkService;
import com.five.ware.erp.product.ProductDTO;
import com.five.ware.excel.ExcelRoom;

@Controller
@RequestMapping(value="/excel/**")
public class ExcelController {
	
	@Inject
	private IntoService intoService;
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
	
	@RequestMapping(value="{tableName}/excel2007", method=RequestMethod.GET)
	public ModelAndView downloadExcel(HttpServletResponse response, @PathVariable String tableName){
		response.setHeader("Content-disposition", "attachment; filename=" + "excel_"+tableName+ ".xls");
		
		List<IntoDTO> ar = null;
		try {
			ar = intoService.intoList(tableName.toLowerCase());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ModelAndView("excelView2007", "listRooms", ar);
	}
	
	@RequestMapping(value="mater/excel2007", method=RequestMethod.GET)
	public ModelAndView downloadExcel2(HttpServletResponse response){
		response.setHeader("Content-disposition", "attachment; filename=" + "excelMater" + ".xls");
		
		Map<String, List<IntoDTO>> map = new HashMap<String, List<IntoDTO>>();
		
		try {
			map = intoService.intoList();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ModelAndView("excelMultiView2007", "list", map);
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
