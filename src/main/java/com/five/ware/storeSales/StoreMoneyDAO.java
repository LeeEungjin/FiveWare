package com.five.ware.storeSales;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.five.ware.jh.mapTest;

@Repository
public class StoreMoneyDAO {

	@Inject
	SqlSession sqlSession;
	private static String NAMESPACE="StoreMoneyMapper.";
	
	public List<StoreMoneyDTO> storeMoneyList(String regdate, String store, String sdate) throws Exception{
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("regdate", regdate);
		map.put("store", store);
		map.put("sdate", sdate);
		
		List<StoreMoneyDTO> ar = sqlSession.selectList(NAMESPACE+"storeMoneyList", map);
		
		return ar;
	}
	
	public List<Integer> storeMoneySum(String regdate, String store) throws Exception{
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("regdate", regdate);
		map.put("store", store);
		
		
		List<Integer> ar = sqlSession.selectList(NAMESPACE+"storeMoneySum", map);
		
		return ar;
	}
}
