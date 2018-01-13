package com.five.ware.community;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.util.FileSaver;
import com.five.ware.util.ListData;

@Transactional
@Service
public class CommunityService {
	
	@Autowired
	private CommunityDAO communityDAO;
	@Autowired
	private FileSaver fileSaver;
	@Autowired
	private UploadDAO uploadDAO;
	@Autowired
	private BladkListDAO bladkListDAO;
	
	public ModelAndView selectList(ListData listData)throws Exception{
		ModelAndView mv=new ModelAndView();
		int totalCount=communityDAO.totalCount(listData.makeRow());
		
		mv.addObject("pager", listData.makePage(totalCount));
		mv.addObject("comList", communityDAO.selectList(listData.makeRow()));
		mv.setViewName("community/communityList");
		
		return mv;
	}
	
	public CommunityDTO selectOne(int num)throws Exception{
		ModelAndView mv=new ModelAndView();
		
		communityDAO.hitUpdate(num);
		CommunityDTO communityDTO=communityDAO.selectOne(num);
		communityDTO.setFileNames(uploadDAO.selectList(num));
		
		
		return communityDTO;
	}
	
	public int reportCount(int num)throws Exception{
		int report=bladkListDAO.reportCount(num);
		
		return report;
	}
	
	public int insert(CommunityDTO communityDTO, BlackListDTO blackListDTO, HttpSession session)throws Exception{
		MultipartFile [] files=communityDTO.getFiles();
		
		int result=communityDAO.insert(communityDTO);

		blackListDTO=new BlackListDTO();
		
		blackListDTO.setNum(communityDTO.getNum());
		blackListDTO.setWriter(communityDTO.getWriter());
		blackListDTO.setReport(0);
		blackListDTO.setNames("");
					
				
		result=bladkListDAO.insert(blackListDTO);
			
		if(files!=null){
			for(MultipartFile multipartFile :files){
				if(multipartFile.getOriginalFilename()==""){
					continue;
				}else{
					String name=fileSaver.fileSave(multipartFile, session, "upload");
					
					UploadDTO uploadDTO=new UploadDTO();
					uploadDTO.setNum(communityDTO.getNum());
					uploadDTO.setFileName(name);
					uploadDTO.setOriName(multipartFile.getOriginalFilename());
					
					uploadDAO.insert(uploadDTO);
				}
			}
		}
		
		return result;
	}
	
	public int update(CommunityDTO communityDTO, HttpSession session)throws Exception{
		MultipartFile [] files=communityDTO.getFiles();
		
		int result=communityDAO.insert(communityDTO);
		
		if(files!=null){
			for(MultipartFile multipartFile :files){
				if(multipartFile.getOriginalFilename()==""){
					continue;
				}else{
					String name=fileSaver.fileSave(multipartFile, session, "upload");
					
					UploadDTO uploadDTO=new UploadDTO();
					uploadDTO.setNum(communityDTO.getNum());
					uploadDTO.setFileName(name);
					uploadDTO.setOriName(multipartFile.getOriginalFilename());
					
					uploadDAO.insert(uploadDTO);
				}
			}
		}
		
		return result;
	}
	
	public int delete(int num)throws Exception{
		int result=communityDAO.delete(num);
			result=communityDAO.fileDelete(num);
			
		return result;
	}
	
	public int fileDelete(int fnum)throws Exception{
		int result=uploadDAO.delete(fnum);
		
		return result;
	}
	
}
