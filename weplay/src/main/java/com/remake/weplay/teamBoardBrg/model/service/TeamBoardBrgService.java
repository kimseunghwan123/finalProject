package com.remake.weplay.teamBoardBrg.model.service;

import java.util.List;

import com.remake.weplay.teamBoardBrg.model.vo.TeamBoardBrg;

public interface TeamBoardBrgService {

	List<TeamBoardBrg> selectList(int teamNo);
	
	int insertTeamBoardBrg (TeamBoardBrg teamBoardBrg);
	
	int deleteTeamBoardBrg (int boardCode);
	
	
}
