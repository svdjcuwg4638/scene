package com.itbank.model;

import java.sql.Date;

//	IDX         NOT NULL NUMBER        
//	ROOM_IDX    NOT NULL NUMBER        
//	WRITER_IDX  NOT NULL NUMBER        
//	CONTENT              VARCHAR2(500) 
//	REGIST_DATE          DATE          
//	STATUS               VARCHAR2(10)

public class ChatMessageDTO {
	
	private int idx;
	private int room_idx;
	private int writer_idx;
	private String content;
	private Date regist_date;
	private String status;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getRoom_idx() {
		return room_idx;
	}
	public void setRoom_idx(int room_idx) {
		this.room_idx = room_idx;
	}
	public int getWriter_idx() {
		return writer_idx;
	}
	public void setWriter_idx(int writer_idx) {
		this.writer_idx = writer_idx;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
