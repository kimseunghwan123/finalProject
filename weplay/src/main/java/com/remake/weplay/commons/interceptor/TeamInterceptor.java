package com.remake.weplay.commons.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.remake.weplay.member.model.vo.Member;

public class TeamInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if(((Member)session.getAttribute("loginUser")).getTeamNo() > 0) {
			return true;
		} else {
			session.setAttribute("alertMsg", "팀 가입 후 이용해주세요.");
			response.sendRedirect(request.getContextPath());
			return false;
		}
	}
	
	
	
}
