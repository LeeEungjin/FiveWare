package com.five.ware.erp.human.basis;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class PositionService {
	
	@Inject
	PositionDAO positionDAO;
	
	public int positionPlus(PositionDTO positionDTO) throws Exception{
		int result = positionDAO.positionPlus(positionDTO);
		
		return result;
	}
	
	public List<PositionDTO> positionList() throws Exception{
		List<PositionDTO> ar = positionDAO.positionList();
		
		return ar;
	}
	
	public PositionDTO positionOne(String code) throws Exception{
		PositionDTO positionOne = positionDAO.positionUpdateForm(code);
		
		return positionOne;
	}
	
	public int positionUpdate(PositionDTO positionDTO)throws Exception{
		int result = positionDAO.positionUpdate(positionDTO);
		
		return result;
	}
	
	public int positionDelete(String code) throws Exception{
		System.out.println("들어오니 여기는 서비스");
		int result = positionDAO.positionDelete(code);
		
		return result;
	}

}
