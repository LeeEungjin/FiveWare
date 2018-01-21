package com.five.ware.groupware.epayment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.five.ware.file.FileDTO;

@Repository
public class EpaymentLeaveDAO {

	@Inject
	SqlSession sqlSession;
	private final String NAMESPACE="epaymentLeaveMapper.";
	
	public int approvalInsert(EpaymentLeaveDTO epaymentLeaveDTO) throws Exception{
		int result = sqlSession.insert(NAMESPACE+"approvalInsert", epaymentLeaveDTO);
		
		return result;
	}
	
	public List<EpaymentLeaveDTO> myepaymentList(String code, int statenum) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code",code);
		map.put("statenum", statenum);
		List<EpaymentLeaveDTO> ar = sqlSession.selectList(NAMESPACE+"myepaymentList", map);
		
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
	
	public int stampok(EpaymentLeaveDTO epaymentLeaveDTO) throws Exception{
		int result = sqlSession.update(NAMESPACE+"stampok", epaymentLeaveDTO);
		
		return result;
	}
	
	public int stampok2(EpaymentLeaveDTO epaymentLeaveDTO) throws Exception{
		int result = sqlSession.update(NAMESPACE+"stampok2", epaymentLeaveDTO);
		
		return result;
	}
	
	public String maxRanking(EpaymentLeaveDTO epaymentLeaveDTO) throws Exception{
		String result = sqlSession.selectOne(NAMESPACE+"maxRanking", epaymentLeaveDTO);
		
		return result;
	}
	
	public List<EpaymentDTO> totalList(String state) throws Exception{
		List<EpaymentDTO> ar = sqlSession.selectList(NAMESPACE+"totalList", state);
		
		return ar;
	}
	
	public List<EpaymentDTO> storageList(String code, String state) throws Exception{
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("code", code);
		map.put("state", state);
		
		List<EpaymentDTO> ar = sqlSession.selectList(NAMESPACE+"storageList", map);
		
		return ar;
	}
	
	public EpaymentDTO viewOneModal(String docunum) throws Exception{
		EpaymentDTO epaymentDTO = sqlSession.selectOne(NAMESPACE+"viewOneModal", docunum);
		
		return epaymentDTO;
	}
	
	public List<EpaymentDTO> sendEpaymentList(String code) throws Exception{
		List<EpaymentDTO> ar = sqlSession.selectList(NAMESPACE+"sendEpaymentList", code);
		
		return ar;
	}
	
	public int epaymentFile(FileDTO fileDTO) throws Exception{
		int result = sqlSession.insert(NAMESPACE+"epaymentFile", fileDTO);
		
		return result;
	}
	
	public List<FileDTO> epaymentFileList(String docunum) throws Exception{
		List<FileDTO> ar = sqlSession.selectList(NAMESPACE+"epaymentFileList", docunum);
		
		return ar;
	}
}
