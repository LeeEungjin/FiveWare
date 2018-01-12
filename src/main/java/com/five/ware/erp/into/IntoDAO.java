package com.five.ware.erp.into;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.five.ware.erp.menuRegist.MenuRegistDTO;
import com.five.ware.erp.product.ProductDTO;
import com.five.ware.erp.storageRegist.StorageRegistDTO;
import com.five.ware.erp.supplier.SupplierDTO;
import com.five.ware.jh.menuRegist;
import com.five.ware.mater.MaterDTO;
import com.five.ware.order.OrderDTO;

@Repository
public class IntoDAO {
	
	@Inject SqlSession sqlSession;
	private final String NAMESPACE="intoMapper.";
	
	public List<SupplierDTO> intoSupplier() throws Exception {
		return sqlSession.selectList(NAMESPACE+"intoSupplier");
	}
	
	public List<ProductDTO> intoProduct() throws Exception {
		return sqlSession.selectList(NAMESPACE+"intoProduct");
	}
	
	public List<MenuRegistDTO> intoMenuregist() throws Exception {
		return sqlSession.selectList(NAMESPACE+"intoMenu");
	}
	
	public List<OrderDTO> orderRegist() throws Exception {
		return sqlSession.selectList(NAMESPACE+"intoOrder");
	}

	public List<StorageRegistDTO> intoStorage() throws Exception {
		return sqlSession.selectList(NAMESPACE+"intoStorage");
	}
	
	public List<MaterDTO> intoMater(String kind) throws Exception {
		return sqlSession.selectList(NAMESPACE+"intoMater", kind);
	}


}
