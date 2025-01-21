package com.remake.weplay.freboard.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.remake.weplay.freboard.model.service.FreBoardService;
import com.remake.weplay.freboard.model.vo.FreBoard;

@Controller
public class FreBoardController {

	@Autowired
	FreBoardService freboardSvc;

	
	/*자유게시판 목록 조회*/
	@RequestMapping("freboard.list")
	public String freboardList(@RequestParam(value="page", defaultValue="1")
								int page, Model model) {
		
		System.out.println("[FreBoardController freboardlist]");
		
		List<FreBoard> freboardlist = new ArrayList<FreBoard>();
		
		freboardlist = freboardSvc.selectFreBoardlist();
		
		model.addAttribute("freboardList", freboardlist);
		
		return "freboard/freboardList";
	}
	
	/*자유게시판 등록페이지로 이동*/
	@RequestMapping("freboard.regForm")
	public String freboardRegForm() {
		System.out.println("[FreBoardController freboardregForm]");
		return"freboard/freboardReg";
	}
	
	/* 자유게시판 신규 등록하기 */
	@RequestMapping("freboard.regInfo")
	public String freboardRegInfo(FreBoard bt, Model model) {
			System.out.println("[FreBoardController freboardRegInfo]");
			System.out.println(bt);
			
		int regBdt = 0;
		
		regBdt = freboardSvc.regFreBoard(bt);
		System.out.println(regBdt);
		
		if(regBdt > 0) {
			model.addAttribute("res","SUCCESS");
			return "redirect:freboard.list";
		}else {
			model.addAttribute("errorMsg","게시글 등록 중 오류가 발생하였습니다.");
			return "common/errorPage";
		}
		
	}
	
	/* 자유게시판 상세내용 조회(수정, 상세페이지 공통)*/
	@RequestMapping("selectUpdate.freboard")
	public String freboardUpdForm(@RequestParam("boardNo") int boardNo,
								  @RequestParam("flag") String flag,
								  Model model) {
		System.out.println("[FreBoardController freboardUpdForm boardNo, flag]"
							+ boardNo + "," + flag);
		
		String redirectUrl = "";
		FreBoard fbd = new FreBoard();
		fbd = freboardSvc.selectFreBoardOne(boardNo, flag);
		System.out.println("selectFreBoardOne" + fbd);
		// 수정, 상세페이지에서 조회내용 보여줄 때 사용할 모델명
		model.addAttribute("freboardOne", fbd);
		
		// "freboardList.jsp"에서 파라미터로 넘겨준 flag값이 Y이면 수정페이지, N이면 상세페이지로 redirect해줌.
		if("Y".equals(flag)) {
			redirectUrl = "freboard/freboardUpd";
		}else {
			redirectUrl = "freboard/freboardDetail";
		}
		
		return redirectUrl;
	}
	
	/*자유게시판 수정 기능*/
	@RequestMapping("freboard.updInfo")
	public String freboardUpdInfo(FreBoard fb, Model model) {
		System.out.println("[FreBoardcontroller freboardUpdInfo]");
		System.out.println(fb);
		
		int updFbt = 0;
		//자유게시판 수정
		updFbt = freboardSvc.updFreBoard(fb);
		System.out.println(updFbt);
		
		if(updFbt > 0) {
			model.addAttribute("res","SUCCESS");
			return "redirect:freboard.list";
		}else {
			model.addAttribute("errorMsg","게시글 수정중 오류가 발생하였습니다.");
			return "common/errorPage";
		}
	}
		
		/* 자유게시판 삭제 기능*/
		@RequestMapping("freboard.delInfo")
		public String freboardDelInfo(FreBoard fb, Model model) {
			System.out.println("[FreBoardcontroller freboardDelInfo]");
			System.out.println(fb);
			
			int delFbt = 0;
			//자유게시판 삭제
			delFbt = freboardSvc.delInfo(fb);
			System.out.println(delFbt);
			
			if(delFbt > 0) {
				model.addAttribute("res", "SUCCESS");
				return "redirect:freboard.list";
			}else {
				model.addAttribute("errorMsg", "게시글 삭제중 오류가 발생하였습니다.");
				return "common/errorMsg";
		}
	}
	
	
	
	
	
}
