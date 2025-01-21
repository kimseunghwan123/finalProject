package com.remake.weplay.team.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.remake.weplay.team.model.vo.Team;
import com.remake.weplay.team.model.vo.TeamApplication;
import com.remake.weplay.team.model.vo.TeamMember;

@Mapper
public interface TeamMapper {
	
	public int countTeams(SqlSessionTemplate sqlSession, HashMap<String, String> map);
	
	public List<Team> selectTeams(SqlSessionTemplate sqlSession, HashMap<String, String> map, RowBounds rowBounds);

	public Team selectTeam(SqlSessionTemplate sqlSession, int teamNo);

	public int applyCheck(SqlSessionTemplate sqlSession, TeamApplication teamApp);
	
	public int joinTeam(SqlSessionTemplate sqlSession, TeamApplication teamApp);

	public List<TeamApplication> selectTeamApplication(SqlSessionTemplate sqlSession, int teamNo);
	
	//팀멤버 삽입
	public int insertTeam(SqlSessionTemplate sqlSession, TeamMember teamMember);

	//팀신청자 업데이트
	public int updateTeamApp(SqlSessionTemplate sqlSession, TeamApplication teamApp);
}
