package com.five.ware.groupware.epayment;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.five.ware.util.ListData;
import com.five.ware.util.Pager;
import com.five.ware.util.RowNum;

@Service
public class FormListService {

	@Inject
	FormListDAO formListDAO;
	
	public void formList(String search, String perPage, int curPage, Model model) throws Exception{
		ListData listData = null;
		
		if(perPage==null){
			 listData = new ListData();
		}else{
			 listData = new ListData(Integer.parseInt(perPage));
		}
		
		listData.setCurPage(curPage);
		
		RowNum rowNum = listData.makeRow();
		
		rowNum.setKind("formname");
		rowNum.setSearch("");
		
		int totalCount = formListDAO.formListCount(search, rowNum);
		
		Pager pager = listData.makePage(totalCount);
		
		List<FormListDTO> ar = formListDAO.formList(search, rowNum);
		
		model.addAttribute("list", ar);
		model.addAttribute("listnum", ar.size());
		model.addAttribute("pager", pager);

	}
}
