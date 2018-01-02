package com.five.ware.erp.notice;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class NoticeService {

	@Inject
	private NoticeDAO noticeDAO;
	
	public ModelAndView selectList(ListData listData) throws Exception	{
		RowNum rowNum = listData.makeRow();
		int totalCount = noticeDAO.totalCount(rowNum);
		Pager pager = listData.makePage(totalCount);
		ModelAndView mv = new ModelAndView();
		mv.addObject("pager", pager);
		mv.addObject("list", noticeDAO.selectList(rowNum));
		mv.setViewName("notice/noticeList");
		
		return mv;
	}
}
