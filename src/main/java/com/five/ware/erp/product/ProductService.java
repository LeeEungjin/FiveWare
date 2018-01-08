package com.five.ware.erp.product;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.util.ListData;
import com.five.ware.util.Pager;
import com.five.ware.util.RowNum;

@Service
public class ProductService {
	
	@Inject
	private ProductDAO productDAO;

	
	public int insert(ProductDTO productDTO) throws Exception {
		return productDAO.insert(productDTO);
	}
	
	public ModelAndView selectList(ListData listData) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		RowNum rowNum = listData.makeRow();
		
		Pager pager = listData.makePage(productDAO.totalCount(rowNum));
		List<ProductDTO> ar = productDAO.selectList(rowNum);
		
		mv.addObject("list", ar).addObject("pager", pager);
		
		return mv;
	}
}
