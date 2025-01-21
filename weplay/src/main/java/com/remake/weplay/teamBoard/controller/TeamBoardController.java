package com.remake.weplay.teamBoard.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.remake.weplay.teamBoard.model.service.TeamBoardService;
import com.remake.weplay.teamBoard.model.vo.TeamBoard;
import com.remake.weplay.teamBoardBrg.model.service.TeamBoardBrgService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class TeamBoardController {

	@Autowired
	private TeamBoardService teamBoardService; 
	
	
	@ResponseBody
	@GetMapping(value="teamBoardSelect", produces="applcation/json; charset=UTF-8")
	public String selectBoardList(int boardCode) {
		
		return new Gson().toJson(teamBoardService.selectList(boardCode));
		
	}

	
	@ResponseBody
	@PostMapping("teamBoardInsert")
	public String insertBoard(TeamBoard teamBoard) {
		return teamBoardService.insertTeamBoard(teamBoard)>0 ? "success" : "fail";
	}
	
	
	
}
