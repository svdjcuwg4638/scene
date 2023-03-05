package com.itbank.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

//	IDX       	NOT NULL NUMBER             
//	EMAIL     	NOT NULL VARCHAR2(500)      
//	PW        	NOT NULL VARCHAR2(2000)     
//	GENDER    	NOT NULL VARCHAR2(10)       
//	BIRTH     	NOT NULL DATE
//	PHONE_NUMBER	NOT NULL VARCHAR2(100)            
//	NAME      	NOT NULL VARCHAR2(100)      
//	NICK_NAME 	NOT NULL VARCHAR2(100)      
//	INTRODUCE          	 VARCHAR2(150 CHAR) 
//	USER_IMG           	 VARCHAR2(300)      
//	JOIN_DATE          	 DATE
//	STATUS			 VARCHAR2(10)

public class UsersDTO {
	
	private int idx;
	private String email;
	private String pw;
	private String gender;
	private Date birth;
	private String phone_number;
	private String name;
	private String nick_name;
	private String introduce;
	private MultipartFile user_img_file;	// 이미지 파일	
	private String user_img;				// 이미지 파일 명
	private Date join_date;
	private String status;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNick_name() {
		return nick_name;
	}
	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public MultipartFile getUser_img_file() {
		return user_img_file;
	}
	public void setUser_img_file(MultipartFile user_img_file) {
		this.user_img_file = user_img_file;
	}
	public String getUser_img() {
		return user_img;
	}
	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
