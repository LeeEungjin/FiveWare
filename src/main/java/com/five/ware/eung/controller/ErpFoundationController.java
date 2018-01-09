package com.five.ware.eung.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.five.ware.erp.product.ProductDTO;
import com.five.ware.erp.product.ProductService;
import com.five.ware.erp.supplier.SupplierDTO;
import com.five.ware.erp.supplier.SupplierService;
import com.five.ware.util.ListData;

@Controller
@RequestMapping(value="erp/foundation/**")
public class ErpFoundationController {
	
	@Inject
	private SupplierService supplierService;
	@Inject
	private ProductService productService;
	
	
	/* Product Start */
	
	@RequestMapping(value="productDelete", method= {RequestMethod.GET,RequestMethod.POST})
	public String productDelete(String code, Model model) {
		int result = 0;
		
		try {
			result = productService.delete(code);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(result > 0) {
			model.addAttribute("message", "Success");
		} else {
			model.addAttribute("message", "Fail");
		}
		model.addAttribute("addr", "../../erp/foundation/product");
		
		return "common/result";
	}
	
	@RequestMapping(value="productUpdate", method=RequestMethod.POST)
	public String productUpdate(ProductDTO productDTO, Model model) {
		int result = 0;
		
		try {
			result = productService.update(productDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(result > 0) {
			model.addAttribute("message", "Success");
		} else {
			model.addAttribute("message", "Fail");
		}
		model.addAttribute("addr", "../../erp/foundation/product");
		
		return "common/result";
	}
	
	@RequestMapping(value="productOne", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> productOne(String code) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			map = productService.selectOne(code);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return map;
		
	}
	
	@RequestMapping(value="productWrite", method={RequestMethod.POST,RequestMethod.GET})
	public String productWrite(ProductDTO productDTO, Model model) {
		/*System.out.println(productDTO.getCode());
		System.out.println(productDTO.getMemo());
		System.out.println(productDTO.getName());
		System.out.println(productDTO.getPrice());
		System.out.println(productDTO.getStandard());
		System.out.println(productDTO.getUse());*/
		
		try {
			int result = productService.insert(productDTO);
			
			if(result > 0) {
				model.addAttribute("message", "Success");
			} else {
				model.addAttribute("message", "Fail");
			}
			model.addAttribute("addr", "../../erp/foundation/product");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "common/result";
	}
	
	@RequestMapping(value="product", method=RequestMethod.GET)
	public ModelAndView productList(ListData listData) {
		ModelAndView mv = new ModelAndView();
		
		/*System.out.println("KIND: "+ listData.getKind());
		System.out.println("SEARCH: "+ listData.getSearch());*/
		
		try {
			mv = productService.selectList(listData);
			mv.setViewName("erp/foundation/product");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return mv;
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
		
		/*System.out.println("search: " + listData.getSearch());*/
		
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
