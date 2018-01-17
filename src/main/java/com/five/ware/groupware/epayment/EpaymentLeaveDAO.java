package com.five.ware.groupware.epayment;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class EpaymentLeaveDAO {

	@Inject
	SqlSession sqlSession;
	private final String NAMESPACE="epaymentLeaveMapper.";
	
	public int approvalInsert(EpaymentLeaveDTO epaymentLeaveDTO) throws Exception{
		int result = sqlSession.insert(NAMESPACE+"approvalInsert", epaymentLeaveDTO);
		
		return result;
	}
}
