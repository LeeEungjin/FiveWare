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
import com.five.ware.mater.MaterDTO;
import com.five.ware.order.OrderDTO;

@Repository
public class IntoDAO {
	
	@Inject SqlSession sqlSession;
	private final String NAMESPACE="intoMapper.";
	
	public List<IntoDTO> intoSupplier() throws Exception {
		return sqlSession.selectList(NAMESPACE+"intoSupplier");
	}
	
	public List<IntoDTO> intoProduct() throws Exception {
		return sqlSession.selectList(NAMESPACE+"intoProduct");
	}
	
	public List<IntoDTO> intoMenuregist() throws Exception {
		return sqlSession.selectList(NAMESPACE+"intoMenu");
	}
	
	public List<IntoDTO> orderRegist() throws Exception {
		return sqlSession.selectList(NAMESPACE+"intoOrder");
	}

	public List<IntoDTO> intoStorage() throws Exception {
		return sqlSession.selectList(NAMESPACE+"intoStorage");
	}
	
	public List<IntoDTO> intoMater(String kind) throws Exception {
		return sqlSession.selectList(NAMESPACE+"intoMater2", kind);
	}
	
	public List<IntoDTO> intoMater() throws Exception {
		return sqlSession.selectList(NAMESPACE+"intoMater1");
	}


}
