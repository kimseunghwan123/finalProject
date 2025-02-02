package com.remake.weplay.gamematchboard.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.remake.weplay.gamematchboard.model.dao.GameMatchBoardRepository;
import com.remake.weplay.gamematchboard.model.vo.GameMatchBoard;

@Service
public class GameMatchBoardServiceImpl implements GameMatchBoardService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private GameMatchBoardRepository gamematchboardRepository;
	
	//경기게시판 목록 조회 기능
	@Override
	public List<GameMatchBoard> selectGameMatchBoardlist() {
		System.out.println("[GameMatchBoardServiceImpl selectGameMatchBoardlist]");
		
		List<GameMatchBoard> list = gamematchboardRepository.selectGameMatchBoardlist(sqlSession);
		System.out.println("GameMatchBoardServiceImpl list결과");
		
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i));
		}
		return list;
	}
	
	//경기게시판 등록
	@Override
	public int regGameMatchBoard(GameMatchBoard gmb) {
		
		
		int regGmb = 0;
		regGmb = gamematchboardRepository.regGameMatchBoardInfo(sqlSession,gmb);
		
		//TB_ATTACHMENT SERVICEIMPL만들기
		regGmb = gamematchboardRepository.regGameMatchBoardFile(sqlSession, gmb);
		
		System.out.println("[FreBoardServiceImpl file_Path]"+ gmb);
		System.out.println(regGmb);
		System.out.println("[GameMatchBoardServiceImpl 등록결과]");
		
		return regGmb;
	}
	
	// 경기게시판 상세페이지
	@Override
	public GameMatchBoard selectGameMatchBoardOne(int gmbNo, String flag) {
		
		System.out.println("selectGameMatchBoardOne In GameMatchBoardServiceImpl : " + gmbNo);
		GameMatchBoard gmb = new GameMatchBoard();
		
		//상세페이지 조회인 경우에만 boardViewCount 증가 시켜줘야함
		if("N".equals(flag)) {
			int bdVwCountGmb = 0;
			//boardViewCount 증가
			bdVwCountGmb = this.increaseboardViewCount(gmbNo);
			
		}
		
		gmb = gamematchboardRepository.selectGameMatchBoardOne(sqlSession, gmbNo);
		System.out.println(gmb);
		return gmb;
	
	}
		
	//boardViewCount  조회수증가 기능
		@Override
		public int increaseboardViewCount(int gmbNo) {
			
			int updgbVwCount = 0;
			updgbVwCount = gamematchboardRepository.increaseboardViewCount(sqlSession, gmbNo); 
			return updgbVwCount;
			
		}	
		
		// 경기 게시판 수정기능
		@Override
		public int updGameMatchBoard(GameMatchBoard gmb) {
			
			int updGmb = 0;
			updGmb = gamematchboardRepository.updGameMatchBoardInfo(sqlSession, gmb);
			
			
			//TB_ATTACHMENT 수정기능 SERVICEIMPL만들기
			updGmb = gamematchboardRepository.updGameMatchBoardFileUpd(sqlSession, gmb);
			
			
			System.out.println(updGmb);
			return updGmb;
		}
	
		// 자유게시판 삭제 기능
		@Override
		public int delInfo(GameMatchBoard gmb) {
			
			int delGmb = 0;
			delGmb = gamematchboardRepository.delGameMatchBoardInfo(sqlSession, gmb);
			System.out.println(delGmb);
			return delGmb;
		}
		
		
	
	}
	
