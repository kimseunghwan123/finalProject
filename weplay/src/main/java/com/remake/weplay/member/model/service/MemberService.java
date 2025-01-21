package com.remake.weplay.member.model.service;

import com.remake.weplay.member.model.vo.Member;

public interface MemberService {
	
	// 로그인(SELECT)
	Member login(Member member);
	
	// 회원가입(INSERT)
	int insert(Member member);
	
	//아이디 중복 체크
	int idCheck(Member member);
			
	// 닉네임 중복 체크
	int nickNameCheck(Member member);
	
	// 회원정보수정(UPDATE)
	int update(Member member);
	
	// 회원탈퇴(UPDATE)
	int delete(Member member);
	
}
