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


    //insert
	public int insert(StoreRegistDTO storeRegistDTO) throws Exception{
		
		int result=sqlsession.insert(namespace+"insert", storeRegistDTO);
		
		return result;
	}
		
	
    //list
	public List<StoreRegistDTO> selectList(RowNum rowNum) throws Exception{
		
		return sqlsession.selectList(namespace+"selectList",rowNum);
		
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
	public int update(String code) throws Exception{
		return sqlsession.update(namespace+"update", code);
	}
}
