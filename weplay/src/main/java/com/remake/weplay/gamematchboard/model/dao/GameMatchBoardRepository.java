package com.remake.weplay.gamematchboard.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.remake.weplay.gamematchboard.model.vo.GameMatchBoard;

@Repository
public class GameMatchBoardRepository {

	
	//경기게시판 목록 조회
	public List<GameMatchBoard> selectGameMatchBoardlist(SqlSessionTemplate sqlSession){
		System.out.println("GameMatchBoardRepository list결과");
		return sqlSession.selectList("gamematchboardMapper.selectGameMatchBoardlist");
	}
	
	// 경기게시판 등록
	public int regGameMatchBoardInfo(SqlSessionTemplate sqlSession, GameMatchBoard gmb) {
		System.out.println("[FreBoardRepository regGanmeMatchBoardInfo] " + gmb);
		System.out.println("[FreBoardRepository regGameMatchBoardInfo gb 결과]");
		return sqlSession.insert("gamematchboardMapper.regGameMatchBoard", gmb);
	}
	
	//첨부파일 등록 기능 
		public int regGameMatchBoardFile(SqlSessionTemplate sqlSession, GameMatchBoard gmb) {
			System.out.println("[GameMatchBoardRepository regGameMatchBoardFile] " + gmb);
			System.out.println("[GameMatchBoardRepository regGameMatchBoardFile gb 결과]");
			return sqlSession.insert("gamematchboardMapper.regGameMatchBoardFile", gmb);
		}
	
	// 경기게시판 상세페이지
	public GameMatchBoard selectGameMatchBoardOne(SqlSessionTemplate sqlSession, int gmbNo) {
		System.out.println("[GameMatchBoardRepository selectgamematchboardOne] " + gmbNo);
		return sqlSession.selectOne("gamematchboardMapper.selectGameMatchBoardOne", gmbNo);
	}
	
	// 경기게시판 상세조회 시 조회수 증가
		public int increaseboardViewCount(SqlSessionTemplate sqlSession, int gmbNo) {
			System.out.println("[GameMatchBoardRepository increaseboardViewCount] " + gmbNo);
			return sqlSession.insert("gamematchboardMapper.increaseboardViewCount", gmbNo);
		}
	
	// 경기게시판 수정기능 
	public int updGameMatchBoardInfo(SqlSessionTemplate sqlSession, GameMatchBoard gmb) {
		System.out.println("[GameMatchBoardRepository updGameMatchBoardInfo Vo] " + gmb);
		return sqlSession.insert("gamematchboardMapper.updGameMatchBoard", gmb);
	}
		
		//첨부파일 수정기능
			public int updGameMatchBoardFileUpd(SqlSessionTemplate sqlSession, GameMatchBoard gmb) {
				System.out.println("[GameMatchBoardRepository updGameMatchBoardFileUpd] " + gmb);
				System.out.println("[GameMatchBoardRepository updGameMatchBoardFileUpd bt 결과]");
				return sqlSession.insert("gamematchboardMapper.updGameMatchBoardFileUpd", gmb);
			}
	
	// 경기게시판 삭제 기능
		public int delGameMatchBoardInfo(SqlSessionTemplate sqlSession, GameMatchBoard gmb) {
			System.out.println("[GameMatchBoardRepository delGameMatchBoardInfo Vo] " + gmb);
			return sqlSession.insert("gamematchboardMapper.delGameMatchBoard", gmb);
		}	
		
		// 경기게시판 시퀀스 생성
		public int selectBoardNo(SqlSessionTemplate sqlSession) {
			return sqlSession.selectOne("gamematchboardMapper.selecteBoardNo");
		}
}
