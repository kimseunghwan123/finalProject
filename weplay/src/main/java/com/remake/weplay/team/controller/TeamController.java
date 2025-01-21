package com.remake.weplay.team.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.remake.weplay.team.model.service.TeamService;
import com.remake.weplay.team.model.vo.Team;

@Controller
public class TeamController {

	@Autowired
	private TeamService teamService;

	@GetMapping("allTeams")
	public String forwardToAllTeams() {
		return "team/allTeams";
	}

	@GetMapping("teamInfo")
	public ModelAndView forwardToTeamInfo(ModelAndView mv, int teamNo) {
		Team team = teamService.selectTeam(teamNo);
		if (team != null) {
			mv.addObject("team", team).setViewName("team/teamInfo");
		} else {
			mv.setViewName("redirect:/");
		}
		return mv;
	}
//
//	@RequestMapping("delete.team")
//	public String delete(int teamNo, Model model) {
//		if (teamService.deleteTeam(teamNo) > 0) {
//			 model.addAttribute("message", "팀이 성공적으로 삭제되었습니다.");
//		} else {
//	        model.addAttribute("message", "팀 삭제에 실패했습니다.");
//		}
//	}

}
