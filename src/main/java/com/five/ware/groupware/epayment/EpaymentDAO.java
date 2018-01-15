package com.five.ware.groupware.epayment;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class EpaymentDAO {

	@Inject
	SqlSession sqlSession;
	private final String NAMESPACE="epaymentMapper.";
	
	public int epaymentInsert(EpaymentDTO epaymentDTO) throws Exception{
		int result = sqlSession.insert(NAMESPACE+"epaymentInsert", epaymentDTO);
		
		return result;
	}
	
	public List<String> tempList() throws Exception{
		List<String> temps=sqlSession.selectList(NAMESPACE+"tempList");
		
		return temps;
	}
	
	public List<String> tempMember(String temp) throws Exception{
		List<String> members=sqlSession.selectList(NAMESPACE+"tempMember", temp);
		
		return members;
	}
}
