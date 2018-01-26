package com.five.ware.srm.contest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.five.ware.file.FileDTO;
import com.five.ware.util.RowNum;

@Repository
public class ContestDAO {

	@Inject
	SqlSession sqlSession;
	private static String NAMESPACE="contestMapper.";
	
	public int contestInsert(ContestListDTO contestListDTO) throws Exception{
		int result = sqlSession.insert(NAMESPACE+"contestInsert", contestListDTO);
		
		return result;
	}
	
	public int contestFileInsert(FileDTO fileDTO) throws Exception{
		int result = sqlSession.insert(NAMESPACE+"contestFileInsert", fileDTO);
		
		return result;
	}
	
	public List<ContestListDTO> contestList(RowNum rowNum) throws Exception{
		List<ContestListDTO> ar = sqlSession.selectList(NAMESPACE+"contestList", rowNum);
		
		return ar;
	}
	
	public List<FileDTO> fileList() throws Exception{
		List<FileDTO> ar = sqlSession.selectList(NAMESPACE+"fileList");
		
		return ar;
	}
	
	public int contestJoinInsert(ContestJoinDTO contestJoinDTO) throws Exception{
		int result = sqlSession.insert(NAMESPACE+"contestJoinInsert", contestJoinDTO);
		
		return result;
	}
	
	public List<ContestJoinDTO> contestJoinList() throws Exception{
		List<ContestJoinDTO> ar = sqlSession.selectList(NAMESPACE+"contestJoinList");
		
		return ar;
	}
	
	public int contestListCount() throws Exception{
		int totalcount = sqlSession.selectOne(NAMESPACE+"contestListCount");
		
		return totalcount;
	}
	
	public int contestJoinListCount() throws Exception{
		int totalCount = sqlSession.selectOne(NAMESPACE+"contestJoinListCount");
		
		return totalCount;
	}
	
	public int likeInsert(int cnum, String code, String store) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("code", code);
		map.put("cnum", cnum);
		map.put("store", store);
		
		int result = sqlSession.insert(NAMESPACE+"likeInsert", map);
		
		return result;
	}
	
	public int likeDelete(int cnum, String store) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("cnum", cnum);
		map.put("store", store);
		
		int result = sqlSession.delete(NAMESPACE+"likeDelete", map);
		
		return result;
	}
	
	public ContestLikeDTO likeSelectOne(ContestLikeDTO contestLikeDTO) throws Exception{
		ContestLikeDTO contestLikeDTO2 = sqlSession.selectOne(NAMESPACE+"likeSelectOne", contestLikeDTO);
		
		return contestLikeDTO2;
	}
	
	public ContestJoinDTO contestJoinView(String cnum) throws Exception{
		ContestJoinDTO contestJoinDTO = sqlSession.selectOne(NAMESPACE+"contestJoinView", cnum);
		
		return contestJoinDTO;
	}
}
