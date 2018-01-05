package com.five.ware;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.erp.notice.NoticeDTO;
import com.five.ware.erp.notice.NoticeFileDTO;
import com.five.ware.file.PhotoDTO;
import com.five.ware.file.PhotoService;


@Controller
@RequestMapping(value="/file/*")
public class FileController {
	
	@Inject
	private PhotoService photoService;
	
	@RequestMapping(value="photoUpload")
	public String photoUpload(PhotoDTO photoDTO, HttpSession session) throws Exception	{
		return photoService.photoUpload(photoDTO, session);
	}

	@RequestMapping(value="fileDown")
	public ModelAndView fileDown(NoticeDTO noticeDTO, HttpSession session) throws Exception	{
		String filePath = session.getServletContext().getRealPath("resources/upload");
		System.out.println("filePath : " +filePath);
		
		File file = new File(filePath, noticeDTO.getFileName());
		System.out.println("filename : "+noticeDTO.getFileName());
		ModelAndView mv = new ModelAndView();
		mv.addObject("down", file);
		mv.addObject("oriname", noticeDTO.getOriName());
		mv.setViewName("fileDown");
		
		return mv;
	}
	
}
