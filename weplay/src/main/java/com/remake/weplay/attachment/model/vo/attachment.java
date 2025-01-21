package com.remake.weplay.attachment.model.vo;

import lombok.Data;

@Data
public class attachment {

	
	
	/*
	 * FILE_NO NUMBER 1 파일번호
	 *  BOARD_NO NUMBER  2 게시글번호
	 *   ORIGIN_NAME  3 파일원본명
	 *   CHANGE_NAME  4 파일수정명 
	 *   FILE_PATH	  5 파일경로
	 *   
	 *   TB_ATTACHMENT
	 * 
	 */
	
	
	private int fileNo;
	private int boardNo;
	private String originName;
	private String changeName;
	private String filePath;
	
	
	
	
	
	
	
	
	
}
