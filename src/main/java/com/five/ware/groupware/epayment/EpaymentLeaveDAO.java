package com.five.ware.groupware.epayment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.five.ware.file.FileDTO;
import com.five.ware.util.RowNum;

@Repository
public class EpaymentLeaveDAO {

	@Inject
	SqlSession sqlSession;
	private final String NAMESPACE="epaymentLeaveMapper.";
	
	public int approvalInsert(EpaymentLeaveDTO epaymentLeaveDTO) throws Exception{
		int result = sqlSession.insert(NAMESPACE+"approvalInsert", epaymentLeaveDTO);
		
		return result;
	}
	
	public List<EpaymentLeaveDTO> myepaymentList(String code, int statenum, RowNum rowNum) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
	
		map.put("code",code);
		map.put("statenum", statenum);
		map.put("rowNum", rowNum);

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
	
	public List<EpaymentDTO> totalList(String state, RowNum rownum) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("rowNum", rownum);
		map.put("state", state);
		
		List<EpaymentDTO> ar = sqlSession.selectList(NAMESPACE+"totalList", map);
		
		return ar;
	}
	
	public int totalListCount(String state, RowNum rownum) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("rowNum", rownum);
		map.put("state", state);
		
		int result = sqlSession.selectOne(NAMESPACE+"totalListCount", map);
		
		return result;
	}
	
	public List<EpaymentDTO> storageList(String code, String state, RowNum rowNum) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("code", code);
		map.put("state", state);
		map.put("rowNum", rowNum);
		
		List<EpaymentDTO> ar = sqlSession.selectList(NAMESPACE+"storageList", map);
		
		return ar;
	}
	
	public int storageListCount(String code, String state, RowNum rowNum) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("code", code);
		map.put("state", state);
		map.put("rowNum", rowNum);
		
		int result = sqlSession.selectOne(NAMESPACE+"storageListCount", map);
		
		return result;
	}
	
	public EpaymentDTO viewOneModal(String docunum) throws Exception{
		EpaymentDTO epaymentDTO = sqlSession.selectOne(NAMESPACE+"viewOneModal", docunum);
		
		return epaymentDTO;
	}
	
	public List<EpaymentDTO> sendEpaymentList(String code, RowNum rowNum) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("code", code);
		map.put("rowNum", rowNum);
		
		List<EpaymentDTO> ar = sqlSession.selectList(NAMESPACE+"sendEpaymentList", map);
		
		return ar;
	}
	
	public int sendEpaymentListCount(String code, RowNum rowNum) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("code", code);
		map.put("rowNum", rowNum);
		
		int result = sqlSession.selectOne(NAMESPACE+"sendEpaymentListCount", map);
		
		return result;
	}
	
	public int epaymentFile(FileDTO fileDTO) throws Exception{
		int result = sqlSession.insert(NAMESPACE+"epaymentFile", fileDTO);
		
		return result;
	}
	
	public List<FileDTO> epaymentFileList(String docunum) throws Exception{
		List<FileDTO> ar = sqlSession.selectList(NAMESPACE+"epaymentFileList", docunum);
		
		return ar;
	}
	
	public int myepaymentListCount(String code, int statenum, RowNum rowNum) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
	
		map.put("code",code);
		map.put("statenum", statenum);
		map.put("rowNum", rowNum);

		int result = sqlSession.selectOne(NAMESPACE+"myepaymentListCount", map);
		
		return result;
	}
	
	public int epaymentUpdate(EpaymentDTO epaymentDTO) throws Exception{
		int result = sqlSession.update(NAMESPACE+"epaymentUpdate", epaymentDTO);
		
		return result;
	}
	
	public int epaymentUpdateState(EpaymentDTO epaymentDTO) throws Exception{
		int result = sqlSession.update(NAMESPACE+"epaymentUpdateState", epaymentDTO);
		
		return result;
	}
	
	public int epaymentUpdateState2(EpaymentDTO epaymentDTO) throws Exception{
		int result = sqlSession.update(NAMESPACE+"epaymentUpdateState2", epaymentDTO);
		
		return result;
	}
	
	public int epaymentDelete(String docunum) throws Exception{
		int result = sqlSession.delete(NAMESPACE+"epaymentDelete", docunum);
		
		return result;
	}
	
	public int epaymentDelete2(String docunum) throws Exception{
		int result = sqlSession.delete(NAMESPACE+"epaymentDelete2", docunum);
		
		return result;
	}
	
	public int epaymentDelete3(String docunum) throws Exception{
		int result = sqlSession.delete(NAMESPACE+"epaymentDelete3", docunum);
		
		return result;
	}
}
