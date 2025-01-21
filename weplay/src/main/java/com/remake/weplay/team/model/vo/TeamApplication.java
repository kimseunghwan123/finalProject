package com.remake.weplay.team.model.vo;

import java.sql.Date;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
@Data
public class TeamApplication {
	
	private int applyNo;
	private int memberNo;
	private int teamNo;
	private String applyContent;
	private Date applyDate;
	private String status;
	private String nickName;
	private String teamName;
}
