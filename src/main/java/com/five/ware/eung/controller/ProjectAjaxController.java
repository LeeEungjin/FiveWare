package com.five.ware.eung.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.five.ware.util.TermAnalsis;
import com.five.ware.project.ProjectDTO;
import com.five.ware.project.ProjectScheduleDTO;
import com.five.ware.project.ProjectService;

@RestController
@RequestMapping(value="GroupWare/wbs/**")
public class ProjectAjaxController {

	private Logger logger = LoggerFactory.getLogger(ProjectAjaxController.class);

	@Autowired
	private ProjectService projectService;
	
	//
	@RequestMapping(value = "/selectListProjectSchdule", method = RequestMethod.POST)
	public List<ProjectScheduleDTO> selectListProjectSchdule(String prj_no) {
		logger.info("selectListProjectSchdule : " + prj_no);
		
		List<ProjectScheduleDTO> prjsLists = projectService.selectListProjectSchdule(Integer.parseInt(prj_no));
		return prjsLists;
	}
	
	//
	@RequestMapping(value = "/insertProjectSchdule", method = RequestMethod.POST)
	public Map<String, Boolean> insertProjectSchdule(HttpServletRequest req, ProjectDTO prjDto) {
		logger.info("insertProjectSchdule : " + prjDto);
		
		boolean isc = projectService.updateProject(prjDto);
		String[] prjs_termsBig = req.getParameterValues("inPrjs_term");
		if(prjs_termsBig != null) {
			String[] prjs_terms = new TermAnalsis(prjDto, prjs_termsBig).getTermsFormat();
			List<ProjectScheduleDTO> lists = new ArrayList<ProjectScheduleDTO>();
			for (int i = 0; i < prjs_terms.length; i++) {
				ProjectScheduleDTO prjsDto = new ProjectScheduleDTO(prjDto.getPrj_no(),
																	req.getParameterValues("inPrjs_item")[i],
																	req.getParameterValues("inPrjs_name")[i],
																	Integer.parseInt(req.getParameterValues("inPrjs_refer")[i]),
																	Integer.parseInt(req.getParameterValues("inPrjs_step")[i]),
																	Integer.parseInt(req.getParameterValues("inPrjs_depth")[i]),
																	prjs_terms[i]);
				lists.add(prjsDto);
			}
			isc = projectService.insertProjectSchdule(lists);
		}else {
			isc = projectService.deleteProjectSchdule(prjDto.getPrj_no());
		}
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("isc", isc);
		return map;
	}
	
}
