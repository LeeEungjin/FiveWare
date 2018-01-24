package com.five.ware.jh;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;

import org.junit.Test;

import com.five.ware.AbstractTest;
import com.five.ware.community.CommunityDAO;
import com.five.ware.community.CommunityDTO;

public class randomTest extends AbstractTest {
	
	@Inject
	private CommunityDAO communityDAO;
	
	
	public void random()throws Exception{
		CommunityDTO communityDTO=new CommunityDTO();
		List<Integer> numList=new ArrayList<Integer>();
		Random random=new Random();
		int r=0;
		
		numList=communityDAO.numList();
		int[] ar = new int[numList.size()];
		r = (int)(Math.random()*numList.size())+1;
		
		for(int i=0; i<numList.size(); i++){
			ar[i]=numList.get(i);
		}
		
		int num=ar[r];
		
		//랜덤 값 r을 ar의 인덱스로 사용해서 numList의 num 값 뽑아오기
		//그 num값으로 selectOne 하기
		
		communityDTO=communityDAO.selectOne(num);
		
		System.out.println(communityDTO.getContents());
		
	}
	
	@Test
	public void test() {
		try {
			this.random();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
