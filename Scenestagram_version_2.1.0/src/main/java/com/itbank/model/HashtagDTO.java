package com.itbank.model;

//	IDX     NOT NULL NUMBER        
//	HASHTAG NOT NULL VARCHAR2(300) 

public class HashtagDTO {
	private int idx;
	private String hashtag;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}	
	
}
