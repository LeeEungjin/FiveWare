package com.five.ware.community;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

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
	private BlackListDAO bladkListDAO;
	
	public ModelAndView selectList(ListData listData, String temp)throws Exception{
		ModelAndView mv=new ModelAndView();
		int totalCount=communityDAO.totalCount(listData.makeRow(), temp);
		List<CommunityDTO> comlist = communityDAO.selectList(listData.makeRow(), temp);
		List<Integer> reportList=new ArrayList<Integer>();
		
		for (CommunityDTO communityDTO : comlist) {
			reportList.add(bladkListDAO.reportCount(communityDTO.getNum()));
		}
		
		mv.addObject("pager", listData.makePage(totalCount));
		mv.addObject("comList", comlist);
		mv.addObject("reportList", reportList);
		mv.setViewName("community/communityList");
		
		return mv;
	}
	
	public List<CommunityDTO> randomNotice()throws Exception{
		//랜덤 값 r을 ar의 인덱스로 사용해서 numList의 num 값 뽑아오기
		//그 num값으로 selectOne 하기
		
		CommunityDTO communityDTO=new CommunityDTO();
		List<Integer> numList=new ArrayList<Integer>();
		List<CommunityDTO> randomList=new ArrayList<CommunityDTO>();
		int r=0;
		
		numList=communityDAO.numList();
		
		/*int[] ar = new int[numList.size()];
		
		r = (int)(Math.random()*numList.size())+1;
		
		
		for(int i=0; i<numList.size(); i++){
			ar[i]=numList.get(i);
			randomList.add(communityDTO);
		}
		
		int num=ar[r-1];
		
		for(int j=0; j<ar.length; j++){
			communityDTO=communityDAO.selectOne(num);
		}
		
		System.out.println(randomList.size());*/
		
		
		for(int i=0; i<numList.size(); i++){
			communityDTO=communityDAO.selectOne(numList.get(i));
			randomList.add(communityDTO);
		}
		
		
		return randomList;
	}
	
	public Map<String, Object> selectOne(int num)throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		int fileCount=communityDAO.fileCount(num);
		
		communityDAO.hitUpdate(num);
		CommunityDTO communityDTO=communityDAO.selectOne(num);
		communityDTO.setFileNames(uploadDAO.selectList(num));
		
		map.put("communityDTO", communityDTO);
		map.put("fileCount", fileCount);
		
		return map;
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
		blackListDTO.setNames(communityDTO.getWriter());
					
				
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
