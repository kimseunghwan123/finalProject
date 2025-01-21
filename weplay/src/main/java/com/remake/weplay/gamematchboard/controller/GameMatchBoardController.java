package com.remake.weplay.gamematchboard.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.remake.weplay.gamematchboard.model.service.GameMatchBoardService;
import com.remake.weplay.gamematchboard.model.vo.GameMatchBoard;

@Controller
public class GameMatchBoardController {

	
	@Autowired
	GameMatchBoardService gamematchboardSvc;
	
	/*경기게시판 목록 조회*/
	@RequestMapping("gamematchboard.list")
	public String gamematchboardList(@RequestParam(value="page", defaultValue="1")
									int page, Model model) {
		
		System.out.println("[GameMatchBoardController gamematchboardlist]");
		
		List<GameMatchBoard> gamematchboardlist = new ArrayList<GameMatchBoard>();
		
		gamematchboardlist = gamematchboardSvc.selectGameMatchBoardlist();
		
		model.addAttribute("gamematchboardList", gamematchboardlist);
		
		
	return"gamematchboard/gamematchboardList";
	
	}
	
	/* 경기게시판 등록페이지 이동*/
	@RequestMapping("gamematchboard.regForm")
	public String gamematchboardRegForm() {
		System.out.println("[GameMatchBoardController gamematchboardregForm]");
		return "gamematchboard/gamematchboardReg";
	}
	
	/* 경기게시판 신규등록하기*/
	@RequestMapping("gamematchboard.regInfo")
	public String gamematchboardRegInfo(GameMatchBoard gb, Model model) {
		System.out.println("[GameMatchBoardController gamematchboardregInfo]");
		System.out.println(gb);
		
		int regGmb = 0;
		
		regGmb = gamematchboardSvc.regGameMatchBoard(gb);
		System.out.println(regGmb);
		
		if(regGmb > 0) {
			model.addAttribute("res","SUCCESS");
			return "redirect:gamematchboard.list";
		}else {
			model.addAttribute("errorMsg","게시글 등록중 오류가 발생했습니다.");
			return "common/errorPage";
		}
		
	}
	
	/*경기게시판 상세내용 조회(수정, 상세페이지 공통)*/
	@RequestMapping("selectUpdate.gamematchboard")
	public String gamematchboardUpdForm(@RequestParam("boardNo") int boardNo,
										@RequestParam("flag") String flag,
										Model model) {
		System.out.println("[GameMatchBoardController gamematchboardUpdForm boardNo, flag]"
				+ boardNo + "," + flag);
		
	String redirectUrl ="";
	GameMatchBoard gmb = new GameMatchBoard();
	gmb = gamematchboardSvc.selectGameMatchBoardOne(boardNo,flag);
	System.out.println("selectGameMatchBoardOne" + gmb);
	//수정,상세페이지에서 조회내용 보여줄때0 사용할 모델명
	model.addAttribute("gamematchboardOne", gmb);
		
	// "freboardList.jsp"에서 파라미터로 넘겨준 flag값이 Y이면 수정페이지, N이면 상세페이지로 redirect해줌.	
	if("Y".equals(flag)) {
		redirectUrl = "gamematchboard/gamematchboardUpd";
	}else {
		redirectUrl = "gamematchboard/gamematchboardDetail";
	}
	
	return redirectUrl;
	
	}
	
	/*경기게시판 수정 기능*/
	@RequestMapping("gamematchboard.upInfo")
	public String gamematchboardUpdInfo(GameMatchBoard gmb, Model model) {
		System.out.println("[GameMatchBoardController gamematchboardUpdInfo]");
		System.out.println(gmb);
		
		
		int updGmb = 0;
		//경기게시판 수정
		updGmb = gamematchboardSvc.updGameMatchBoard(gmb);
		System.out.println(updGmb);
		
		if(updGmb > 0) {
			model.addAttribute("res","SUCCESS");
			return "redirect:gamematchboard.list";
		}else {
			model.addAttribute("errorMsg","게시글 수정중 오류가 발생하였습니다.");
			return "common/errorPage";
		}
		
	}
	
	/* 경기게시판 삭제 기능*/
	@RequestMapping("gamematchboard.delInfo")
	public String gamematchboardDelInfo(GameMatchBoard gmb, Model model) {
		System.out.println("[GameMatchBoardcontroller gamematchboardDelInfo]");
		System.out.println(gmb);
		
		int delGmb = 0;
		//경기게시판 삭제
		delGmb = gamematchboardSvc.delInfo(gmb);
		System.out.println(delGmb);
		
		if(delGmb > 0) {
			model.addAttribute("res", "SUCCESS");
			return "redirect:gamematchboard.list";
		}else {
			model.addAttribute("errorMsg", "게시글 삭제중 오류가 발생하였습니다.");
			return "common/errorMsg";
	}
}
	
	
	
	
	
}
