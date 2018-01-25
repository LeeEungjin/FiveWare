package com.five.ware.srm.contest;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.five.ware.file.FileDTO;

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
	
	public List<ContestListDTO> contestList() throws Exception{
		List<ContestListDTO> ar = contestDAO.contestList();
		
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
}
