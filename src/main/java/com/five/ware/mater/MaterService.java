package com.five.ware.mater;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class MaterService {
	
	@Inject
	private MaterDAO materDAO;
	
	public int insert(MaterDTO materDTO)throws Exception{
		int result=materDAO.insert(materDTO);
		
		return result;
	}
	
	public List<MaterDTO> materDateList(String materKind, String smaterDate, String ematerDate)throws Exception{
		List<MaterDTO> ar=materDAO.materDateList(materKind, smaterDate, ematerDate);
		
		return ar;
	}
	
	public List<MaterDTO> selectList(String materKind)throws Exception{
		List<MaterDTO> ar=materDAO.selectList(materKind);
		
		return ar;
	}
	
	public List<String> materStorageList()throws Exception{
		List<String> ar=materDAO.materStorageList();
		
		return ar;
	}
	
	public MaterDTO selectOne(String materCode)throws Exception{
		MaterDTO materDTO=materDAO.selectOne(materCode);
		
		return materDTO;
	}
	
	public int update(MaterDTO materDTO)throws Exception{
		int result=materDAO.update(materDTO);
		
		return result;
	}
	
	public int delete(String materCode)throws Exception{
		int result=materDAO.delete(materCode);
		
		return result;
	}

}
