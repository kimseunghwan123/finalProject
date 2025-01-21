package com.remake.weplay.teamBoard.model.service;

import java.util.List;

import com.remake.weplay.team.model.vo.TeamMember;
import com.remake.weplay.teamBoard.model.vo.TeamBoard;

public interface TeamBoardService {

	//팀보드 가져오기
	List<TeamBoard> selectList(int boardCode);
	
	int insertTeamBoard (TeamBoard teamBoard);
	
	List<TeamMember> selectTeamMemberList(int teamNo);
}
