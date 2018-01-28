package com.five.ware.cloud;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class CloudFileService {

	@Inject
	private CloudFileDAO cloudFileDAO;
	
	public List<CloudFileDTO> fileList (String code, String foldername) throws Exception {
		return cloudFileDAO.fileList(code, foldername);
	}
	
	public List<CloudFileDTO> selectList(String oriname) throws Exception {
		return cloudFileDAO.selectList(oriname);
	}
	
	public CloudFileDTO selectOne(String filename) throws Exception {
		return cloudFileDAO.selectOne(filename);
	}
	
	public int insert(CloudFileDTO cloudFileDTO) throws Exception {
		return cloudFileDAO.insert(cloudFileDTO);
	}
}
