package com.five.ware.storeSales;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.five.ware.erp.menuRegist.MenuRegistDTO;
import com.five.ware.util.ListData;

@Repository
public class StoreSalesDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="storeSalesMapper.";
	
	
	//menuList
	public List<String> menuList()throws Exception{
		
		return sqlSession.selectList(namespace+"menuList");
	}
	
	//storeMoney insert
	public int storeMoneyInsert(StoreMoneyDTO storeMoneyDTO)throws Exception{
		int result=sqlSession.insert(namespace+"storeMoneyInsert", storeMoneyDTO);
		return result;
	}
	
	//총갯수
	public int salesAmount(StoreSalesDTO storeSalesDTO)throws Exception{
	
		return sqlSession.selectOne(namespace+"salesAmount", storeSalesDTO);
	}
	
	//총 금액
	public int productSales(StoreSalesDTO storeSalesDTO)throws Exception{
	
		return sqlSession.selectOne(namespace+"productAmount", storeSalesDTO);
	}
	
	//시퀀스
	public int getNum()throws Exception{
		
		return sqlSession.selectOne(namespace+"getNum");
	}
	
	//selectOne
	public List<StoreSalesDTO> selectOne(int num)throws Exception{
		return sqlSession.selectList(namespace+"selectOne", num);
	}
	
	//list
	public List<StoreSalesDTO> selectList(StoreSalesDTO storeSalesDTO)throws Exception{
		return sqlSession.selectList(namespace+"selectList", storeSalesDTO);
	}
	
	//storeSearch
	public List<StoreMoneyDTO> salesList(String store, String product,String regdate)throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("store", store);
		map.put("product", product);
		map.put("regdate", regdate);
		
		return sqlSession.selectList(namespace+"salseList", map);
	}
	//insert
	public int insert(StoreSalesDTO storeSalesDTO)throws Exception{
		int result=sqlSession.insert(namespace+"insert", storeSalesDTO);
		return result;
	}

}
