package com.remake.weplay.gamematchboard.model.service;

import java.util.List;

import com.remake.weplay.gamematchboard.model.vo.GameMatchBoard;

public interface GameMatchBoardService {

	
	List<GameMatchBoard> selectGameMatchBoardlist(); // 경기게시판 목록 조회기능
	int regGameMatchBoard(GameMatchBoard gb); // 경기게시판 등록
	GameMatchBoard selectGameMatchBoardOne(int gmbNo, String flag); // 경기게시판 상세페이지 조회
	int increaseboardViewCount(int	gmbNo);						// 경기게시판 상세조회 시 조회수 증가
	int updGameMatchBoard(GameMatchBoard Gmb);					// 경기게시판 수정기능
	int delInfo(GameMatchBoard gmb);   							// 경기게시판 삭제 기능
	
	
	
	
}
