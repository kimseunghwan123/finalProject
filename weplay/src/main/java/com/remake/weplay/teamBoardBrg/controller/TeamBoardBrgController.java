package com.remake.weplay.teamBoardBrg.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.remake.weplay.teamBoardBrg.model.service.TeamBoardBrgService;
import com.remake.weplay.teamBoardBrg.model.vo.TeamBoardBrg;

@Controller
public class TeamBoardBrgController {

	@Autowired
	private TeamBoardBrgService teamBoardBrgService;

	/***
	 * 팀브릿지 전체조회
	 * @param teamNo
	 * @param model
	 * @return
	 */
	@RequestMapping("teamBoard.teamBoard")
	public String selectList(@RequestParam(value="teamNo")int teamNo,Model model) {
		// /WEB-INF/views/member/myPage.jsp
		model.addAttribute("list", teamBoardBrgService.selectList(teamNo));
		
		return "teamBoard/teamBoard";
	}
	
	/**
	 * 팀보드브릿지 삽입
	 * @param teamBoardBrg
	 * @return
	 */
    @ResponseBody
    @PostMapping("insertTeamBoardBrg") // 삽입 메서드의 경로를 변경
    public String ajaxInsertTeamBoardBrg(TeamBoardBrg teamBoardBrg) {
        return teamBoardBrgService.insertTeamBoardBrg(teamBoardBrg) > 0 ? "success" : "fail";
    }

    /***
     * 삭제
     * @param boardCode
     * @return
     */
    @ResponseBody
    @PostMapping("deleteTeamBoardBrg") // 삭제 메서드의 경로를 변경
    public String ajaxDeleteTeamBoardBrg(int boardCode) {
        return teamBoardBrgService.deleteTeamBoardBrg(boardCode) > 0 ? "success" : "fail";
    }
}