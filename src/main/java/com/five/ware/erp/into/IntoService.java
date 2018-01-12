package com.five.ware.erp.into;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class IntoService {
	
	@Inject
	private IntoDAO intoDAO;
	
	public List<IntoDTO> intoList(String tableName) throws Exception {
		if(tableName.equals("supplier")) {
			return this.intoSupplier();
		} else if(tableName.equals("product")) {
			return this.intoProduct();
		} else if(tableName.equals("menu")) {
			return this.intoMenuregist();
		} else if(tableName.equals("storage")) {
			return this.intoStorage();
		} else if(tableName.equals("order")) {
			return this.intoOrder();
		} else {
			return null;
		}
	}
	
	public Map<String, List<IntoDTO>> intoList() throws Exception {
		Map<String, List<IntoDTO>> map = new HashMap<String, List<IntoDTO>>();
		
		map.put("enter", this.intoMater("enter"));
		map.put("rele", this.intoMater("rele"));
		map.put("back", this.intoMater("back"));
		map.put("confin", this.intoMater("confin"));
		
		return map;
	}
	
	public List<IntoDTO> intoSupplier() throws Exception {
		return intoDAO.intoSupplier();
	}
	
	public List<IntoDTO> intoProduct() throws Exception {
		return intoDAO.intoProduct();
	}
	
	public List<IntoDTO> intoMenuregist() throws Exception {
		return intoDAO.intoMenuregist();
	}
	
	public List<IntoDTO> intoOrder() throws Exception {
		return intoDAO.orderRegist();
	}

	public List<IntoDTO> intoStorage() throws Exception {
		return intoDAO.intoStorage();
	}
	
	public List<IntoDTO> intoMater(String kind) throws Exception {
		return intoDAO.intoMater(kind);
	}
	
	public List<IntoDTO> intoMater() throws Exception {
		return intoDAO.intoMater();
	}

}
