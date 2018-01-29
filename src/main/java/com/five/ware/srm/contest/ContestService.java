package com.five.ware.srm.contest;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.five.ware.file.FileDTO;
import com.five.ware.util.ListData;
import com.five.ware.util.Pager;
import com.five.ware.util.RowNum;

@Service
public class ContestService {

	
	@Inject
	private ContestDAO contestDAO;
	
	public int contestInsert(ContestListDTO contestListDTO) throws Exception{
		int result = contestDAO.contestInsert(contestListDTO);
		
		return result;
	}
	
	public int contestFileInsert(FileDTO fileDTO) throws Exception{
		int result = contestDAO.contestFileInsert(fileDTO);
		
		return result;
	}
	
	public List<ContestListDTO> contestList(ListData listData, Model model, String store) throws Exception{
		RowNum rowNum = listData.makeRow();
		
		int totalcount = contestDAO.contestListCount();
		System.out.println(totalcount);
		
		Pager pager = listData.makePage(totalcount);		
		
		List<ContestListDTO> ar = contestDAO.contestList(rowNum);
		List<Integer> counts = new ArrayList<Integer>();
		Calendar ca = Calendar.getInstance();
		
		List<String> size = new ArrayList<String>();
		List<Integer> results=new ArrayList<Integer>();
		
		for(ContestListDTO contestListDTO : ar ){
			int count = contestDAO.likeSelectJoinCount(contestListDTO, store);
			System.out.println("count"+count);
			counts.add(count);
			//Date
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date d= df.parse(contestListDTO.getEdate());
			long e = d.getTime();
			long c = ca.getTimeInMillis();
			
			
			if(c<= e){
				size.add("big");
			}else {
				size.add("small");
			}
			
			int result = contestDAO.maxCnum(contestListDTO.getCode());
			results.add(result);
			 
		}
		
		
		model.addAttribute("results", results);
		model.addAttribute("size", size);
		model.addAttribute("list", ar);
		model.addAttribute("count", counts);
		model.addAttribute("pager", pager);
		
		return ar;
	}

	
	public List<FileDTO> fileList() throws Exception{
		List<FileDTO> ar = contestDAO.fileList();
		
		return ar;
	}
	
	public int contestJoinInsert(ContestJoinDTO contestJoinDTO) throws Exception{
		int result = contestDAO.contestJoinInsert(contestJoinDTO);
		
		return result;
	}
	
	public List<List<ContestJoinDTO>> contestJoinList(int[] subcurPage, List<ContestListDTO> ar, Model model,String store) throws Exception{
		
		
		List<List<ContestJoinDTO>> joins = new ArrayList<List<ContestJoinDTO>>();
		List<Pager> pagers= new ArrayList<Pager>();
		
		List<List<ContestLikeDTO>> blikes=new ArrayList<List<ContestLikeDTO>>();
		List<List<Integer>> bnums=new ArrayList<List<Integer>>();
		List<ContestJoinDTO> ar2 = new ArrayList<ContestJoinDTO>();
		
		for(int i=0; i<ar.size(); i++){
			ListData listData = new ListData(3);
			
			listData.setCurPage(subcurPage[i]);
			
			RowNum rowNum = listData.makeRow();
			int totalCount = contestDAO.contestJoinListTotal(ar.get(i).getCode());
			
			Pager pager = listData.makePage(totalCount);
			
			 ar2= contestDAO.contestJoinList(rowNum, ar.get(i).getCode());
			
			joins.add(ar2);
			
			pagers.add(pager);
		} /// for문 끝

		List<ContestLikeDTO> likes=null;
		List<Integer> nums=null;
		
	for(int o=0; o<ar.size(); o++){
		ContestLikeDTO contestLikeDTO =null;
		likes=new ArrayList<ContestLikeDTO>();
		nums=new ArrayList<Integer>();		
		
		for(int z=0; z<joins.get(o).size(); z++){
			System.out.println("---------------------"+z);
			System.out.println("ar2code"+joins.get(o).get(z).getCode());
			contestLikeDTO = contestDAO.likeSelectOne(joins.get(o).get(z).getCode() ,joins.get(o).get(z).getCnum(),store );
			int num = contestDAO.likeCount(joins.get(o).get(z).getCode() ,joins.get(o).get(z).getCnum());
			
			nums.add(num);
			likes.add(contestLikeDTO);
			System.out.println(likes);
			System.out.println(nums);
	}
		
		blikes.add(likes);
		bnums.add(nums);
		
		System.out.println(bnums);
	}

		model.addAttribute("num", bnums);
		model.addAttribute("result", blikes);
		model.addAttribute("joins", joins);
		model.addAttribute("pagers", pagers);
	
		return joins;
	}
	
	public int likeInsert(int cnum, String code, String store) throws Exception{
		int result =contestDAO.likeInsert(cnum, code, store);
		
		return result;
	}
	
	public int likeDelete(int cnum, String store) throws Exception{
		int result =contestDAO.likeDelete(cnum, store);
		
		return result;
	}
	
	public ContestLikeDTO likeSelectJoin(ContestLikeDTO contestLikeDTO) throws Exception{
		ContestLikeDTO contestLikeDTO2 = contestDAO.likeSelectJoin(contestLikeDTO);
		
		return contestLikeDTO2;
	}
	
	public ContestJoinDTO contestJoinView(String cnum) throws Exception{
		ContestJoinDTO contestJoinDTO = contestDAO.contestJoinView(cnum);
		
		return contestJoinDTO;
	}
	
	public ContestListDTO likeResultCode(String code) throws Exception{
		ContestListDTO contestListDTO = contestDAO.likeResultCode(code);
		
		return contestListDTO;
	}
}
