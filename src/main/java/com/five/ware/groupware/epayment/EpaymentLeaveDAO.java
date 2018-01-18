package com.five.ware.groupware.epayment;

import java.util.List;

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
	
	public List<EpaymentLeaveDTO> myepaymentList(String code) throws Exception{
		List<EpaymentLeaveDTO> ar = sqlSession.selectList(NAMESPACE+"myepaymentList", code);
		
		return ar;
	}
	
	public EpaymentLeaveDTO myepaymentList2(EpaymentLeaveDTO epaymentLeaveDTO) throws Exception{
		EpaymentLeaveDTO ar = sqlSession.selectOne(NAMESPACE+"myepaymentList2", epaymentLeaveDTO);
		
		return ar;
	}
	
	public EpaymentDTO myepaymentListContents(String docunum) throws Exception{
		EpaymentDTO epaymentDTO = sqlSession.selectOne(NAMESPACE+"myepaymentListContents", docunum);
		
		return epaymentDTO;
	}
	
	public List<EpaymentLeaveDTO> myepaymentMember(EpaymentDTO epaymentDTO) throws Exception{
		List<EpaymentLeaveDTO> ar = sqlSession.selectList(NAMESPACE+"myepaymentMember", epaymentDTO);
		
		return ar;
	}
}
