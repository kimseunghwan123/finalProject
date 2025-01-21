package com.remake.weplay.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Member {
//	NUMBER	MEMBER_NO
//	VARCHAR2(10 BYTE)	MEMBER_ID
//	VARCHAR2(20 BYTE)	PASSWORD
//	VARCHAR2(30 BYTE)	NICKNAME
//	NUMBER	AGE
//	VARCHAR2(13 BYTE)	PHONE
//	VARCHAR2(300 BYTE)	ADDRESS
//	VARCHAR2(900 BYTE)	INFO
//	VARCHAR2(3 BYTE)	SKILL
//	VARCHAR2(12 BYTE)	POSITION
//	VARCHAR2(100 BYTE)	SUB_POSITION
//	DATE	ENROLL_DATE
//	DATE	UPDATE_DATE
//	VARCHAR2(1 BYTE)	STATUS
	
	private int userNo;
	private String userId;
	private String userPwd;
	private String nickName;
	private int age;
	private String phone;
	private String address;
	private String info; 
	private String skill;
	private String position;
	private String subPosition;
	private Date enrollDate;
	private Date updateDate;
	private String status;
	private int teamNo;
	private String memberType;
}
