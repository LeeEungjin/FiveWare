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
	
	// ������Ʈ ����
	public int insertProject(ProjectDTO prjDto) {
		logger.info("insertProject : " + prjDto);
		return sqlSession.insert(NAMESPACE+"insertProject", prjDto);
	}
	
	// ������Ʈ���� ����
	public int insertProjectSchedule(ProjectScheduleDTO prjsDto) {
		logger.info("insertProjectSchdule : " + prjsDto);
		return sqlSession.insert(NAMESPACE+"insertProjectSchdule", prjsDto);
	}
	
	// ������Ʈ ��ü��ȸ Ŭ�����ڵ�
	public List<ProjectDTO> selectProject() {
		logger.info("selectProject");
		return sqlSession.selectList(NAMESPACE+"selectProject");
	}
	
	// ������Ʈ���� ��ü��ȸ
	public List<ProjectScheduleDTO> selectListProjectSchedule(int prj_no) {
		logger.info("selectListProjectSchdule : " + prj_no);
		return sqlSession.selectList(NAMESPACE+"selectListProjectSchdule", prj_no);
	}
	
	// ������Ʈ ����ȸ
	public ProjectDTO selectOneProject(int prj_no) {
		logger.info("selectOneProject : " + prj_no);
		return sqlSession.selectOne(NAMESPACE+"selectOneProject", prj_no);
	}
	
	// ������Ʈ delflag
	public int updateDelProject(int prj_no) {
		logger.info("updateDelProject : " + prj_no);
		return sqlSession.update(NAMESPACE+"updateDelProject", prj_no);
	}
	
	// ������Ʈ���� ����
	public int deleteProjectSchedule(int prj_no) {
		logger.info("deleteProjectSchdule : " + prj_no);
		return sqlSession.delete(NAMESPACE+"deleteProjectSchdule", prj_no);
	}

	// ������Ʈ ����
	public int updateProject(ProjectDTO prjDto) {
		logger.info("updateProject : " + prjDto);
		return sqlSession.update(NAMESPACE+"updateProject", prjDto);
	}
}
