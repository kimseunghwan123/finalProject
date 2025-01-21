package com.remake.weplay.freboard.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.remake.weplay.freboard.model.vo.FreBoard;

@Repository
public class FreBoardRepository {

	// 자유게시판 목록 조회
	public List<FreBoard>selectFreBoardlist(SqlSessionTemplate sqlSession){
		System.out.println("FreBoardRepository list결과");
		return sqlSession.selectList("freboardMapper.selectFreBoardlist");
	}

	//자유게시판 등록
	public int regFreBoardInfo(SqlSessionTemplate sqlSession, FreBoard bt) {
		System.out.println("[FreBoardRepository regFreBoardInfo] " + bt);
		System.out.println("[FreBoardRepository regNoticeInfo bt 결과]");
		return sqlSession.insert("freboardMapper.regFreBoard", bt);
		
	}
	
	//자유게시판 상세페이지 
	public FreBoard selectFreBoardOne(SqlSessionTemplate sqlSession, int fbdNo) {
		System.out.println("[FreBoardRepository selectfreboardOne] " + fbdNo);
		return sqlSession.selectOne("freboardMapper.selectFreBoardOne", fbdNo);
	}
	
	// 자유게시판 상세조회 시 조회수 증가
	public int increaseboardViewCount(SqlSessionTemplate sqlSession, int fbdNo) {
		System.out.println("[FreBoardRepository increaseboardViewCount] " + fbdNo);
		return sqlSession.insert("freboardMapper.increaseboardViewCount", fbdNo);
	}
	
	// 자유게시판 수정기능 
	public int updFreBoardInfo(SqlSessionTemplate sqlSession, FreBoard fb) {
		System.out.println("[FreBoardRepository updFreBoardInfo Vo] " + fb);
		return sqlSession.insert("freboardMapper.updFreBoard", fb);
	}
	
	// 자유게시판 삭제 기능
	public int delFreBoardInfo(SqlSessionTemplate sqlSession, FreBoard fb) {
		System.out.println("[FreBoardRepository delFreBoardInfo Vo] " + fb);
		return sqlSession.insert("freboardMapper.delFreBoard", fb);
	}
	
	
	
	
}
