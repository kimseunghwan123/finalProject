package com.remake.weplay.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.remake.weplay.member.model.service.KakaoService;
import com.remake.weplay.member.model.vo.SocialMember;

@Controller
public class SocialLoginController {

	
	@Autowired
	KakaoService kakaoService;
	
	@GetMapping("kakao")
	public String loginPage() {
		return "kakao-login";
	}
	
	
	@GetMapping("code")
	public String code(String code,HttpSession session) throws Exception{
		
		String accessToken = kakaoService.getToken(code);
		
		SocialMember sm = kakaoService.getUserInfo(accessToken);
		
		
		session.setAttribute("loginUser",sm);
		
		return "redirect:kakao";
	}
}
