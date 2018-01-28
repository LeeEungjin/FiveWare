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
	
	public int storeMoneySum(String regdate, String store) throws Exception{
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("regdate", regdate);
		map.put("store", store);
		
		int result=0;
		try{
			result = sqlSession.selectOne(NAMESPACE+"storeMoneySum", map);
		}catch (Exception e) {
			result=0;
		}
		
		return result;
	}
	
	public int storeMoneyWeekSum(String regdate, String sdate, String store) throws Exception{
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("regdate", regdate);
		map.put("sdate", sdate);
		map.put("store", store);
		
		int result=0;
		try{
			result = sqlSession.selectOne(NAMESPACE+"storeMoneyWeekSum", map);
		}catch (Exception e) {
			result=0;
		}
		
		return result;
	}
}
