package com.itbank.model;

import org.springframework.web.multipart.MultipartFile;

//	IDX       NOT NULL NUMBER        
//	POST_IDX  NOT NULL NUMBER        
//	FILE_NAME          VARCHAR2(300)

public class ImageDTO {

	private int idx;
	private int post_idx;
	private MultipartFile image_file;
	private String file_name;	
	
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
	public MultipartFile getImage_file() {
		return image_file;
	}
	public void setImage_file(MultipartFile image_file) {
		this.image_file = image_file;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	
}
