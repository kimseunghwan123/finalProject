package com.remake.weplay.team.controller;


import java.util.HashMap;
import java.util.LinkedHashMap;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import com.remake.weplay.city.model.vo.City;
import com.remake.weplay.commons.model.vo.PageInfo;
import com.remake.weplay.commons.template.Pagination;
import com.remake.weplay.team.model.service.TeamService;

@RestController
@RequestMapping(value="teams", produces="application/json; charset=UTF-8")
public class AjaxTeamController {
	
	@Autowired
	private TeamService teamService;
	@Autowired
	private Gson gson;
	
	@GetMapping("/{page}")
	public String selectTeams(City city, @RequestParam(value="keyword", defaultValue="all") String keyword,@PathVariable("page") int currentPage) {
		HashMap<String, String> map = new HashMap();
		
		map.put("sido", city.getSido());
		map.put("sigungu", city.getSigungu());
		map.put("keyword", keyword);
		
		PageInfo pi = Pagination.getPageInfo(teamService.countTeams(map), currentPage, 10, 10);

		JSONArray jsonArr = new JSONArray();
		jsonArr.add(pi);
		jsonArr.add(teamService.selectTeams(map, Pagination.getRowBounds(pi)));
		return gson.toJson(jsonArr);
	}

}
