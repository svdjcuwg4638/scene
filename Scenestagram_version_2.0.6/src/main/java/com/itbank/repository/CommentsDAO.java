package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbank.model.CommentsDTO;

@Repository
public interface CommentsDAO {

	List<HashMap<String, Object>> selectComments(HashMap<String, Integer> map);

	int insertComments(CommentsDTO dto);

	List<Integer> selectCommentsIDX(HashMap<String, Integer> map);

	int selectLikeStatus(HashMap<String, Integer> map);

	int insertLike(HashMap<String, Integer> map);

	int deleteLike(HashMap<String, Integer> map);

	int searchHashTag(String tag);
	
	int insertHashTag(String string);

	int getHashIDX(String tag);

	int getMaxIDX(HashMap<String, Integer> map);

	int insertCommentsHashTag(HashMap<String, Integer> idxMap);

	int updateCommentStatus(int comment_idx);	

}
