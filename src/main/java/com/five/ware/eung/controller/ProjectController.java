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
	
	// 프로젝트 목록 이동
	@RequestMapping(value="/projectList")
	public String projectList(Model model) {
		logger.info("projectList");

		List<ProjectDTO> prjLists = projectService.selectProject();
		model.addAttribute("prjLists", prjLists);
		return "GroupWare/wbs/projectList";
	}
	
	// 프로젝트 생성 처리
	@RequestMapping(value="/insertProject.do", method=RequestMethod.POST)
	public String insertProject(ProjectDTO prjDto) {
		logger.info("insertProject " + prjDto);
		
		projectService.insertProject(prjDto);
		return "redirect:/projectList.do";
	}
	
	// 프로젝트 삭제 처리
	@RequestMapping(value="/updateDelProject.do", method=RequestMethod.POST)
	public String updateDelProject(HttpServletRequest request) {
		logger.info("updateDelProject");
		
		String[] chkVal = request.getParameterValues("chkVal");
		projectService.updateDelProject(chkVal);
		return "redirect:/projectList.do";
	}
	
	// 프로젝트일정 상세 이동
	@RequestMapping(value="/projectSchedule.do", method=RequestMethod.POST)
	public String projectSchdule(Model model, String prj_no) {
		logger.info("projectSchdule " + prj_no);
		
		ProjectDTO prjDto = projectService.selectOneProject(Integer.parseInt(prj_no));
		model.addAttribute("prjDto", prjDto);
		return "projectSchdule";
	}
	
}
