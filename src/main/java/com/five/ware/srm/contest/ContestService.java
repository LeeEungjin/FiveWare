package com.five.ware.srm.contest;

import java.util.ArrayList;
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
		
		for(ContestListDTO contestListDTO : ar ){
			int count = contestDAO.likeSelectJoinCount(contestListDTO, store);
			System.out.println("count"+count);
			counts.add(count);
		}
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
	
	public List<List<ContestJoinDTO>> contestJoinList(int[] subcurPage, List<ContestListDTO> ar, Model model) throws Exception{
		
		
		List<List<ContestJoinDTO>> joins = new ArrayList<List<ContestJoinDTO>>();
		List<Pager> pagers= new ArrayList<Pager>();
		
		for(int i=0; i<ar.size(); i++){
			ListData listData = new ListData(3);
			
			listData.setCurPage(subcurPage[i]);
			
			RowNum rowNum = listData.makeRow();
			int totalCount = contestDAO.contestJoinListTotal(ar.get(i).getCode());
			
			Pager pager = listData.makePage(totalCount);
			
			List<ContestJoinDTO> ar2= contestDAO.contestJoinList(rowNum, ar.get(i).getCode());
			
			joins.add(ar2);
			System.out.println("size  : "+ar2.size());
			pagers.add(pager);
		}
		
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
	
	public ContestLikeDTO likeSelectOne(String code, int cnum, String store) throws Exception{
		ContestLikeDTO contestLikeDTO2 = contestDAO.likeSelectOne(code, cnum, store);
		
		return contestLikeDTO2;
	}
	
	public ContestLikeDTO likeSelectJoin(ContestLikeDTO contestLikeDTO) throws Exception{
		ContestLikeDTO contestLikeDTO2 = contestDAO.likeSelectJoin(contestLikeDTO);
		
		return contestLikeDTO2;
	}
	
	public ContestJoinDTO contestJoinView(String cnum) throws Exception{
		ContestJoinDTO contestJoinDTO = contestDAO.contestJoinView(cnum);
		
		return contestJoinDTO;
	}
}
