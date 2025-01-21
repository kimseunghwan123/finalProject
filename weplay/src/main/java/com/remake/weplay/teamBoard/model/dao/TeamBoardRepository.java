package com.remake.weplay.teamBoard.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.remake.weplay.team.model.vo.TeamMember;
import com.remake.weplay.teamBoard.model.vo.TeamBoard;

@Repository
public class TeamBoardRepository {

	
	
	public List<TeamBoard> selectList(SqlSessionTemplate sqlSession, int boardCode){
		return sqlSession.selectList("teamBoardMapper.selectList",boardCode );
	}
	
	public int insertTeamBoard(SqlSessionTemplate sqlSession, TeamBoard teamBoard) {
		return sqlSession.insert("teamBoardMapper.insertTeamBoard",teamBoard);
	}
	public List<TeamMember> selectTeamMemberList(SqlSessionTemplate sqlSession, int teamNo){
		return sqlSession.selectList("teamMemberMapper.selectTeamMemberList",teamNo);
	}
}
