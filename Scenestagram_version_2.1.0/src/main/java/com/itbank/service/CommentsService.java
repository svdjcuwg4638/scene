package com.itbank.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.CommentsDTO;
import com.itbank.repository.CommentsDAO;

@Service
public class CommentsService {

	@Autowired private CommentsDAO commentsDAO;
	
	// 해시태그를 찾아서 없으면 추가해주고 전체 해시태그의 idx를 담은 ArrayList를 반환한다 
	private ArrayList<Integer> searchHash(String content) {	
		// 본문에서 해쉬태그를 찾아서 hashList에 저장한다
		ArrayList<String> hashList = new ArrayList<String>();
		StringBuilder sb_hash = new StringBuilder();
		sb_hash.append("#");
		
		String[] hashContent = content.split("#");
		
		for(int i = 1; i < hashContent.length; i++) {
			String tmp = hashContent[i];
			for(int j = 0; j < tmp.length(); j++) {
				char ch = tmp.charAt(j);
				if((ch >= 48 && ch <= 57) || (ch >= 65 && ch <= 90) || (ch >= 97 && ch <= 122) || ch == 95 || ch > 127) {
					sb_hash.append(ch + "");
				}
				else {
					break;
				}
			}
			if(sb_hash.toString().length() != 0) {
				hashList.add(sb_hash.toString());
			}			
			sb_hash = new StringBuilder();
			sb_hash.append("#");
		}
		
		// 찾은 해쉬태그가 현재 테이블에 있는지 확인을 하고 결과를 searchHashList에 저장한다 	
		ArrayList<Integer> searchHashList = new ArrayList<Integer>();
		
		hashList.forEach(tag -> searchHashList.add(commentsDAO.searchHashTag(tag)));
		
		System.out.println(searchHashList);
		
		// 해쉬태그가 없을 경우에만 추가를 진행한다
		for(int i = 0; i < hashList.size(); i++) {
			if(searchHashList.get(i) == 0) {
				commentsDAO.insertHashTag(hashList.get(i));
			}
		}
		
		// 게시글 해쉬태그에 저장하기 위해 해쉬태그 테이블에서 idx를 찾아서 반환한다
		ArrayList<Integer> hashIDXList = new ArrayList<Integer>();
		
		hashList.forEach(tag -> hashIDXList.add(commentsDAO.getHashIDX(tag)));
		
		System.out.println(hashIDXList);
		
		return hashIDXList;
	}
	
	// 유저태그를 찾아서 없으면 추가해주고 전체 유저태그의 idx를 담은 ArrayList를 반환한다
	private ArrayList<Integer> searchUser(String content) {
		ArrayList<String> userList = new ArrayList<String>();
		StringBuilder sb_user = new StringBuilder();
		sb_user.append("@");
		
		String[] userContent = content.split("@");
		
		for(int i = 1; i < userContent.length; i++) {
			String tmp = userContent[i];
			for(int j = 0; j < tmp.length(); j++) {
				char ch = tmp.charAt(j);
				if((ch >= 48 && ch <= 57) || (ch >= 65 && ch <= 90) || (ch >= 97 && ch <= 122) || ch == 95 || ch > 127) {
					sb_user.append(ch + "");
				}
				else {
					break;
				}
			}
			if(sb_user.toString().length() != 0) {
				userList.add(sb_user.toString());
			}			
			sb_user = new StringBuilder();
			sb_user.append("@");
		}
		
		ArrayList<Integer> searchHashList = new ArrayList<Integer>();
		
		userList.forEach(tag -> searchHashList.add(commentsDAO.searchHashTag(tag)));
		
		for(int i = 0; i < userList.size(); i++) {
			if(searchHashList.get(i) == 0) {
				commentsDAO.insertHashTag(userList.get(i));
			}
		}
				
		ArrayList<Integer> userIDXList = new ArrayList<Integer>();
		
		userList.forEach(tag -> userIDXList.add(commentsDAO.getHashIDX(tag)));
		
		System.out.println(userIDXList);
		
		return userIDXList;
	}
	
	private int addCommentsHashTag(ArrayList<Integer> idxList, int comments_idx, int post_idx) {
		int row = 0;
		for(int tag : idxList) {
			HashMap<String, Integer> idxMap = new HashMap<String, Integer>();
			idxMap.put("post_idx", post_idx);
			idxMap.put("comments_idx", comments_idx);
			idxMap.put("tag", tag);
			if(commentsDAO.insertCommentsHashTag(idxMap) == 1) {
				row++;
			}
		}
		return row == idxList.size() ? 1 : 0;
	}
	
	public List<HashMap<String, Object>> getComments(int post_idx, int users_idx) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("post_idx", post_idx);
		map.put("users_idx", users_idx);
		return commentsDAO.selectComments(map);
	}

	public int addComments(CommentsDTO dto) {	
		int insert_comments = commentsDAO.insertComments(dto);
		
		if(insert_comments != 1) return 0;
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("post_idx", dto.getPost_idx());
		map.put("users_idx", dto.getUsers_idx());		
		
		int post_idx = dto.getPost_idx();
		int comments_idx = commentsDAO.getMaxIDX(map);
		
		if(dto.getContent().contains("#" )) {
			ArrayList<Integer> hashIDXList = searchHash(dto.getContent());
			
			int insert_hashtag = addCommentsHashTag(hashIDXList, comments_idx, post_idx);
			
			if(insert_hashtag != 1) return 0;
		}
		
		if(dto.getContent().contains("@" )) {
			ArrayList<Integer> userIDXList = searchUser(dto.getContent());
			
			int insert_hashtag = addCommentsHashTag(userIDXList, comments_idx, post_idx);
			
			if(insert_hashtag != 1) return 0;
		}
		
		return 1;
	}

	

	public List<Integer> getCommentsIDX(int post_idx, int users_idx) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("post_idx", post_idx);
		map.put("users_idx", users_idx);	
		return commentsDAO.selectCommentsIDX(map);
	}

	public int getLikeStatus(int post_idx, int comment_idx, int users_idx) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("post_idx", post_idx);
		map.put("comment_idx", comment_idx);
		map.put("users_idx", users_idx);
		return commentsDAO.selectLikeStatus(map);
	}

	public int addLike(int post_idx, int comment_idx, int users_idx) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("post_idx", post_idx);
		map.put("comment_idx", comment_idx);
		map.put("users_idx", users_idx);
		return commentsDAO.insertLike(map);
	}

	public int removeLike(int post_idx, int comment_idx, int users_idx) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("post_idx", post_idx);
		map.put("comment_idx", comment_idx);
		map.put("users_idx", users_idx);
		return commentsDAO.deleteLike(map);
	}

	public int removeComments(int comment_idx) {
		return commentsDAO.updateCommentStatus(comment_idx);
	}
	
}
