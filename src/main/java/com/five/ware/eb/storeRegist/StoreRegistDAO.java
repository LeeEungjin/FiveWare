package com.five.ware.eb.storeRegist;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class StoreRegistDAO {
@Inject
private SqlSession sqlsession;
private static final String NAMESPACE="storeRegistMapper.";

public int insert(StoreRegistDTO storeRegistDTO) throws Exception{
	
	int result=sqlsession.insert(NAMESPACE+"insert", storeRegistDTO);
	return result;
}
	
}
