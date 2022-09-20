package com.wp.workpartner.project.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.wp.workpartner.common.model.vo.File;
import com.wp.workpartner.project.model.vo.Project;
import com.wp.workpartner.project.model.vo.ProjectBoard;
import com.wp.workpartner.project.model.vo.ProjectDuty;
import com.wp.workpartner.project.model.vo.ProjectMeeting;
import com.wp.workpartner.project.model.vo.ProjectMember;

@Repository
public class ProjectDao {
	
	public int insertProject(SqlSessionTemplate sqlSession, Project p) {
		return sqlSession.insert("projectMapper.insertProject", p);
	}
	
	public ArrayList<Project> selectProjectList(SqlSessionTemplate sqlSession, String empNo){
		return (ArrayList)sqlSession.selectList("projectMapper.selectProjectList", empNo);
	}
	
	public ArrayList<ProjectMember> selectMemberList(SqlSessionTemplate sqlSession, Project p){
		return (ArrayList)sqlSession.selectList("projectMapper.selectMemberList", p);
	}
	
	public ArrayList<ProjectMember> selectMemberList(SqlSessionTemplate sqlSession, ProjectMember m){
		return (ArrayList)sqlSession.selectList("projectMapper.selectMemberList2", m);
	}
	
	public int validateMember(SqlSessionTemplate sqlSession, Project p) {
		return sqlSession.selectOne("projectMapper.validateMember", p);
	}
	
	public int validateNewMember(SqlSessionTemplate sqlSession, ProjectMember m) {
		return sqlSession.selectOne("projectMapper.validateNewMember", m);
	}
	
	public Project selectProject(SqlSessionTemplate sqlSession, String projNo) {
		return sqlSession.selectOne("projectMapper.selectProject", projNo);
	}
	
	public int updateProject(SqlSessionTemplate sqlSession, Project p) {
		return sqlSession.update("projectMapper.updateProject", p);
	}
	
	public int deleteProject(SqlSessionTemplate sqlSession, String projNo) {
		return sqlSession.update("projectMapper.deleteProject", projNo);
	}
	
	public int updateMember(SqlSessionTemplate sqlSession, ProjectMember m) {
		return sqlSession.update("projectMapper.updateMember", m);
	}
	
	public int deleteMember(SqlSessionTemplate sqlSession, ProjectMember m) {
		return sqlSession.update("projectMapper.deleteMember", m);
	}
	
	public int insertMember(SqlSessionTemplate sqlSession, ProjectMember m) {
		return sqlSession.insert("projectMapper.insertMember", m);
	}
	
	public ArrayList<ProjectBoard> selectProjectBoardList(SqlSessionTemplate sqlSession, Project p){
		return (ArrayList)sqlSession.selectList("projectMapper.selectProjectBoardList", p);
	}
	
	public ProjectDuty selectProjectDuty(SqlSessionTemplate sqlSession, ProjectBoard pb) {
		return sqlSession.selectOne("projectMapper.selectProjectDuty", pb);
	}
	
	public ProjectMeeting selectProjectMeeting(SqlSessionTemplate sqlSession, ProjectBoard pb) {
		return sqlSession.selectOne("projectMapper.selectProjectMeeting", pb);
	}
	
	public int insertBoard(SqlSessionTemplate sqlSession, ProjectBoard pb) {
		return sqlSession.insert("projectMapper.insertBoard", pb);
	}
	
	public int insertDuty(SqlSessionTemplate sqlSession, ProjectDuty pd) {
		return sqlSession.insert("projectMapper.insertDuty", pd);
	}
	
	public int insertFile(SqlSessionTemplate sqlSession, File f) {
		return sqlSession.insert("projectMapper.insertFile", f);
	}
	
	public ArrayList<ProjectBoard> selectDutyBoardList(SqlSessionTemplate sqlSession, Project p){
		return (ArrayList)sqlSession.selectList("projectMapper.selectDutyBoardList", p);
	}
	
	public ProjectDuty selectDuty(SqlSessionTemplate sqlSession, ProjectBoard pb){
		return sqlSession.selectOne("projectMapper.selectDuty", pb);
	}
	
	public File selectFile(SqlSessionTemplate sqlSession, ProjectBoard pb) {
		return sqlSession.selectOne("projectMapper.selectFile", pb);
	}

}
