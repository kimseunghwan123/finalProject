package com.remake.weplay.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.remake.weplay.member.model.vo.Member;

@Repository
public class MemberRepository {

	// 로그인 기능
	public Member login(SqlSessionTemplate sqlSession, Member member) {
		System.out.println("login repository잘나온다");
		System.out.println(""+sqlSession.selectOne("memberMapper.login", member));
		return sqlSession.selectOne("memberMapper.login", member);
	}
	// 회원가입 기능
	public int insert(SqlSessionTemplate sqlSession, Member member) {
		System.out.println("insert repository잘나온다");
		return sqlSession.insert("memberMapper.insert", member);
	}
	
	//아이디 중복 체크
		public int idCheck(SqlSessionTemplate sqlSession, Member member) {
			System.out.println("idCheck repository 잘나온다");
			return sqlSession.insert("memberMapper.idCheck", member);
			
		}
		
	//닉네임 중복체크
	public int nickNameCheck(SqlSessionTemplate sqlSession, Member member) {
		System.out.println("nickNameCheck repository 잘나온다");
		return sqlSession.insert("memberMapper.nicknameCheck", member);
	}
	
	
	// 회원 정보 수정 기능
	public int update(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.update", member);
	}
	// 회원 탈퇴 기능
	public int delete(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.delete", member);
	}

}
