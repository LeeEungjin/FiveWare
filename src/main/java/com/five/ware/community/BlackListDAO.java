package com.five.ware.community;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.five.ware.erp.human.member.MemberDTO;
import com.five.ware.file.FileDTO;

@Repository
public class BlackListDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="blackListMapper.";
	
	public int insert(BlackListDTO blackListDTO)throws Exception{
		return sqlSession.insert(namespace+"blackListInsert", blackListDTO);
	}
	
	public int reportUpdate(int num)throws Exception{
		return sqlSession.update(namespace+"reportUpdate", num);
	}
	
	public int namesUpdate(BlackListDTO blackListDTO)throws Exception{
		return sqlSession.update(namespace+"namesUpdate", blackListDTO);
	}
	
	public int reportCount(int num)throws Exception{
		return sqlSession.selectOne(namespace+"reportCount", num);
	}
	
	public String codeCheck(int num)throws Exception{
		return sqlSession.selectOne(namespace+"codeCheck", num);
	}
	
	public List<String> writerList()throws Exception{
		return sqlSession.selectList(namespace+"writerList");
	}
	
	public MemberDTO blackList(String writer)throws Exception{
		return sqlSession.selectOne(namespace+"blackList", writer);
	}
	
	public FileDTO blackFile(String code)throws Exception{
		return sqlSession.selectOne(namespace+"blackFile", code);
	}
	
}
