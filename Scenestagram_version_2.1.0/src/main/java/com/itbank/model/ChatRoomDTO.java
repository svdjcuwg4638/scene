package com.itbank.model;

import java.sql.Date;

//	IDX              NOT NULL NUMBER       
//	PARTICIPANT1_IDX NOT NULL NUMBER       
//	PARTICIPANT2_IDX NOT NULL NUMBER       
//	REGIST_DATE               DATE         
//	STATUS                    VARCHAR2(10) 

public class ChatRoomDTO {
	
	private int idx;
	private int participant1_idx;
	private int participant2_idx;
	private Date regist_date;
	private String status;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getParticipant1_idx() {
		return participant1_idx;
	}
	public void setParticipant1_idx(int participant1_idx) {
		this.participant1_idx = participant1_idx;
	}
	public int getParticipant2_idx() {
		return participant2_idx;
	}
	public void setParticipant2_idx(int participant2_idx) {
		this.participant2_idx = participant2_idx;
	}
	public Date getRegist_date() {
		return regist_date;
	}
	public void setRegist_date(Date regist_date) {
		this.regist_date = regist_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}	
	
}
