package com.five.ware.event;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.five.ware.community.NumFileDTO;
import com.five.ware.community.UploadDAO;
import com.five.ware.community.UploadDTO;
import com.five.ware.mater.MaterDTO;
import com.five.ware.util.FileSaver;
import com.five.ware.util.ListData;

@Transactional
@Service
public class EventService {
	
	@Inject
	private EventDAO eventDAO;
	
	@Inject
	private UploadDAO uploadDAO;
	
	@Autowired
	private FileSaver fileSaver;
	
	public List<EventDTO> eventDateList(ListData listData, String sdate, String edate)throws Exception{
		List<EventDTO> ar=eventDAO.eventDateList(sdate, edate);
		
		return ar;
	}
	
	//srm
	public ModelAndView selectList(int perPage, int curPage, ListData listData)throws Exception{
		
		listData=new ListData(perPage);
		listData.setCurPage(curPage);
		
		List<Object> map=new ArrayList<Object>();
		int totalCount=eventDAO.totalCount(listData.makeRow());
		ModelAndView mv=new ModelAndView();
		List<EventDTO> eventList=eventDAO.selectList(listData.makeRow());
		List<NumFileDTO> ar=new ArrayList<NumFileDTO>();
		
		
		
		for(int i=0; i<eventList.size(); i++){
			System.out.println("num : "+eventList.get(i).getEventNum());
			ar.add(eventDAO.fileOne(eventList.get(i).getEventNum()));
			System.out.println("fileName : "+ar.get(i).getFilename());
			
		}
		
		mv.addObject("eventImg", ar);
		mv.addObject("pager", listData.makePage(totalCount));
		mv.addObject("eventList", eventList);
		mv.setViewName("srm/event/eventList");
		
		return mv;
	}
	
	//erp
	public ModelAndView eventList(ListData listData)throws Exception{
		ModelAndView mv=new ModelAndView();
		List<EventDTO> eventList=eventDAO.selectList(listData.makeRow());
		int totalCount=eventDAO.totalCount(listData.makeRow());
		
		mv.addObject("pager", listData.makePage(totalCount));
		mv.addObject("eventList", eventList);
		mv.setViewName("erp/event/eventRegist");
		
		return mv;
	}
	
	public int update(EventDTO eventDTO, HttpSession session)throws Exception{
		MultipartFile [] files=eventDTO.getFiles();
		int result=0;
		
		result=eventDAO.update(eventDTO);
		
		if(files!=null){
			for(MultipartFile multipartFile :files){
				if(multipartFile.getOriginalFilename()==""){
					continue;
				}else{
					result=uploadDAO.deleteNum(eventDTO.getEventNum());
					
					System.out.println("delete result : "+result);
					
					String name=fileSaver.fileSave(multipartFile, session, "upload");
					
					UploadDTO uploadDTO=new UploadDTO();
					uploadDTO.setNum(eventDTO.getEventNum());
					uploadDTO.setFileName(name);
					uploadDTO.setOriName(multipartFile.getOriginalFilename());
					
					result=uploadDAO.insert(uploadDTO);
					
				} 
			}
		}
		return result;
	}
	
	
	public int insert(EventDTO eventDTO, HttpSession session)throws Exception{
		MultipartFile [] files=eventDTO.getFiles();
		int result=0;
		
		//eventDTO.setEventOption(eventDTO.getEventOption().replaceAll("\n\r", "<br>"));
		
		result=eventDAO.insert(eventDTO);
		
		int num=eventDAO.getNum()-1;
		
		
		
		if(files!=null){
			for(MultipartFile multipartFile :files){
				if(multipartFile.getOriginalFilename()==""){
					continue;
				}else{
					String name=fileSaver.fileSave(multipartFile, session, "upload");
					
					UploadDTO uploadDTO=new UploadDTO();
					uploadDTO.setNum(num);
					uploadDTO.setFileName(name);
					uploadDTO.setOriName(multipartFile.getOriginalFilename());
					
					System.out.println(uploadDTO.getNum());
					
					result=uploadDAO.insert(uploadDTO);
					
				} 
			}
		}
		
		return result;
	}
	
	public Map<String, Object> selectOne(int eventNum)throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		EventDTO eventDTO=eventDAO.selectOne(eventNum);
		NumFileDTO numFileDTO=eventDAO.fileOne(eventNum);
		
		map.put("event", eventDTO);
		map.put("file", numFileDTO);
		
		return map;
	}
	
	public int delete(int eventNum)throws Exception{
		int result=eventDAO.delete(eventNum);
		
		result=uploadDAO.deleteNum(eventNum);
		
		return result;
	}
	
	public ModelAndView eventListS() throws Exception{		
		List<EventDTO> ar = eventDAO.eventListS();
		
		ModelAndView mv = new ModelAndView();
		
		JSONArray json = new JSONArray();
		
		for(EventDTO eventDTO : ar){
			JSONObject obj = new JSONObject();

			obj.put("title", eventDTO.getEventName());
			obj.put("start", eventDTO.getEventSdate());
			obj.put("end", eventDTO.getEventEdate());
			
			json.add(obj);
		}
		System.out.println(json);
		
		mv.addObject("list1", json);
		
		return mv;
	}


}
