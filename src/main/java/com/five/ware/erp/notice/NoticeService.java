package com.five.ware.erp.notice;



import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.five.ware.file.FileDTO;
import com.five.ware.util.FileSaver;
import com.five.ware.util.ListData;
import com.five.ware.util.Pager;
import com.five.ware.util.RowNum;

@Service
public class NoticeService {

	@Inject
	private NoticeDAO noticeDAO;
	@Inject
	private FileSaver fileSaver;
	@Inject
	private NoticeFileDAO noticeFileDAO;
	
	public ModelAndView selectList(ListData listData, String temp) throws Exception	{
		ModelAndView mv = new ModelAndView();
		int totalCount = noticeDAO.totalCount(listData.makeRow(), temp);
		
		mv.setViewName("notice/noticeList");
		mv.addObject("pager", listData.makePage(totalCount));
		mv.addObject("list", noticeDAO.selectList(listData.makeRow(), temp));
		
		return mv;
	}
	
	public NoticeDTO selectOne(int num) throws Exception	{
		noticeDAO.hitUpdate(num);
		NoticeDTO noticeDTO = noticeDAO.selectOne(num);
		
		return noticeDTO;
	}
	
	public int insert(NoticeDTO noticeDTO, HttpSession session) throws Exception	{
		
		List<NoticeFileDTO> names = new ArrayList<NoticeFileDTO>();
		MultipartFile [] files = noticeDTO.getFiles();
		
		int result = noticeDAO.insert(noticeDTO);
		
		if(files!=null){
			for(MultipartFile multipartFile : files)	{
				String name = fileSaver.fileSave(multipartFile, session, "upload");
				noticeDTO.setNum(noticeDTO.getNum());
				noticeDTO.setFileName(name);
				noticeDTO.setOriName(multipartFile.getOriginalFilename());
				result=noticeFileDAO.insert(noticeDTO);
			}
		}
		
		return result;
	}
	
	public int update(NoticeDTO noticeDTO) throws Exception	{
		int result = noticeDAO.update(noticeDTO);
		
		return result;
	}
	
	public int delete(int num) throws Exception	{
		int result = noticeDAO.delete(num);
		return result;
	}
	
	public int fileDelete(int fnum)throws Exception{
		int result=noticeFileDAO.delete(fnum);
		
		return result;
	}
	
	public ModelAndView part(ListData listData, String temp) throws Exception	{
		RowNum rowNum = listData.makeRow();
		int totalCount = noticeDAO.totalCount(rowNum, temp);
		Pager pager = listData.makePage(totalCount);
		ModelAndView mv = new ModelAndView();
		mv.addObject("pager", pager);
		mv.addObject("list", noticeDAO.part(rowNum, temp));
		mv.setViewName("notice/noticeList");
		return mv;
	}
}
