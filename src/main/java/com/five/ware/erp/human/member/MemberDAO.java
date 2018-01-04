package com.five.ware.erp.human.member;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Inject
	SqlSession sqlSession;
	private final String NAMESPACE="humanMemberMapper.";
}
