package com.five.ware.erp.into;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.five.ware.erp.menuRegist.MenuRegistDTO;
import com.five.ware.erp.product.ProductDTO;
import com.five.ware.erp.storageRegist.StorageRegistDTO;
import com.five.ware.erp.supplier.SupplierDTO;
import com.five.ware.mater.MaterDTO;
import com.five.ware.order.OrderDTO;

@Service
public class IntoService {
	
	@Inject
	private IntoDAO intoDAO;
	
	public List<SupplierDTO> intoSupplier() throws Exception {
		return intoDAO.intoSupplier();
	}
	
	public List<ProductDTO> intoProduct() throws Exception {
		return intoDAO.intoProduct();
	}
	
	public List<MenuRegistDTO> intoMenuregist() throws Exception {
		return intoDAO.intoMenuregist();
	}
	
	public List<OrderDTO> intoOrder() throws Exception {
		return intoDAO.orderRegist();
	}

	public List<StorageRegistDTO> intoStorage() throws Exception {
		return intoDAO.intoStorage();
	}
	
	public List<MaterDTO> intoMater(String kind) throws Exception {
		return intoDAO.intoMater(kind);
	}

}
