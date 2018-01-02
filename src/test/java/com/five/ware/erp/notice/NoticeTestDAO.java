package com.five.ware.erp.notice;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;

import com.five.ware.AbstractTest;


public class NoticeTestDAO extends AbstractTest {
	
	@Inject
	private NoticeDAO noticeDAO;

	@Test
	public void test() {
		try {
			this.selectList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void selectList() throws Exception	{
		RowNum rowNum = new RowNum();
		rowNum.setStartRow(1);
		rowNum.setLastRow(10);
		List<NoticeDTO> ar = noticeDAO.selectList(rowNum);
		for(NoticeDTO noticeDTO : ar)	{
			System.out.println(noticeDTO.getNum());
			System.out.println(noticeDTO.getPart());
			System.out.println(noticeDTO.getTitle());
		}
		assertTrue(ar.size()>0);
	}
}
