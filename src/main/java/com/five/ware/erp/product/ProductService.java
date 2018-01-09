package com.five.ware.erp.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.file.FileDAO;
import com.five.ware.file.FileDTO;
import com.five.ware.util.ListData;
import com.five.ware.util.Pager;
import com.five.ware.util.RowNum;

@Service
public class ProductService {
	
	@Inject
	private ProductDAO productDAO;
	
	@Autowired
	private FileDAO fileDAO;

	
	public int delete(String code) throws Exception {
		return productDAO.delete(code);
	}
	
	public int update(ProductDTO productDTO) throws Exception {
		return productDAO.update(productDTO);
	}
	
	public Map<String, Object> selectOne(String code) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<FileDTO> ar = fileDAO.selectList(code);
		ProductDTO productDTO = productDAO.selectOne(code);
		
		map.put("product", productDTO);
		map.put("files", ar);
		
		return map;
	}
	
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
