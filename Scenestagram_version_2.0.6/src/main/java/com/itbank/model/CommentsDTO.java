package com.itbank.model;

import java.sql.Date;

//	IDX         NOT NULL NUMBER         
//	POST_IDX    NOT NULL NUMBER         
//	USERS_IDX   NOT NULL NUMBER      
//	PARENT_IDX	NOT	NULL NUMBER
//	DEPTH		NOT NULL NUMBER
//	CONTENT     NOT NULL VARCHAR2(3000) 
//	REGIST_DATE          DATE           
//	STATUS               VARCHAR2(10)

public class CommentsDTO {
	private int idx;
	private int post_idx;
	private int users_idx;
	private int parent_idx;
	private int depth;	
	private String content;
	private Date regist_date;
	private String status;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getPost_idx() {
		return post_idx;
	}
	public void setPost_idx(int post_idx) {
		this.post_idx = post_idx;
	}
	public int getUsers_idx() {
		return users_idx;
	}
	public void setUsers_idx(int users_idx) {
		this.users_idx = users_idx;
	}
	public int getParent_idx() {
		return parent_idx;
	}
	public void setParent_idx(int parent_idx) {
		this.parent_idx = parent_idx;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
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
