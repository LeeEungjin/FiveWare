package com.five.ware.erp.human.dili;

import java.lang.reflect.Member;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.erp.human.member.MemberDTO;

@Service
public class MemberWorkService {

	@Inject
	MemberWorkDAO memberWorkDAO;
	
	public List<String> diliNameList() throws Exception{
		List<String> ar = memberWorkDAO.diliNameList();
		
		return ar;
	}
	
	public List<MemberDTO> memList() throws Exception{
		List<MemberDTO> ar = memberWorkDAO.memList();
		
		return ar;
	}
	
	public List<String> tempList() throws Exception{
		List<String> ar=  memberWorkDAO.tempList();
		
		return ar;
	}
	
	public int memdiliInsert(MemberWorkDTO memberWorkDTO) throws Exception{
		int result = memberWorkDAO.memdiliInsert(memberWorkDTO);
		
		return result;
	}
	
	public String workCodeSearch(String workname) throws Exception{
		String workcode = memberWorkDAO.workCodeSearch(workname);
		
		return workcode;
	}
	
	public List<MemberWorkDTO> memberWorkList(String search, String startdate, String enddate) throws Exception{
		List<MemberWorkDTO> ar = memberWorkDAO.memberWorkList(search, startdate, enddate);
		
		return ar;
	}
	
	public MemberWorkDTO mworkOne(int num) throws Exception{
		MemberWorkDTO memberWorkDTO = memberWorkDAO.mworkOne(num);
		
		return memberWorkDTO;
	}
	
	public int mworkUpdate(MemberWorkDTO memberWorkDTO) throws Exception{
		int result = memberWorkDAO.mworkUpdate(memberWorkDTO);
		
		return result;
	}
	
	public int mworkDelete(int num) throws Exception{
		int result = memberWorkDAO.mworkDelete(num);
		
		return result;
	}
	
	public void mWorkList(String search, ModelAndView mv ) throws Exception{
		List<MemberWorkDTO> ar = memberWorkDAO.mWorkList(search);// 사원
		List<String> ar2 = memberWorkDAO.diliNameList(); // 근태목록
		List<Integer> sumList = null;
		List<List<Integer>> result = new ArrayList<List<Integer>>();
		
		for(MemberWorkDTO member : ar){
			sumList=new ArrayList<Integer>();
			for(String dili : ar2){
				int sum = memberWorkDAO.mSumList(member.getCode(), dili);
				
				sumList.add(sum);
			}
			
			result.add(sumList);
		}
		
		mv.addObject("memberList", ar);
		mv.addObject("sumList", result);
		mv.addObject("diliList", ar2);
	}
}
