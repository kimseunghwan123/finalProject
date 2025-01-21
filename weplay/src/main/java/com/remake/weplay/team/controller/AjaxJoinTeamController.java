package com.remake.weplay.team.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.remake.weplay.team.model.service.TeamService;
import com.remake.weplay.team.model.vo.TeamApplication;

@RestController
@RequestMapping(value="joinTeam", produces="application/json; charset=UTF-8")
public class AjaxJoinTeamController {
	
	@Autowired
	private TeamService teamService;
	@Autowired
	private Gson gson;
	
	@PostMapping
	public String joinTeam(TeamApplication teamApp) {
		String result; // Y : 성공 / E : 실패 / N : 이미 신청함
		if(teamService.applyCheck(teamApp) == 0) {
			if(teamService.joinTeam(teamApp) > 0) result = "Y";
			else result = "E";
		} else {
			result = "N";
		}
		return gson.toJson(result);
	}


}
