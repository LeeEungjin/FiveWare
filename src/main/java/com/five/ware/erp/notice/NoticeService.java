package com.five.ware.erp.notice;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.util.ListData;
import com.five.ware.util.Pager;
import com.five.ware.util.RowNum;

@Service
public class NoticeService {

	@Inject
	private NoticeDAO noticeDAO;
	
/*	public ModelAndView selectList(ListData listData) throws Exception	{
		RowNum rowNum = listData.makeRow();
		int totalCount = noticeDAO.totalCount(listData.makeRow());
		Pager pager = listData.makePage(totalCount);
		ModelAndView mv = new ModelAndView();
		mv.addObject("pager", pager);
		mv.addObject("list", noticeDAO.selectList(rowNum));
		mv.setViewName("notice/noticeList");
		
		return mv;
	}*/
	
	public NoticeDTO selectOne(int num) throws Exception	{
		noticeDAO.hitUpdate(num);
		NoticeDTO noticeDTO = noticeDAO.selectOne(num);
		
		return noticeDTO;
	}
	
/*	public int insert(NoticeDTO noticeDTO, HttpSession session) throws Exception	{
		
		List<FileDTO> names = new ArrayList<FileDTO>();
		int result = noticeDAO.insert(noticeDTO);
		
		return result;
	}*/
	
	public int update(NoticeDTO noticeDTO) throws Exception	{
		int result = noticeDAO.update(noticeDTO);
		return result;
	}
	
	public int delete(int num) throws Exception	{
		int result = noticeDAO.delete(num);
		return result;
	}
	
/*	public ModelAndView part(ListData listData, String part) throws Exception	{
		RowNum rowNum = listData.makeRow();
		int totalCount = noticeDAO.totalCount(rowNum);
		Pager pager = listData.makePage(totalCount);
		ModelAndView mv = new ModelAndView();
		mv.addObject("pager", pager);
		mv.addObject("list", noticeDAO.part(rowNum));
		mv.setViewName("notice/noticeAjax");
		
		return mv;
	}*/
}
