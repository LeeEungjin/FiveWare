package com.five.ware.erp.human.member;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class MemberService {

	@Inject
	MemberDAO memberDAO;
}
