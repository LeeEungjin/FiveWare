package com.five.ware.project;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.five.ware.project.ProjectDTO;
import com.five.ware.project.ProjectScheduleDTO;

@Repository
public class ProjectDAO {

	private Logger logger = LoggerFactory.getLogger(ProjectDAO.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static String NAMESPACE = "projectMapper.";
	
	// 프로젝트 생성
	public int insertProject(ProjectDTO prjDto) {
		logger.info("insertProject : " + prjDto);
		return sqlSession.insert(NAMESPACE+"insertProject", prjDto);
	}
	
	// 프로젝트일정 생성
	public int insertProjectSchedule(ProjectScheduleDTO prjsDto) {
		logger.info("insertProjectSchdule : " + prjsDto);
		return sqlSession.insert(NAMESPACE+"insertProjectSchdule", prjsDto);
	}
	
	// 프로젝트 전체조회 클래스코드
	public List<ProjectDTO> selectProject() {
		logger.info("selectProject");
		return sqlSession.selectList(NAMESPACE+"selectProject");
	}
	
	// 프로젝트일정 전체조회
	public List<ProjectScheduleDTO> selectListProjectSchedule(int prj_no) {
		logger.info("selectListProjectSchdule : " + prj_no);
		return sqlSession.selectList(NAMESPACE+"selectListProjectSchdule", prj_no);
	}
	
	// 프로젝트 상세조회
	public ProjectDTO selectOneProject(int prj_no) {
		logger.info("selectOneProject : " + prj_no);
		return sqlSession.selectOne(NAMESPACE+"selectOneProject", prj_no);
	}
	
	// 프로젝트 delflag
	public int updateDelProject(int prj_no) {
		logger.info("updateDelProject : " + prj_no);
		return sqlSession.update(NAMESPACE+"updateDelProject", prj_no);
	}
	
	// 프로젝트일정 삭제
	public int deleteProjectSchedule(int prj_no) {
		logger.info("deleteProjectSchdule : " + prj_no);
		return sqlSession.delete(NAMESPACE+"deleteProjectSchdule", prj_no);
	}

	// 프로젝트 수정
	public int updateProject(ProjectDTO prjDto) {
		logger.info("updateProject : " + prjDto);
		return sqlSession.update(NAMESPACE+"updateProject", prjDto);
	}
}
