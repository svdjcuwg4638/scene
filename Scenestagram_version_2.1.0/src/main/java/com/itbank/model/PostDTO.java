package com.itbank.model;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

//	IDX         NOT NULL NUMBER         
//	USERS_IDX   NOT NULL NUMBER         
//	CONTENT              VARCHAR2(3000) 
//	LOCATION             VARCHAR2(300)  
//	REGIST_DATE          DATE           
//	STATUS               VARCHAR2(10)
//	VIEWS		NUMBER

public class PostDTO {
	
	private int idx;
	private int users_idx;
	private String content;
	private String location;
	private Date regist_date;
	private List<MultipartFile> image_file;	
	private String status;
	private int views;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getUsers_idx() {
		return users_idx;
	}
	public void setUsers_idx(int users_idx) {
		this.users_idx = users_idx;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Date getRegist_date() {
		return regist_date;
	}
	public void setRegist_date(Date regist_date) {
		this.regist_date = regist_date;
	}
	public List<MultipartFile> getImage_file() {
		return image_file;
	}
	public void setImage_file(List<MultipartFile> image_file) {
		this.image_file = image_file;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	
}
