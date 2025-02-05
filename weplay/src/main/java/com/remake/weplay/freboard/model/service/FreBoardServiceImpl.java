package com.remake.weplay.freboard.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.remake.weplay.freboard.model.dao.FreBoardRepository;
import com.remake.weplay.freboard.model.vo.FreBoard;

@Service
public class FreBoardServiceImpl implements FreBoardService {

		@Autowired
		private SqlSessionTemplate sqlSession;
		
		@Autowired
		private FreBoardRepository freboardRepository;
	
	//자유 게시판 목록 조회 
	@Override
	public List<FreBoard> selectFreBoardlist() {
		
		System.out.println("[FreBoardServiceImpl selectFreBoardlist]");
		List<FreBoard> list = freboardRepository.selectFreBoardlist(sqlSession);
		System.out.println("FreBoardServiceImpl list결과");
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i));
		}
		
		return list;
	}
	// 자유게시판 등록 
	@Override
	public int regFreBoard(FreBoard fb) {
		
		int regBdt = 0;
		
		// 1. 게시판 테이블 boardNo 시퀀스 생성 ***
		int bdNo = freboardRepository.selectBoardNo(sqlSession);
		fb.setBoardNo(bdNo);
		System.out.println("boardNo 생성 값 확인 : " + bdNo + ", freboard boardNo : " + fb.getBoardNo());
		
		// 2. 자유게시판 등록
		if( freboardRepository.regFreBoardInfo(sqlSession, fb) > 0 ) {
			regBdt = 1;
			System.out.println("success to create FreBoardInfo..." + regBdt);
			
			fb.setOriginName(fb.getFilePath());
			fb.setChangeName(fb.getFilePath());
			
			// 3. 첨부파일 등록
			if( freboardRepository.regFreBoardFile(sqlSession, fb) > 0 ) {
				regBdt = 1;
				System.out.println("success to create FileInfo..." + regBdt);
			} else {
				regBdt = 0;
				System.out.println("fail to regFreBoardInfo..." + regBdt);
			}
			
		} else {
			regBdt = 0;
			System.out.println("fail to regFreBoardInfo..." + regBdt);
		}
		
		//TB_ATTACHMENT SERVICEIMPL만들기    TB_ATTACHMENT > FULE_PATH 의 파일경로 값을 OriginName ,ChangeName 컬럼에 값을 넣기
		return regBdt;
	}
	
	
	
	

	//자유 게시판 상세페이지
	@Override
	public FreBoard selectFreBoardOne(int fbdNo, String flag) {
		
		System.out.println("selectFreBoardOne In FreBoardServiceImpl : " + fbdNo);
		FreBoard fbd = new FreBoard();
		
		//상세페이지 조회인 경우에만 boardViewCount 증가 시켜줘야함
		if("N".equals(flag)) {
			int bdVwCountFbd = 0;
			//boardViewCount 증가
			bdVwCountFbd = this.increaseboardViewCount(fbdNo);
			
		}
		
		fbd = freboardRepository.selectFreBoardOne(sqlSession, fbdNo);
		System.out.println(fbd);
		return fbd;
	
	}
	
	//boardViewCount  조회수증가 기능
	@Override
	public int increaseboardViewCount(int fbdNo) {
		
		int updfbVwCount = 0;
		updfbVwCount = freboardRepository.increaseboardViewCount(sqlSession, fbdNo); 
		return updfbVwCount;
		
	}
	
	// 자유 게시판 수정기능
	@Override
	public int updFreBoard(FreBoard fb) {
		
		int updFbt = 0;
		updFbt = freboardRepository.updFreBoardInfo(sqlSession, fb);
		
		//TB_ATTACHMENT 수정기능 SERVICEIMPL만들기
		fb.setOriginName(fb.getFilePath());
		fb.setChangeName(fb.getFilePath());
		updFbt = freboardRepository.updFreBoardFileUpd(sqlSession, fb);
		
		
		System.out.println(updFbt);
		return updFbt;
	}
	
	// 자유게시판 삭제 기능
	@Override
	public int delInfo(FreBoard fb) {
		
		int delFbt = 0;
		delFbt = freboardRepository.delFreBoardInfo(sqlSession, fb);
		System.out.println(delFbt);
		return delFbt;
	}
	
	
	
	
	
	

}
