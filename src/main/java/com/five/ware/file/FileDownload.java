package com.five.ware.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class FileDownload extends AbstractView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		File file = (File)model.get("down");
		response.setCharacterEncoding("UTF-8");
		response.setContentLength((int)file.length());
		
		String fileName = (String)model.get("oriName");
		fileName = URLEncoder.encode(fileName, "UTF-8");
		
		response.setHeader("Content-Disposition", "attatchment;fileName=\""+fileName+"\"");
		
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		OutputStream out = response.getOutputStream();
		
		FileInputStream fi = null;
		
		fi = new FileInputStream(file);
		
		FileCopyUtils.copy(fi, out);
		
		fi.close();
		out.close();
		
	}
}
