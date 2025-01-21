package com.remake.weplay.team.model.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class TeamMember {
//	NUMBER	MEMBER_NO	Yes		1	회원번호(참조)
//	NUMBER	TEAM_NO	Yes		2	팀번호(참조)
//	VARCHAR2(15 BYTE)	MEMBER_TYPE	No	'일반' 	3	팀 멤버 등급 : 일반/관리자/창시자
//	DATE	ENROLL_DATE	No	SYSDATE 	4	팀 가입일
//	DATE	LEAVE_DATE	Yes		5	팀 탈퇴 날짜
//	VARCHAR2(1 BYTE)	STATUS	No	'Y' 	6	팀 가입 여부 : Y / N
	
	private int memberNo;
	private int teamNo;
	private String memberType;
	private Date enrollDate;
	private Date leaveDate;
	private String status;
	private String nickName;
	
}
