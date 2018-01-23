package com.five.ware.srm.storeNotice;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.erp.accountRegist.AccountRegistDTO;
import com.five.ware.util.ListData;
import com.five.ware.util.Pager;
import com.five.ware.util.RowNum;

@Service
public class StoreNoticeService {

	@Inject
	private StoreNoticeDAO storeNoticeDAO;
	
	
	//update
	public int update(StoreNoticeDTO storeNoticeDTO){
		int result=0;
		try {
			result = storeNoticeDAO.update(storeNoticeDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	//delete
	public int delete(int num)throws Exception{
		int result=storeNoticeDAO.delete(num);
		return result;
	}
	
	
	//selectOne
	public StoreNoticeDTO selectOne(int num)throws Exception{
		storeNoticeDAO.hit(num);
		StoreNoticeDTO storeNoticeDTO=storeNoticeDAO.selectOne(num);
		return storeNoticeDTO;
	}
	
	//insert
	public int insert(StoreNoticeDTO storeNoticeDTO)throws Exception{
		
		if(storeNoticeDTO.getKind().equals("원글")){
			storeNoticeDTO.setNum(storeNoticeDAO.getNum());
		}
		
		int result=storeNoticeDAO.insert(storeNoticeDTO);
		
		return result;
	}
	
	//list
	public ModelAndView selectList(ListData listData)throws Exception{
		RowNum rowNum=listData.makeRow();
		int totalCount=storeNoticeDAO.totalCount(rowNum);
		List<StoreNoticeDTO> ar=new ArrayList<StoreNoticeDTO>();
		ar=storeNoticeDAO.selectList(rowNum, listData);
		Pager pager=listData.makePage(totalCount);
		ModelAndView mv=new ModelAndView();
		
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		
		return mv;
		
	}
	
	//답글
	public ModelAndView replyList(int num)throws Exception{
		

		List<StoreNoticeDTO> ar=new ArrayList<StoreNoticeDTO>();
		ar=storeNoticeDAO.replyList(num);
	
		ModelAndView mv=new ModelAndView();
		
		mv.addObject("list", ar);

		
		return mv;
		
	}
	
}
