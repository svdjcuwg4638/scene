package com.itbank.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.model.ImageDTO;
import com.itbank.model.PostDTO;
import com.itbank.repository.PostDAO;

@Service
public class PostService {
	
	@Autowired private PostDAO postDAO;
	
	private final String image_directory = "C:\\post_upload";
	
	public PostService() {
		File dir = new File(image_directory);
		if(dir.exists() == false) {
			dir.mkdirs();
		}
	}
	
	private void upload(MultipartFile f) {
		File dest = new File(image_directory, f.getOriginalFilename());
		
		try {
			f.transferTo(dest);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
	}
	
	private String makeFileName(PostDTO dto) {
		String fileName = "";
		
		for(MultipartFile f : dto.getImage_file()) {
			upload(f);
			fileName += f.getOriginalFilename();
			fileName += ",";
		}
		
		fileName = fileName.substring(0, fileName.lastIndexOf(","));
		
		return fileName;
	}
	
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
		
		hashList.forEach(tag -> searchHashList.add(postDAO.searchHashTag(tag)));
		
		System.out.println(searchHashList);
		
		// 해쉬태그가 없을 경우에만 추가를 진행한다
		for(int i = 0; i < hashList.size(); i++) {
			if(searchHashList.get(i) == 0) {
				postDAO.insertHashTag(hashList.get(i));
			}
		}
		
		// 게시글 해쉬태그에 저장하기 위해 해쉬태그 테이블에서 idx를 찾아서 반환한다
		ArrayList<Integer> hashIDXList = new ArrayList<Integer>();
		
		hashList.forEach(tag -> hashIDXList.add(postDAO.getHashIDX(tag)));
		
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
		
		userList.forEach(tag -> searchHashList.add(postDAO.searchHashTag(tag)));
		
		for(int i = 0; i < userList.size(); i++) {
			if(searchHashList.get(i) == 0) {
				postDAO.insertHashTag(userList.get(i));
			}
		}
				
		ArrayList<Integer> userIDXList = new ArrayList<Integer>();
		
		userList.forEach(tag -> userIDXList.add(postDAO.getHashIDX(tag)));
		
		System.out.println(userIDXList);
		
		return userIDXList;
	}
	
	private ArrayList<Integer> selectUsers(String content) {
		ArrayList<String> userList = new ArrayList<String>();
		StringBuilder sb_user = new StringBuilder();		
		
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
		}
		
		ArrayList<Integer> usersList = new ArrayList<Integer>();
		
		userList.forEach(user -> usersList.add(postDAO.getUsersIDX(user)));
		
		System.out.println(usersList);
		
