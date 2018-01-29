package com.five.ware.erp.storeRegist;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.five.ware.util.ListData;
import com.five.ware.util.RowNum;

@Repository
public class StoreRegistDAO {
@Inject
private SqlSession sqlsession;
private static final String namespace="storeRegistMapper.";


		//pw 변경
		public int pwUpdate(String code,String pw)throws Exception{
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("code", code);
			map.put("pw", pw);
			int result=sqlsession.update(namespace+"pwUpdate",map);
			return result;
		}
		
		//pw 확인
		public String pwCheck(String code)throws Exception{
			String dbpw="";
			
			dbpw=sqlsession.selectOne(namespace+"pwCheck", code);
		
			return dbpw;
		}

   //myPageUpdate
	public int myPageUpdate(StoreRegistDTO storeRegistDTO) throws Exception{
		int result=sqlsession.update(namespace+"myPageUpdate" ,storeRegistDTO);
		return result;
	}

    //login
	public StoreRegistDTO login(StoreRegistDTO storeRegistDTO)throws Exception{
		return sqlsession.selectOne(namespace+"login", storeRegistDTO);
	}

    //insert
	public int insert(StoreRegistDTO storeRegistDTO) throws Exception{
		
		int result=sqlsession.insert(namespace+"insert", storeRegistDTO);
		
		return result;
	}
	
	//allStoreList
	public List<StoreRegistDTO> allStoreList()throws Exception{
		
		return sqlsession.selectList(namespace+"allStoreList");
	}
		
	
    //list
	public List<StoreRegistDTO> selectList(RowNum rowNum, ListData listData) throws Exception{
		Map<String , Object> map=new HashMap<String, Object>();
		map.put("startRow", rowNum.getStartRow());
		map.put("lastRow", rowNum.getLastRow());
		map.put("kind", listData.getKind());
		map.put("search", listData.getSearch());
		
		
		return sqlsession.selectList(namespace+"selectList",map);
		
	}
	
	//totalCount
	public int totalCount(RowNum rowNum) throws Exception{
	
		
		return sqlsession.selectOne(namespace+"totalCount", rowNum);
	}

	
	//selectOne
	public StoreRegistDTO selectOne(String code) throws Exception{
		
		return sqlsession.selectOne(namespace+"selectOne", code);
	}

	//delete
	public int delete(String code) throws Exception{
		
		return sqlsession.delete(namespace+"delete", code);
	}

	//update
	public int update(StoreRegistDTO storeRegistDTO) throws Exception{
		return sqlsession.update(namespace+"update", storeRegistDTO);
	}
}
