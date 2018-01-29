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
	
	public List<ContestJoinDTO> contestJoinList(RowNum rownum, String code) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		System.out.println("zhem"+code);
		
		map.put("rowNum", rownum);
		map.put("code", code);
		
		List<ContestJoinDTO> ar = sqlSession.selectList(NAMESPACE+"contestJoinList", map);
		
		return ar;
	}
	
	public int contestJoinListTotal(String code) throws Exception{
		System.out.println("zhem"+code);
		int reuslt = sqlSession.selectOne(NAMESPACE+"contestJoinListTotal", code);
		
		return reuslt;
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
	
	public ContestLikeDTO likeSelectOne(String code, int cnum, String store) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("code", code);
		map.put("cnum", cnum);
		map.put("store", store);
		
		System.out.println(code);
		System.out.println(cnum);
		System.out.println(store);
		/*ContestLikeDTO contestLikeDTO2=new ContestLikeDTO();
		
		contestLikeDTO2 = sqlSession.selectOne(NAMESPACE+"likeSelectOne", map);
		
		System.out.println(contestLikeDTO2.getCode());
		*/
		return sqlSession.selectOne(NAMESPACE+"likeSelectOne", map);
	}
	
	public ContestLikeDTO likeSelectJoin(ContestLikeDTO contestLikeDTO) throws Exception{
		ContestLikeDTO contestLikeDTO2 = sqlSession.selectOne(NAMESPACE+"likeSelectJoin", contestLikeDTO);
		
		return contestLikeDTO2;
	}
	
	public ContestJoinDTO contestJoinView(String cnum) throws Exception{
		ContestJoinDTO contestJoinDTO = sqlSession.selectOne(NAMESPACE+"contestJoinView", cnum);
		
		return contestJoinDTO;
	}
	
	public int likeSelectJoinCount(ContestListDTO contestListDTO, String store) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("contestLIstDTO", contestListDTO);
		map.put("store", store);
		
		int result = sqlSession.selectOne(NAMESPACE+"likeSelectJoinCount", map);
		
		return result;
	}
	
	public int likeCount(String code, int cnum) throws Exception{
		Map<String, Object> map= new HashMap<String, Object>();
		
		map.put("code", code);
		map.put("cnum", cnum);
		
		int result = sqlSession.selectOne(NAMESPACE+"likeCount", map);
		
		return result;
	}
	
	public int maxCnum(String code) throws Exception{
		int result = sqlSession.selectOne(NAMESPACE+"maxCnum", code);
		
		return result;
	}
	
	public ContestListDTO likeResultCode(String code) throws Exception{
		ContestListDTO contestListDTO = sqlSession.selectOne(NAMESPACE+"likeResultCode", code);
		
		return contestListDTO;
	}
}
