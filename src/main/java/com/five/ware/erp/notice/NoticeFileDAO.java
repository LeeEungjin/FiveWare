package com.five.ware.erp.notice;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeFileDAO {

	@Inject
	private SqlSession sqlSession;
	
	private final String NAMESPACE="noticeFileMapper.";
	
	public List<NoticeDTO> selectList(int num) throws Exception	{
		return sqlSession.selectList(NAMESPACE+"selectList", num);
	}
	
	public int insert(NoticeFileDTO noticeFileDTO) throws Exception	{
		return sqlSession.insert(NAMESPACE+"insert", noticeFileDTO);
	}
	
	public int delete(int fnum)throws Exception{
		return sqlSession.delete(NAMESPACE+"delete", fnum);
	}
	
	
}
