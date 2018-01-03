package com.five.ware.erp.storeRegist;

import java.util.List;

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

	public int insert(StoreRegistDTO storeRegistDTO) throws Exception{
		
		int result=sqlsession.insert(namespace+"insert", storeRegistDTO);
		
		return result;
	}
		
	public List<StoreRegistDTO> selectList(RowNum rowNum) throws Exception{
		
		return sqlsession.selectList(namespace+"selectList",rowNum);
		
	}
	
	public int totalCount(RowNum rowNum) throws Exception{
		return sqlsession.selectOne(namespace+"totalCount", rowNum);
	}

	
	public StoreRegistDTO selectOne(String code) throws Exception{
		
		return sqlsession.selectOne(namespace+"selectOne", code);
	}


}
