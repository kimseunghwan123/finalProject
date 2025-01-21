package com.remake.weplay.team.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.remake.weplay.team.model.vo.Team;
import com.remake.weplay.team.model.vo.TeamApplication;
import com.remake.weplay.team.model.vo.TeamMember;

public interface TeamService {

	int countTeams(HashMap<String, String> map);
	
	List<Team> selectTeams(HashMap<String, String> map, RowBounds rowBounds);

	Team selectTeam(int teamNo);

	int applyCheck(TeamApplication teamApp);
	
	int joinTeam(TeamApplication teamApp);
	
	
	int insertTeam(TeamMember teamMember);
	
	int updateTeamApp(TeamApplication teamApp);
	
	//팀 신청자 목록
	List<TeamApplication> selectTeamApplication(HashMap<String, String> map, RowBounds rowBounds);
	//팀신청 카운트
	int selectTeamApplicationCount(HashMap<String, String> map);

}
