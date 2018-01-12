package com.five.ware.srm.staff;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.util.ListData;
import com.five.ware.util.Pager;
import com.five.ware.util.RowNum;

@Service
public class StaffService {

 @Inject
 private StaffDAO staffDAO;
 
 		
 		//delete
 		public int delete(String num)throws Exception{
 			int result=staffDAO.delete(num);
 			
 			return result;
 		}
 
 		//update
 		public int update(StaffDTO staffDTO)throws Exception{
 			int result=staffDAO.update(staffDTO);
 			
 			return result;
 		}
 
		 //selectOne
		 public StaffDTO selectOne(String num)throws Exception{
			 StaffDTO staffDTO=staffDAO.selectOne(num);
			 
			 return staffDTO;
		 }
		 
		 //insert
		 public int insert(StaffDTO staffDTO) throws Exception{
			 int result=staffDAO.insert(staffDTO);
			 
			 return result;
		 }
		
		 //list
		 public ModelAndView selectList(ListData listData) throws Exception{
			 RowNum rowNum=listData.makeRow();
			 int totalCount=staffDAO.totalCount(rowNum);
			 List<StaffDTO> ar=new ArrayList<StaffDTO>();
			 ar=staffDAO.selectList(rowNum, listData);
			 Pager pager=listData.makePage(totalCount);
			 ModelAndView mv=new ModelAndView();
			 
			 mv.addObject("list", ar);
			 mv.addObject("pager", pager);
			 
			 return mv;
		 }
}