		return usersList;
	}

	private int addPostHashTag(ArrayList<Integer> idxList, int post_idx) {
//		idxList.forEach(tag -> {			
//			HashMap<String, Integer> idxMap = new HashMap<String, Integer>();
//			idxMap.put("post_idx", post_idx);
//			idxMap.put("tag", tag);
//			if(postDAO.insertPostHashTag(idxMap) != 1) {
//				return row;
//			};
//		});
		int row = 0;
		for(int tag : idxList) {
			HashMap<String, Integer> idxMap = new HashMap<String, Integer>();
			idxMap.put("post_idx", post_idx);
			idxMap.put("tag", tag);
			if(postDAO.insertPostHashTag(idxMap) == 1) {
				row++;
			}
		}
		
		return row == idxList.size() ? 1 : 0;
	}
	
	private int removePostHashTag(int post_idx) {
		int row = 0;
		row = postDAO.deletePostHashTag(post_idx);
		return row;
	}
		
	public List<ImageDTO> getImage() {
		return postDAO.selectImage();
	}

	public PostDTO getDetail(int post_idx) {
		return postDAO.selectDetail(post_idx);
	}
		
	public String getImageName(int post_idx) {
		return postDAO.selectImageName(post_idx);
	}

	public int updateViews(int post_idx) {
		return postDAO.updateViews(post_idx);
	}

	public int addPost(PostDTO dto) {
		// 이미지 들어왔는지 판단
		List<MultipartFile> fileList = dto.getImage_file();
		fileList.removeIf(file -> file.getSize() == 0);
		dto.setImage_file(fileList);
		
		int insert_post = postDAO.insertPost(dto);
		
		if(insert_post != 1) return 0;		
		
		int post_idx = postDAO.getMaxIDX(dto.getUsers_idx());
		
		String fileName = makeFileName(dto);
		
		ImageDTO imgDTO = new ImageDTO();
		imgDTO.setPost_idx(post_idx);
		imgDTO.setFile_name(fileName);
		
		int insert_img = postDAO.insertImage(imgDTO);
		
		if(insert_img != 1) return 0;
		
		if(dto.getContent().contains("#")) {
			ArrayList<Integer> hashIDXList = searchHash(dto.getContent());
			
			int insert_hashtag = addPostHashTag(hashIDXList, post_idx);
			
			if(insert_hashtag != 1) return 0;
			
//			hashIDXList.forEach(tag -> {
//				HashMap<String, Integer> idxMap = new HashMap<String, Integer>();
//				idxMap.put("post_idx", post_idx);
//				idxMap.put("tag", tag);
//				postDAO.insertPostHashTag(idxMap);
//			});
		}
		
		if(dto.getContent().contains("@")) {
			ArrayList<Integer> userIDXList = searchUser(dto.getContent());
			ArrayList<Integer> usersList = selectUsers(dto.getContent());
			
			int insert_hashtag = addPostHashTag(userIDXList, post_idx);
			
			if(insert_hashtag != 1) return 0;
			
//			userIDXList.forEach(tag -> {
//				HashMap<String, Integer> idxMap = new HashMap<String, Integer>();
//				idxMap.put("post_idx", post_idx);
//				idxMap.put("tag", tag);
//				postDAO.insertPostHashTag(idxMap);
//			});
			
			usersList.forEach(user -> {
				HashMap<String, Integer> idxMap = new HashMap<String, Integer>();
				idxMap.put("post_idx", post_idx);
				idxMap.put("user", user);
				postDAO.insertUserTag(idxMap);
			});
		}
		
		return 1;
	}

	public int getLikeStatus(int post_idx, int users_idx) {		
		HashMap<String, Integer> likeList = new HashMap<String, Integer>();
		likeList.put("users_idx", users_idx);
		likeList.put("post_idx", post_idx);		
		return postDAO.selectLikeStatus(likeList);
	}

	public int insertLike(int post_idx, int users_idx) {		
		HashMap<String, Integer> likeList = new HashMap<String, Integer>();
		likeList.put("users_idx", users_idx);
		likeList.put("post_idx", post_idx);
		return postDAO.insertLike(likeList);
	}

	public int deleteLike(int post_idx, int users_idx) {		
		HashMap<String, Integer> likeList = new HashMap<String, Integer>();
		likeList.put("users_idx", users_idx);
		likeList.put("post_idx", post_idx);
		return postDAO.deleteLike(likeList);
	}

	public List<ImageDTO> getList(int users_idx) {
		List<Integer> post_idx_list = postDAO.selectPostIDX(users_idx);
//		System.out.println(post_idx_list);
		List<ImageDTO> image_list = new ArrayList<ImageDTO>();
		post_idx_list.forEach(post_idx -> image_list.add(postDAO.selectPostImage(post_idx)));		
//		System.out.println(image_list);
		return image_list;
	}

	public int removePost(int post_idx) {
		return postDAO.updateStatus(post_idx);
	}

	public int getLikeCount(int post_idx) {
		return postDAO.selectLikeCount(post_idx);
	}

	public int modifyPost(PostDTO dto) {
		int post_idx = dto.getIdx();
		int remove_hashtag = removePostHashTag(post_idx);
		System.out.println(remove_hashtag >= 1 ? "삭제 성공" : "삭제 요소 없음");
		
		int update_post = postDAO.updatePost(dto);
		
		if(update_post != 1) return 0;
		
		if(dto.getContent().contains("#")) {
			ArrayList<Integer> hashIDXList = searchHash(dto.getContent());	
			
			int insert_hashtag = addPostHashTag(hashIDXList, post_idx);
			
			if(insert_hashtag != 1) return 0;
		}
		
		if(dto.getContent().contains("@")) {
			ArrayList<Integer> userIDXList = searchUser(dto.getContent());
			
			int insert_hashtag = addPostHashTag(userIDXList, post_idx);
			
			if(insert_hashtag != 1) return 0;
		}		
		
		return 1;
	}

	// 태그 검색 결과에 대한 페이지 (스크롤 페이징)
	public List<HashMap<String, Object>> getPostList(HashMap<String, Object> tagOff) {
		return postDAO.getPostList(tagOff);
	}

	// 타임라인 게시글 스크롤
	public List<HashMap<String, Object>> getPost(int offset, int idx) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("offset", offset);
		param.put("idx",idx);
		return postDAO.getScroll(param);
	}

	public List<HashMap<String, Object>> bringPost(HashMap<String, Object> idxOff) {
	      return postDAO.bringPost(idxOff);
	}

	public List<HashMap<String, Object>> explore(int offset) {
         return postDAO.explore(offset);
     	}

	public HashMap<String, Object> getData(int users_idx, int offset) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("users_idx", users_idx);
		map.put("offset", offset);
		return postDAO.selectData(map);
	}

	public HashMap<String, Object> getDetailData(int post_idx) {
		return postDAO.selectDetailData(post_idx);
	}

	public int resultCount(String hashtag) {
		return postDAO.resultCount(hashtag);
	}

	public int countPost(int idx) {
		return postDAO.countPost(idx);
	}

	public HashMap<String, Object> getPostDetailOne(int offset) {		
		return postDAO.selectPostDetailOne(offset);
	}

	public HashMap<String, Object> getPostDetailHashtag(int offset, String hashtag) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("offset", offset);
		map.put("hashtag", "#" + hashtag);
		return postDAO.selectPostDetailHashtag(map);
	}

}
