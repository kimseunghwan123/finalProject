package com.remake.weplay.team.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.remake.weplay.team.model.vo.Team;
import com.remake.weplay.team.model.vo.TeamApplication;
import com.remake.weplay.team.model.vo.TeamMember;

@Repository
public class TeamRepository {
	
	public int countTeams(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("teamMapper.countTeams", map);
	}
	
	public List<Team> selectTeams(SqlSessionTemplate sqlSession, HashMap<String, String> map, RowBounds rowBounds) {
		return sqlSession.selectList("teamMapper.selectTeams", map, rowBounds);
	}

	public Team selectTeam(SqlSessionTemplate sqlSession, int teamNo) {
		return sqlSession.selectOne("teamMapper.selectTeam", teamNo);
	}

	public int applyCheck(SqlSessionTemplate sqlSession, TeamApplication teamApp) {
		return sqlSession.selectOne("teamApplicationMapper.applyCheck", teamApp);
	}
	
	public int joinTeam(SqlSessionTemplate sqlSession, TeamApplication teamApp) {
		return sqlSession.insert("teamApplicationMapper.joinTeam", teamApp);
	}

	public List<TeamApplication> selectTeamApplication(SqlSessionTemplate sqlSession,HashMap<String, String> map, RowBounds rowBounds) {
		return sqlSession.selectList("teamApplicationMapper.selectTeamApplication", map, rowBounds);
	}
	
	public int selectTeamApplicationCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("teamApplicationMapper.selectTeamApplicationCount", map);
	}
	//팀멤버 삽입
	public int insertTeam(SqlSessionTemplate sqlSession, TeamMember teamMember) {
		return sqlSession.insert("teamMemberMapper.insert",teamMember);
	}

	//팀신청자 업데이트
	public int updateTeamApp(SqlSessionTemplate sqlSession, TeamApplication teamApp) {
		return sqlSession.update("teamApplicationMapper.update",teamApp);
	}
}
