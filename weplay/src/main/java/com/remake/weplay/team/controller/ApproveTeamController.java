package com.remake.weplay.team.controller;

import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.remake.weplay.commons.model.vo.PageInfo;
import com.remake.weplay.commons.template.Pagination;
import com.remake.weplay.team.model.service.TeamService;
import com.remake.weplay.teamBoard.model.service.TeamBoardService;

@Controller
public class ApproveTeamController {

	@Autowired
	private TeamService teamService;
	
	@Autowired
	private TeamBoardService teamBoardService;
	
	/**
	 * 신청리스트
	 * @param teamNo
	 * @param model
	 * @return
	 */
	@RequestMapping("approveList.do")
	public String approveTeam(	@RequestParam(value="teamNo")int teamNo,
								@RequestParam(value = "page", defaultValue = "1") int page,
								Model model) {
//		model.addAttribute("list", teamService.selectTeamApplication(teamNo));
//		model.addAttribute("memberList",teamBoardService.selectTeamMemberList(teamNo));
		
		HashMap<String, String> map = new HashMap();
		map.put("teamNo", String.valueOf(teamNo));
		int listCount = teamService.selectTeamApplicationCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, page, 5, 10);
	        
		
		RowBounds rowBounds = Pagination.getRowBounds(pi);
        model.addAttribute("list", teamService.selectTeamApplication(map, rowBounds));
        model.addAttribute("memberList", teamBoardService.selectTeamMemberList(teamNo));
        model.addAttribute("map", map);
        model.addAttribute("pageInfo", pi);
		return "teamBoard/teamManage";
	}
	
	
	/*

    @RequestMapping("approveList.do")
    public String approveTeam(
            @RequestParam(value = "teamNo") int teamNo,
            @RequestParam(value = "page", defaultValue = "1") int currentPage,
            Model model) {
        
        HashMap<String, String> map = new HashMap<>();
        map.put("teamNo", String.valueOf(teamNo));
        
        // Get total count of applications for the team
        int listCount = teamService.selectTeamApplicationCount(map);
        
        // Create PageInfo object
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);  // assuming boardLimit is 10 and pageLimit is 5
        
        // Fetch the paginated list of applications
        RowBounds rowBounds = Pagination.getRowBounds(pi);
        model.addAttribute("list", teamService.selectTeamApplication(map, rowBounds));
        model.addAttribute("memberList", teamBoardService.selectTeamMemberList(teamNo));
        model.addAttribute("pageInfo", pi);

        return "teamBoard/teamManage";
    }
}
*/
}
