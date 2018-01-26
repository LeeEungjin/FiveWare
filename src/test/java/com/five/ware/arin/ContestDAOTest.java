package com.five.ware.arin;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.five.ware.AbstractTest;
import com.five.ware.srm.contest.ContestDAO;
import com.five.ware.srm.contest.ContestLikeDTO;
import com.five.ware.srm.contest.ContestListDTO;
import com.five.ware.srm.contest.ContestService;

public class ContestDAOTest extends AbstractTest {

	@Inject
	ContestDAO contestDAO;
	@Autowired
	ContestService contestService;
	
	@Test
	public void test() {
		assertNotNull(contestDAO);
	}
	
	@Test
	public void contest() {
		try {
			selectOne();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void selectOneService() throws Exception {
		String code = "C024";
		int cnum = 7;
		String store = "역곡점";
		
		contestService.likeSelectOne(code, cnum, store);
	}

	public void selectOne() throws Exception {
		String code = "C024";
		int cnum = 7;
		String store = "역곡점";
		
		ContestLikeDTO contestLikeDTO = contestDAO.likeSelectOne(code, cnum, store);
		
		assertNotNull(contestLikeDTO);
		
		System.out.println("code: "+contestLikeDTO.getCode());
	}
}
