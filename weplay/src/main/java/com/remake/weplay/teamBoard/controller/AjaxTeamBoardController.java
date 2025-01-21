package com.remake.weplay.teamBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.remake.weplay.team.model.service.TeamService;
import com.remake.weplay.team.model.vo.TeamApplication;
import com.remake.weplay.team.model.vo.TeamMember;

@Controller
public class AjaxTeamBoardController {

	@Autowired
	TeamService teamService;

	/***
	 * 팀에삽입
	 * 
	 * @param teamMember
	 * @return
	 */
	@ResponseBody
	@PostMapping("insertToTeamMember")
	public String ajaxInsertToTeamMember(TeamMember teamMember) {
		return teamService.insertTeam(teamMember) > 0 ? "success" : "fail";
	}

	/***
	 * 팀 신청 업데이트
	 * 
	 * @param teamApplication
	 * @return
	 */
	@ResponseBody
	@PostMapping("updateTeamApplication")
	public String ajaxUpdateTeamApplication(TeamApplication teamApp) {
		return teamService.updateTeamApp(teamApp) > 0 ? "success" : "fail";

	}

}
