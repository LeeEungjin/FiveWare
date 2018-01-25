package com.five.ware.eung.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.five.ware.project.ProjectDTO;
import com.five.ware.project.ProjectService;

@Controller
@RequestMapping(value="GroupWare/wbs/**")
public class ProjectController {
	
	private Logger logger = LoggerFactory.getLogger(ProjectController.class);
	
	@Autowired
	private ProjectService projectService;
	
	// ������Ʈ ��� �̵�
	@RequestMapping(value="/projectList")
	public String projectList(Model model) {
		logger.info("projectList");

		List<ProjectDTO> prjLists = projectService.selectProject();
		model.addAttribute("prjLists", prjLists);
		return "GroupWare/wbs/projectList";
	}
	
	// ������Ʈ ���� ó��
	@RequestMapping(value="/insertProject", method=RequestMethod.POST)
	public String insertProject(ProjectDTO prjDto) {
		logger.info("insertProject " + prjDto);
		
		projectService.insertProject(prjDto);
		return "redirect:./projectList";
	}
	
	// ������Ʈ ���� ó��
	@RequestMapping(value="/updateDelProject", method=RequestMethod.POST)
	public String updateDelProject(HttpServletRequest request) {
		logger.info("updateDelProject");
		
		String[] chkVal = request.getParameterValues("chkVal");
		projectService.updateDelProject(chkVal);
		return "redirect:./projectList";
	}
	
	// ������Ʈ���� �� �̵�
	@RequestMapping(value="/projectSchedule", method=RequestMethod.POST)
	public String projectSchdule(Model model, String prj_no) {
		logger.info("projectSchdule " + prj_no);
		
		List<ProjectDTO> prjLists = projectService.selectProject();
		model.addAttribute("prjLists", prjLists);
		ProjectDTO prjDto = projectService.selectOneProject(Integer.parseInt(prj_no));
		model.addAttribute("prjDto", prjDto);
		
		return "GroupWare/wbs/projectSchedule";
	}
	
}
