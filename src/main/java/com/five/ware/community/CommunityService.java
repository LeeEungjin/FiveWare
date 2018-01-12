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
	
	public ModelAndView selectList(ListData listData)throws Exception{
		ModelAndView mv=new ModelAndView();
		int totalCount=communityDAO.totalCounr(listData.makeRow());
		
		mv.addObject("pager", listData.makePage(totalCount));
		mv.addObject("list", communityDAO.selectList(listData.makeRow()));
		mv.setViewName("community/communityList");
		
		return mv;
	}
	
	public CommunityDTO selectOne(int num)throws Exception{
		communityDAO.hitUpdate(num);
		CommunityDTO communityDTO=communityDAO.selectOne(num);
		
		return communityDTO;
	}
	
	public int insert(CommunityDTO communityDTO, HttpSession session)throws Exception{
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
	
	public int update(CommunityDTO communityDTO)throws Exception{
		return communityDAO.update(communityDTO);
	}
	
	public int delete(int num)throws Exception{
		int result=communityDAO.delete(num);
			result=communityDAO.fileDelete(num);
			
		return result;
	}
	
}
