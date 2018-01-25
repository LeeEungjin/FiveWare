package com.five.ware.srm.contest;

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
	
	public List<ContestListDTO> contestList(ListData listData, Model model) throws Exception{
		RowNum rowNum = listData.makeRow();
		
		int totalcount = contestDAO.contestListCount();
		System.out.println(totalcount);
		
		Pager pager = listData.makePage(totalcount);		
		
		List<ContestListDTO> ar = contestDAO.contestList(rowNum);
		
		model.addAttribute("list", ar);
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
	
	public List<ContestJoinDTO> contestJoinList() throws Exception{
		List<ContestJoinDTO> ar= contestDAO.contestJoinList();
		
		return ar;
	}
	
	public int likeInsert(int cnum, String code, String store) throws Exception{
		int result =contestDAO.likeInsert(cnum, code, store);
		
		return result;
	}
	
	public int likeDelete(int cnum) throws Exception{
		int result =contestDAO.likeDelete(cnum);
		
		return result;
	}
	
	public ContestLikeDTO likeSelectOne(ContestLikeDTO contestLikeDTO) throws Exception{
		ContestLikeDTO contestLikeDTO2 = contestDAO.likeSelectOne(contestLikeDTO);
		
		return contestLikeDTO2;
	}
}
