package com.five.ware.groupware.epayment;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class FormListService {

	@Inject
	FormListDAO formListDAO;
	
	public List<FormListDTO> formList(String search) throws Exception{
		List<FormListDTO> ar = formListDAO.formList(search);
		
		return ar;
	}
}
