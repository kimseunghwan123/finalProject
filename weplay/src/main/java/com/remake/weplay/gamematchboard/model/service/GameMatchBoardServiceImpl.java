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
				// 1. 게시판 테이블 boardNo 시퀀스 생성 ***
				int bdNo = gamematchboardRepository.selectBoardNo(sqlSession);
				gmb.setBoardNo(bdNo);
				System.out.println("boardNo 생성 값 확인 : " + bdNo + ", gamematchboard boardNo : " + gmb.getBoardNo());
		
		
				//TB_ATTACHMENT SERVICEIMPL만들기
		
				// 2. 경기게시판 등록
				if( gamematchboardRepository.regGameMatchBoardInfo(sqlSession, gmb) > 0 ) {
					regGmb = 1;
					System.out.println("success to create GameMatchBoard..." + regGmb);
					
					gmb.setOriginName(gmb.getFilePath());
					gmb.setChangeName(gmb.getFilePath());
					
					// 3. 첨부파일 등록
					if( gamematchboardRepository.regGameMatchBoardFile(sqlSession, gmb) > 0 ) {
						regGmb = 1;
						System.out.println("success to create FileInfo..." + regGmb);
					} else {
						regGmb = 0;
						System.out.println("fail to regGameMatchBoardInfo..." + regGmb);
					}
					
				} else {
					regGmb = 0;
					System.out.println("fail to regGameMatchBoardInfo..." + regGmb);
				}
				
				//TB_ATTACHMENT SERVICEIMPL만들기    TB_ATTACHMENT > FULE_PATH 의 파일경로 값을 OriginName ,ChangeName 컬럼에 값을 넣기
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
			
			gmb.setOriginName(gmb.getFilePath());
			gmb.setChangeName(gmb.getFilePath());
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
	
