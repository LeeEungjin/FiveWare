package com.five.ware.srm.staff;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.five.ware.util.ListData;
import com.five.ware.util.RowNum;

@Repository
public class StaffDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String namespace="staffMapper.";
	
	
	
	
	//delete
	public int delete(String num)throws Exception{
		int result=sqlSession.delete(namespace+"delete", num);
		return result;
	}
	
	
	//staffTime update
	public int staffTimeUpdate(StaffTimeDTO staffTimeDTO)throws Exception{
		int result=sqlSession.update(namespace+"staffTimeUpdate", staffTimeDTO);
		return result;
	}
	
	//update
	public int update(StaffDTO staffDTO) throws Exception{
		int result=sqlSession.update(namespace+"update", staffDTO);
		
		return result;
		
	}
	//selectOne
	public StaffDTO selectOne(String num)throws Exception{
		
		return sqlSession.selectOne(namespace+"selectOne",num);
	}
	
	//staff time
	public int staffTime(StaffTimeDTO staffTimeDTO)throws Exception{
		int result=sqlSession.insert(namespace+"staffTime",staffTimeDTO);
		
		return result;
	}
	
	//insert
	public int insert(StaffDTO staffDTO) throws Exception{
		int result=sqlSession.insert(namespace+"insert", staffDTO);
		
		return result;
	}
	
	//직원 출퇴근 조회
	public List<StaffTimeDTO> staffTimeList(RowNum rowNum, ListData listData,String store)throws Exception{
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("startRow", rowNum.getStartRow());
		map.put("lastRow", rowNum.getLastRow());
		map.put("kind", listData.getKind());
		map.put("search", listData.getSearch());
		map.put("store", store);
		return sqlSession.selectList(namespace+"staffTimeList", map);
	}
	
	//pos staff List
	public List<StaffDTO> posStaffList(String store)throws Exception{
		return sqlSession.selectList(namespace+"posStaffList", store);
	}
	
	//list
	public List<StaffDTO> selectList(RowNum rowNum, ListData listData,String store) throws Exception{
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("startRow", rowNum.getStartRow());
		map.put("lastRow", rowNum.getLastRow());
		map.put("kind", listData.getKind());
		map.put("search", listData.getSearch());
		map.put("store", store);
		
		return sqlSession.selectList(namespace+"selectList", map);
	}
	
	//totalCountTime
		public int totalCountTime(RowNum rowNum) throws Exception{
			return sqlSession.selectOne(namespace+"totalCount", rowNum);
		}
	
	//totalCount
	public int totalCount(RowNum rowNum) throws Exception{
		return sqlSession.selectOne(namespace+"totalCount", rowNum);
	}
}
