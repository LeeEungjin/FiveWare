package com.five.ware.erp.notice;



import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	public ModelAndView selectList(ListData listData, String part) throws Exception	{
		ModelAndView mv = new ModelAndView();
		int totalCount = noticeDAO.totalCount(listData.makeRow(), part);
		
		mv.setViewName("notice/noticeList");
		mv.addObject("pager", listData.makePage(totalCount));
		mv.addObject("list", noticeDAO.selectList(listData.makeRow(), part));
		
		return mv;
	}
	
	public NoticeDTO selectOne(int num) throws Exception	{
		noticeDAO.hitUpdate(num);
		NoticeDTO noticeDTO = noticeDAO.selectOne(num);
		return noticeDTO;
	}
	
	public int insert(NoticeDTO noticeDTO, HttpSession session) throws Exception	{
		

		MultipartFile [] files = noticeDTO.getFiles();
		
		int result = noticeDAO.insert(noticeDTO);
		if(files != null)	{
		for(MultipartFile multipartFile : files)	{
			String name = fileSaver.fileSave(multipartFile, session, "upload");
			noticeDTO.setNum(noticeDTO.getNum());
			noticeDTO.setFileName(name);
			noticeDTO.setOriName(multipartFile.getOriginalFilename());
			noticeFileDAO.insert(noticeDTO);
		}
		}
		
		return result;
		}
	
	public int update(NoticeDTO noticeDTO, HttpSession session) throws Exception	{
		
		MultipartFile [] files = noticeDTO.getFiles();
		
		int result = noticeDAO.update(noticeDTO);
		
		for(MultipartFile multipartFile : files)	{
			String name = fileSaver.fileSave(multipartFile, session, "upload");
			noticeDTO.setNum(noticeDTO.getNum());
			noticeDTO.setFnum(noticeDTO.getFnum());
			noticeDTO.setFileName(name);
			noticeDTO.setOriName(multipartFile.getOriginalFilename());
			noticeFileDAO.insert(noticeDTO);
		}
		
		return result;
	}
	
	public int delete(int num) throws Exception	{
		int result = noticeDAO.delete(num);
		return result;
	}
	
	public int fileDelete(int fnum) throws Exception	{
		int result = noticeDAO.fileDelete(fnum);
		return result;
	}
	
	public int fileUpdate(NoticeFileDTO noticeFileDTO) throws Exception	{
		int result = noticeDAO.fileUpdate(noticeFileDTO);
		return result;
	}
}
