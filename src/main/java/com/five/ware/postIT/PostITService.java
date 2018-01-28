package com.five.ware.postIT;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class PostITService {
	
	@Inject
	private PostITDAO postITDAO;
	
	public List<PostITDTO> postList(String store)throws Exception{
		List<PostITDTO> postList=new ArrayList<PostITDTO>();
		
		postList=postITDAO.postList(store);
		
		return postList;
	}
	
	public int postInsert(PostITDTO postITDTO)throws Exception{
		int result=0;
		
		result=postITDAO.postInsert(postITDTO);
		
		return result;
		
	}
	
	public PostITDTO postView(int num)throws Exception{
		PostITDTO postITDTO=new PostITDTO();
		
		postITDTO=postITDAO.postView(num);
		
		return postITDTO;
	}
	
	public int postDelete(int num)throws Exception{
		int result=0;
		
		result=postITDAO.postDelete(num);
		
		return result;
	}
	
}
