package com.five.ware.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.five.ware.project.ProjectDTO;
import com.five.ware.project.ProjectScheduleDTO;

@Service
public class ProjectService {
	@Autowired
	private ProjectDAO dao;
	
	// ������Ʈ ����
	public boolean insertProject(ProjectDTO prjDto) {
		return dao.insertProject(prjDto)==1 ? true : false;
	}
	
	// ������Ʈ���� ����
	@Transactional(readOnly=true)
	public boolean insertProjectSchdule(List<ProjectScheduleDTO> lists) {
		boolean check = false;
		dao.deleteProjectSchedule(lists.get(0).getPrj_no());
		for (ProjectScheduleDTO prjsDto : lists) {
			check = dao.insertProjectSchedule(prjsDto)==1 ? true : false;
		}
		return check;
	}
	
	// ������Ʈ ��ü��ȸ Ŭ�����ڵ�
	public List<ProjectDTO> selectProject() {
		return dao.selectProject();
	}
	
	// ������Ʈ���� ��ü��ȸ
	public List<ProjectScheduleDTO> selectListProjectSchdule(int prj_no) {
		return dao.selectListProjectSchedule(prj_no);
	}
	
	// ������Ʈ ����ȸ
	public ProjectDTO selectOneProject(int prj_no) {
		return dao.selectOneProject(prj_no);
	}
	
	// ������Ʈ delflag
	@Transactional(readOnly=true)
	public boolean updateDelProject(String[] chkVal) {
		boolean check = false;
		for (String prj_no : chkVal) {
			check = dao.updateDelProject(Integer.parseInt(prj_no))!=0 ? true : false;
		}
		return check;
	}
	
	// ������Ʈ���� ����
	public boolean deleteProjectSchdule(int prj_no) {
		return dao.deleteProjectSchedule(prj_no) >=0 ? true : false;
	}
	
	// ������Ʈ ����
	public boolean updateProject(ProjectDTO prjDto) {
		return dao.updateProject(prjDto)!=0 ? true : false;
	}
}
