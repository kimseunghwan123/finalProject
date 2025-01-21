package com.remake.weplay.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.remake.weplay.member.model.service.MemberService;
import com.remake.weplay.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	
	
	
	
	/***
	 * 로그인 (암호)
	 * @param member
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping("login.member")
	public ModelAndView login(Member member, HttpSession session, ModelAndView mv) {
		System.out.println(member);
		Member loginUser = memberService.login(member);
		System.out.println("loginUser : " + loginUser);
		if(loginUser != null) {
			
			System.out.println("DB에서 조회한 값 : " + loginUser.getUserPwd());
			System.out.println("화면에서 입력한 값 : " + member.getUserPwd());
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("main");			
		} else {
			mv.addObject("errorMsg", "올바른 아이디/비밀번호를 임력해주세요.").setViewName("common/errorPage");;
		}

		
		return mv;
	}
	/***
	 * 마이페이지
	 * @return
	 */
	@RequestMapping("mypage.member")
	public String myPage() {
		// /WEB-INF/views/member/myPage.jsp
		return "member/myPage";
	}
	/***
	 * 수정
	 * @param member
	 * @param mv
	 * @param session
	 * @return
	 */
	@RequestMapping("update.member")
	public ModelAndView handleUpdateRequest(/*@ModelAttribute*/ Member member, ModelAndView mv, HttpSession session) {
		if(memberService.update(member) > 0) {
			session.setAttribute("alertMsg", "정보 수정 성공");
			session.setAttribute("loginUser", memberService.login(member));
			mv.setViewName("redirect:mypage.member");
		} else {
			mv.addObject("errorMsg", "정보 수정 실패..").setViewName("common/errorPage");
		}
		return mv;
	}
	/***
	 * 로그아웃
	 * @param session
	 * @return
	 */
	@RequestMapping("logout.member")
	public String logout(HttpSession session) {
		session.removeAttribute("loginUser");
		return "redirect:/";
	}
	
	
	/***
	 * 회원가입 폼
	 * @return
	 */
	@RequestMapping("enrollForm.member")
	public String enrollForm() {
		return "member/memberEnrollForm";
	}
	
	
	/***
	 * 로그인 폼
	 * @return
	 */
	@RequestMapping("loginForm.member")
	public String loginForm() {
		return "member/memberLoginForm";
	}
	/***
	 * 회원가입
	 * @param member
	 * @param mv
	 * @param session
	 * @return
	 */
	@RequestMapping("insert.member")
	public ModelAndView insertMember(Member member, ModelAndView mv, HttpSession session) {
		
		
		if(memberService.insert(member) > 0) {
			session.setAttribute("alertMsg", "가입 성공");
			mv.setViewName("redirect:/");
		} else {
			mv.addObject("errorMsg", "회원가입 실패..").setViewName("common/errorPage");
		}
		return mv;
	}
	
	/*
	 * 아이디 중복 체크
	 * 
	 * 
	 * */
	@RequestMapping("idCheck.do")
		public ModelAndView idCheck(Member member,ModelAndView mv, HttpSession session ) {
		System.out.println("아이디 중복 체크 controller 잘나온다");		
		
		if(memberService.idCheck(member) > 0) {
			session.setAttribute("idCheck()", "아이디 중복체크 성공" );
			mv.setViewName("redirect:/");
		} else {
			mv.addObject("errorMsg", "중복체크 실패했습니다.").setViewName("common/errorPage");
		}
		return mv;
		}
	
	
	
	
	/*
	 *	비밀번호 중복체크 
	 * 
	 * 
	 * */
	
	
	/*
	 * 닉네임 중복체크	
	 * 
	 * 
	 * */
	@RequestMapping("nickNameCheck.do")
	public ModelAndView nickNameCheck(Member member, ModelAndView mv, HttpSession session ) {
		System.out.println("닉네임 중복 체크 controller 잘나온다");
		
		if(memberService.nickNameCheck(member) > 0) {
			session.setAttribute("nickNameCheck()", "닉네임 중복체크 성공");
		}else {
			mv.addObject("errorMsg", "중복체크 실패했습니다.").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	/****
	 * 삭제
	 * @param userPwd
	 * @param session
	 * @return
	 */
	@RequestMapping("delete.member")
	public String delete(String userPwd, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		if (loginUser != null) {
			session.removeAttribute("loginUser");
			session.setAttribute("alertMsg", "회원 탈퇴 성공");
			return "redirect:/";
		} else {
			session.setAttribute("alertMsg", "회원 탈퇴 실패..");
			return "redirect:mypage.member";
		}
	}
}
