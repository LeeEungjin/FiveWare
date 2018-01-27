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
	
	public List<List<ContestJoinDTO>> contestJoinList(int[] subcurPage, List<ContestListDTO> ar, Model model,String store) throws Exception{
		
		
		List<List<ContestJoinDTO>> joins = new ArrayList<List<ContestJoinDTO>>();
		List<Pager> pagers= new ArrayList<Pager>();
		
		List<List<ContestLikeDTO>> blikes=new ArrayList<List<ContestLikeDTO>>();
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
	/*	ContestLikeDTO contestLikeDTO = contestDAO.likeSelectOne(ar2.get(z).getCode() ,ar2.get(z).getCnum(),store );*/
	/*		for(int o=0; o<joins.size(); o++){
		ContestLikeDTO contestLikeDTO =null;
		for(int z=0; z<ar2.size(); z++){
			System.out.println("ar2code"+ar2.get(z).getCode());
			contestLikeDTO = contestDAO.likeSelectOne(ar2.get(z).getCode() ,ar2.get(z).getCnum(),store );
			
		}
		likes.add(contestLikeDTO);
		
	}
		
		blikes.add(likes);*/
		
		/*for(int j=0; j<ar2.size(); j++){
			System.out.println("joinList"+ ar2.get(j).getCode());
			System.out.println("joinList"+ ar2.get(j).getCnum());
			
		}
		System.out.println(joins);*/
		
	/*	for(ContestJoinDTO joinList : ar2){
			ContestLikeDTO contestLikeDTO = contestDAO.likeSelectOne(joinList.getCode() , joinList.getCnum(),store );
			
			likes.add(contestLikeDTO);
		}*/
		
	/*	for(List<ContestJoinDTO> join : joins){
			for(int i=0; i<ar2.size(); i++){
				ContestJoinDTO jDTO = new ContestJoinDTO();
				
				if(jDTO.getCode()==ar2.get(i).getCode()){
					ContestLikeDTO contestLikeDTO = contestDAO.likeSelectOne(jDTO.getCode() , jDTO.getCnum(),store );
					
					likes.add(contestLikeDTO);
					
				}
				
				System.out.println("joinSize"+join.size());
			}
			blikes.add(likes);
		}
		
		
		*/
		List<ContestLikeDTO> likes=null;
	for(int o=0; o<ar.size(); o++){
		ContestLikeDTO contestLikeDTO =null;
		likes=new ArrayList<ContestLikeDTO>();
		
		for(int z=0; z<joins.get(o).size(); z++){
			System.out.println("---------------------"+z);
			System.out.println("ar2code"+joins.get(o).get(z).getCode());
			contestLikeDTO = contestDAO.likeSelectOne(joins.get(o).get(z).getCode() ,joins.get(o).get(z).getCnum(),store );
			
			likes.add(contestLikeDTO);
			System.out.println(likes);
	}
		
		blikes.add(likes);
	}

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
	
/*	public ContestLikeDTO likeSelectOne(List<ContestJoinDTO> joins, String store) throws Exception{
		ContestLikeDTO contestLikeDTO2 =null;
		
		for(int i=0; i<joins.size(); i++){
			 contestLikeDTO2 = contestDAO.likeSelectOne(joins.get(i).getCode() , joins.get(i).getCnum(), store);
		}
		
		return contestLikeDTO2;
	}*/
	
	public ContestLikeDTO likeSelectJoin(ContestLikeDTO contestLikeDTO) throws Exception{
		ContestLikeDTO contestLikeDTO2 = contestDAO.likeSelectJoin(contestLikeDTO);
		
		return contestLikeDTO2;
	}
	
	public ContestJoinDTO contestJoinView(String cnum) throws Exception{
		ContestJoinDTO contestJoinDTO = contestDAO.contestJoinView(cnum);
		
		return contestJoinDTO;
	}
}
