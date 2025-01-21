package com.remake.weplay.freboard.model.service;

import java.util.List;

import com.remake.weplay.freboard.model.vo.FreBoard;

public interface FreBoardService {

	List<FreBoard> selectFreBoardlist(); //자유게시판 목록 조회
	int regFreBoard(FreBoard bt); // 자유게시판 등록
	FreBoard selectFreBoardOne(int fbdNo, String flag); // 자유게시판 상세페이지 조회
	int increaseboardViewCount(int fbdNo);			// 자유게시판 상세조회 시 조회수 증가
	int updFreBoard(FreBoard Fb);					// 자유게시판 수정기능
	int delInfo(FreBoard fb);   					// 자유게시판 삭제 기능
	
}
