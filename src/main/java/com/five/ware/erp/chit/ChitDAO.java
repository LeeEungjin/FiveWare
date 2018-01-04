package com.five.ware.erp.chit;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.five.ware.erp.accountRegist.AccountRegistDTO;
import com.five.ware.erp.tempRegist.TempRegistDTO;

@Repository
public class ChitDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="chitMapper.";
	
	//chitTempList
	public List<String> chitTempList() throws Exception{
		
		return sqlSession.selectList(namespace+"selectList_temp");
	}
	
	//chitAccountList
	public List<AccountRegistDTO> chitAccountList() throws Exception{
		return sqlSession.selectList(namespace+"selectList_account");
	}

}
