package com.five.ware.cloud;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.five.ware.erp.human.member.MemberDTO;

@Service
public class CloudService {

	@Inject
	private CloudDAO cloudDAO;
	
	public int insert(HttpSession session, String path) throws Exception {
		String code = ((MemberDTO)session.getAttribute("member")).getCode();
		String folderpath = session.getServletContext().getRealPath(path);
		String foldername = folderpath.substring(folderpath.lastIndexOf(File.separator)+1);
		String uppername = "";
		
		String temp = path.substring(0, path.lastIndexOf("/"));
		if(!temp.substring(temp.lastIndexOf("/")+1).equals(code)) {
			uppername = temp.substring(temp.lastIndexOf("/")+1);
		}
		
		CloudDTO cloudDTO = new CloudDTO();
		cloudDTO.setCode(code);
		cloudDTO.setFoldername(foldername);
		cloudDTO.setFolderpath(folderpath);
		cloudDTO.setUppername(uppername);
		
		return cloudDAO.insert(cloudDTO);
	}
	
	public List<CloudDTO> selectList(String code, String uppername) throws Exception {
		if(uppername.equals(code)) {
			uppername = "";
		}
		
		return cloudDAO.selectList(code, uppername);
	}
}
