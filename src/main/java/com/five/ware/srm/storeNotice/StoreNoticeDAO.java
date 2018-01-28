package com.five.ware.srm.storeNotice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.five.ware.util.ListData;
import com.five.ware.util.RowNum;

@Repository
public class StoreNoticeDAO {
	@Inject
	private SqlSession sqlsession;
	private static final String namespace="storeNoticeMapper.";
	
	
	public int getNum()throws Exception{
		return sqlsession.selectOne(namespace+"getnum");
	}
	
	//update
	public int update(StoreNoticeDTO storeNoticeDTO)throws Exception{
		int result=sqlsession.update(namespace+"update",storeNoticeDTO);
		
		return result;
	}
	
	//hit
	public int hit(int num)throws Exception{
		return sqlsession.update(namespace+"hitUpdate", num);
	}
	
	//delete
	public int delete(int num)throws Exception{
		int result=sqlsession.delete(namespace+"delete",num);
		return result;
	}
	
	//selectOne
	public StoreNoticeDTO selectOne(int num)throws Exception{
		return sqlsession.selectOne(namespace+"selectOne", num);
	}
	
	//insert
	public int insert(StoreNoticeDTO storeNoticeDTO)throws Exception{
		int result=sqlsession.insert(namespace+"insert",storeNoticeDTO);
		
		return result;
		
	}

	//list
	public List<StoreNoticeDTO> selectList(RowNum rowNum,ListData listData)throws Exception{
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("startRow", rowNum.getStartRow());
		map.put("lastRow", rowNum.getLastRow());
		map.put("kind", listData.getKind());
		map.put("search", listData.getSearch());
		
		return sqlsession.selectList(namespace+"selectList", map);
	}
	
	
	//replyList
	public List<StoreNoticeDTO> replyList(int num)throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("num", num);
		map.put("kind", "답글");
		
		return sqlsession.selectList(namespace+"replyView", map);
	}
	
	//totalCount
	public int totalCount(RowNum rowNum)throws Exception{
		return sqlsession.selectOne(namespace+"totalCount", rowNum);
		
	}

}
