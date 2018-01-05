package com.five.ware.eung.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.five.ware.erp.supplier.SupplierDTO;
import com.five.ware.erp.supplier.SupplierService;
import com.five.ware.util.ListData;

@Controller
@RequestMapping(value="erp/foundation/**")
public class ErpFoundationController {
	
	@Inject
	private SupplierService supplierService;
	
	
	/* Product Start */
	
	@RequestMapping(value="product", method=RequestMethod.GET)
	public void productList() {
		
	}
	
	/* Product End */
	

	/* Supplier Start */
	
	@RequestMapping(value="supplierStop", method={RequestMethod.GET,RequestMethod.POST})
	public String supplierStop(SupplierDTO supplierDTO, Model model) {
		System.out.println(supplierDTO.getCode());
		System.out.println(supplierDTO.getUse());
		
		
		String use = supplierDTO.getUse();
		
		// true -> false // false -> true
		if(use.equals("true")) { use = "false"; } 
		else { use = "true"; }
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("code", supplierDTO.getCode());
		map.put("use", use);
		
		try {
			int result = supplierService.stop(map);
			
			if(result > 0) {
				model.addAttribute("message", "Success");
			} else {
				model.addAttribute("message", "Fail");
			}
			model.addAttribute("addr", "../../erp/foundation/supplier");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "common/result";
	}
	
	@RequestMapping(value="supplierDelete", method= {RequestMethod.GET,RequestMethod.POST})
	public String supplierDelete(SupplierDTO supplierDTO, Model model) {
		System.out.println("delete code: "+supplierDTO.getCode());
		
		int result = 0;
		try {
			result = supplierService.delete(supplierDTO.getCode());
			if(result > 0) {
				model.addAttribute("message", "Success");
			} else {
				model.addAttribute("message", "Fail");
			}
			model.addAttribute("addr", "../../erp/foundation/supplier");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "common/result";
	}
	
	
	@RequestMapping(value="supplierUpdate", method={RequestMethod.POST,RequestMethod.GET})
	public String supplierUpdate(SupplierDTO supplierDTO, Model model) {
		int result = 0;
		try {
			result = supplierService.update(supplierDTO);
			if(result > 0) {
				model.addAttribute("message", "Success");
			} else {
				model.addAttribute("message", "Fail");
			}
			model.addAttribute("addr", "../../erp/foundation/supplier");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "common/result";
	} 
	
	@RequestMapping(value="supplierOne", method=RequestMethod.GET)
	@ResponseBody
	public SupplierDTO supplierOne(String code, RedirectAttributes rd) {
		System.out.println("code : "+ code);
		
		SupplierDTO supplierDTO = null;
		try {
			supplierDTO = supplierService.selectOne(code);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return supplierDTO;
	}
	
	@RequestMapping(value="supplier", method=RequestMethod.GET)
	public ModelAndView supplierList(ListData listData) {	
		ModelAndView mv = new ModelAndView();
		
		System.out.println("search: " + listData.getSearch());
		
		try {
			mv = supplierService.selectList(listData);
			mv.setViewName("erp/foundation/supplier");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@RequestMapping(value="supplier", method=RequestMethod.POST)
	public String supplierWrite(SupplierDTO supplierDTO, Model model) {
		int result = 0;
		try {
			result = supplierService.insert(supplierDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(result > 0) {
			model.addAttribute("message", "Success");
		} else {
			model.addAttribute("message", "Fail");
		}
		model.addAttribute("addr", "../../erp/foundation/supplier");
		
		return "common/result";
	}
	
	/* Supplier End */
}
