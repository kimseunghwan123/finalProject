package com.remake.weplay.teamBoard.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.remake.weplay.member.model.vo.Member;
import com.remake.weplay.team.model.vo.TeamMember;
import com.remake.weplay.teamBoard.model.dao.TeamBoardRepository;
import com.remake.weplay.teamBoard.model.vo.TeamBoard;

@Service
public class TeamBoardServiceImpl implements TeamBoardService{

	@Autowired
	private TeamBoardRepository teamBoardRepository;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/***
	 * 셀렉트
	 */


	@Override
	public List<TeamBoard> selectList(int boardCode) {
		return teamBoardRepository.selectList(sqlSession, boardCode);
	}

	@Override
	public int insertTeamBoard(TeamBoard teamBoard) {
		return teamBoardRepository.insertTeamBoard(sqlSession,teamBoard);
	}

	@Override
	public List<TeamMember> selectTeamMemberList(int teamNo) {
		return teamBoardRepository.selectTeamMemberList(sqlSession,teamNo);
	}
	
	
	
	
}
