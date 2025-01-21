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
	public int regFreBoard(FreBoard bt) {
		
		int regBdt = 0;
		regBdt = freboardRepository.regFreBoardInfo(sqlSession, bt);
		System.out.println(regBdt);
		System.out.println("[FreBoardServiceImpl 등록결과]");
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
