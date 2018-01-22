package com.five.ware.cloud;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class CloudFileService {

	@Inject
	private CloudFileDAO cloudFileDAO;
	
	public CloudFileDTO selectOne(String filename) throws Exception {
		return cloudFileDAO.selectOne(filename);
	}
	
	public int insert(CloudFileDTO cloudFileDTO) throws Exception {
		return cloudFileDAO.insert(cloudFileDTO);
	}
}
