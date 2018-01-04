package com.five.ware.eung.controller;

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

@Controller
@RequestMapping(value="erp/foundation/**")
public class ErpFoundationController {
	
	@Inject
	private SupplierService supplierService;
	
	@RequestMapping(value="supplierStop", method={RequestMethod.GET,RequestMethod.POST})
	public void supplierStop(SupplierDTO supplierDTO) {
		// this this this this !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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
			model.addAttribute("path", "../../erp/foundation/supplier");
			
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
			model.addAttribute("path", "../../erp/foundation/supplier");
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
	public ModelAndView supplierList() {	
		ModelAndView mv = new ModelAndView();
		
		try {
			mv = supplierService.selectList();
			mv.setViewName("erp/foundation/supplier");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@RequestMapping(value="supplier", method=RequestMethod.POST)
	public String supplierWrite(SupplierDTO supplierDTO) {
		String message = "";
		
		try {
			int result = supplierService.insert(supplierDTO);
			
			if(result > 0) {
				message = "redirect:./supplier";
			} else {
				// insert fail...
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return message;
	}
}
