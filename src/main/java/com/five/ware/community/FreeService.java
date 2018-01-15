package com.five.ware.community;

import java.util.List;

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
public class FreeService {
	
	
	@Autowired
	private FreeDAO freeDAO;
	@Autowired
	private FileSaver fileSaver;
	@Autowired
	private UploadDAO uploadDAO;
	
	public ModelAndView selectList(ListData listData, String target)throws Exception{
		ModelAndView mv=new ModelAndView();
		int totalCount=freeDAO.totalCount(listData.makeRow(), target);
		List<FreeDTO> freeList=freeDAO.selectList(listData.makeRow(), target);
		
		mv.addObject("pager", listData.makePage(totalCount));
		mv.addObject("freeList", freeList);
		mv.setViewName("free/freeList");
		
		return mv;
	}
	
	public FreeDTO selectOne(int num)throws Exception{
		freeDAO.hitUpdate(num);
		
		FreeDTO freeDTO=freeDAO.selectOne(num);
		freeDTO.setFileNames(uploadDAO.selectList(num));
		
		return freeDTO;
	}
	
	public int freeInsert(FreeDTO freeDTO, HttpSession session)throws Exception{
		MultipartFile [] files=freeDTO.getFiles();
		int result=freeDAO.freeInsert(freeDTO);
		
		if(files!=null){
			for(MultipartFile multipartFile :files){
				if(multipartFile.getOriginalFilename()==""){
					continue;
				}else{
					String name=fileSaver.fileSave(multipartFile, session, "upload");
					
					UploadDTO uploadDTO=new UploadDTO();
					uploadDTO.setNum(freeDTO.getNum());
					uploadDTO.setFileName(name);
					uploadDTO.setOriName(multipartFile.getOriginalFilename());
					
					uploadDAO.insert(uploadDTO);
				}
			}
		}
		
		return result;
	}
	
	public int freeReply(FreeDTO freeDTO, HttpSession session)throws Exception{
		MultipartFile [] files=freeDTO.getFiles();
		int result=freeDAO.stepUpdate(freeDTO);
			result=freeDAO.freeReply(freeDTO);
			
		if(files!=null){
			for(MultipartFile multipartFile :files){
				if(multipartFile.getOriginalFilename()==""){
					continue;
				}else{
					String name=fileSaver.fileSave(multipartFile, session, "upload");
					
					UploadDTO uploadDTO=new UploadDTO();
					uploadDTO.setNum(freeDTO.getNum());
					uploadDTO.setFileName(name);
					uploadDTO.setOriName(multipartFile.getOriginalFilename());
					
					uploadDAO.insert(uploadDTO);
				}
			}
		}
		
		return result;
	}
	
	public int update(FreeDTO freeDTO, HttpSession session)throws Exception{
		MultipartFile[] files=freeDTO.getFiles();
		
		int result=freeDAO.update(freeDTO);
		
		if(files!=null){
			for(MultipartFile multipartFile :files){
				if(multipartFile.getOriginalFilename()==""){
					continue;
				}else{
					String name=fileSaver.fileSave(multipartFile, session, "upload");
					
					UploadDTO uploadDTO=new UploadDTO();
					uploadDTO.setNum(freeDTO.getNum());
					uploadDTO.setFileName(name);
					uploadDTO.setOriName(multipartFile.getOriginalFilename());
					
					uploadDAO.insert(uploadDTO);
				}
			}
		}
		
		return result;
	}
	
	public int delete(int num)throws Exception{
		int result=freeDAO.delete(num);
			result=freeDAO.fileDelete(num);
			
		return result;
	}
	
	public int fileDelete(int fnum)throws Exception{
		int result=uploadDAO.delete(fnum);
		
		return result;
	}

}
