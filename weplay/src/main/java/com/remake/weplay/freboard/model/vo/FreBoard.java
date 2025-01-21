package com.remake.weplay.freboard.model.vo;


import lombok.Data;

@Data
public class FreBoard {

	
	private int boardNo;  //게시글 번호
	private int memberNo;	//회원번호
	private String nickName; //닉네임
	private String boardTitle;	//게시판제목
	private String boardContent;	//제시판 내용
	private int boardViewCount;	//게시판 조회수
	private String status;		//게시여부 상태
	private String boardType;	// 게시판 유형 A|B
	private String noticeStatus;	//공지여부상태
	private String createDate;	//작성일
	private String updateDate; 	//수정일
	private String filePath; // TB_ATTACHMENT /FILE_PATH
	private int fileNo;
	private String flag;
	
	
	
}
