package com.remake.weplay.teamBoard.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class TeamBoard {

//	NUMBER	BOARD_NO	No		1	게시글 번호 : SEQ_TBNO
//	NUMBER	BOARD_CODE	Yes		2	게시판 코드(참조)
//	NUMBER	MEMBER_NO	Yes		3	회원번호(참조)
//	VARCHAR2(3000 BYTE)	CONTENT	Yes		4	내용
//	DATE	CREATE_DATE	No	SYSDATE 	5	작성일
//	DATE	UPDATE_DATE	Yes		6	수정일
//	VARCHAR2(1 BYTE)	STATUS	No	'Y' 	7	게시 상태 : Y / N
	
	private int boardNo;
	private int boardCode;
	private int userNo;
	private String content;
	private Date createDate;
	private Date updateDate;
	private String status;
	private String nickName;
}
