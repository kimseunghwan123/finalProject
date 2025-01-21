package com.remake.weplay.teamBoardBrg.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.remake.weplay.teamBoardBrg.model.vo.TeamBoardBrg;

@Repository
public class TeamBoardBrgRepository {

	public List<TeamBoardBrg> selectList(SqlSessionTemplate sqlSession, int teamNo) {
		return sqlSession.selectList("teamBoardBrgMapper.selectList", teamNo);
	}
	
	public int insertTeamBoardBrg(SqlSessionTemplate sqlSession, TeamBoardBrg teamBoardBrg) {
		return sqlSession.insert("teamBoardBrgMapper.insertTeamBoardBrg",teamBoardBrg);
	}
	
	
	public int deleteTeamBoardBrg(SqlSessionTemplate sqlSession, int boardCode) {
		return sqlSession.delete("teamBoardBrgMapper.deleteTeamBoardBrg", boardCode);
	}
}
