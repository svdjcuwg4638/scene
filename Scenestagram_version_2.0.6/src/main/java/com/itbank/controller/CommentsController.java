package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.model.CommentsDTO;
import com.itbank.service.CommentsService;

@RestController
public class CommentsController {
	
	@Autowired private CommentsService commentsService;
	
	@GetMapping("/getComments/{post_idx}/{users_idx}")
	public List<HashMap<String, Object>> getComments(@PathVariable("post_idx") int post_idx, @PathVariable("users_idx") int users_idx) {
		List<HashMap<String, Object>> list = commentsService.getComments(post_idx, users_idx);
		return list;
	}
	
	@PostMapping("/addComments")
	public int addComments(@RequestBody CommentsDTO dto) {
		int row = commentsService.addComments(dto);	
		return row != 0 ? 1 : 0;
	}
	
	@GetMapping("/comment/like/status/{post_idx}/{users_idx}")
	public List<Integer> getCommentsIDX(@PathVariable("post_idx") int post_idx, @PathVariable("users_idx") int users_idx) {
		List<Integer> list = commentsService.getCommentsIDX(post_idx, users_idx);
		return list;
	}
	
	@GetMapping("/comment/like/{post_idx}/{comment_idx}/{users_idx}")
	public int like(@PathVariable("post_idx") int post_idx, @PathVariable("comment_idx") int comment_idx, @PathVariable("users_idx") int users_idx) {
		int result;
		int like;
		int count = commentsService.getLikeStatus(post_idx, comment_idx, users_idx);
		
		if(count == 0) {
			result = commentsService.addLike(post_idx, comment_idx, users_idx);
			like = 1;
		}
		else {
			result = commentsService.removeLike(post_idx, comment_idx, users_idx);
			like = 0;
		}
		System.out.println(result != 0 ? "적용 성공" : "적용 실패");		
		return like;
	}
	
	@GetMapping("/removeComments/{comment_idx}")
	public int removeComments(@PathVariable("comment_idx") int comment_idx) {
		int row = commentsService.removeComments(comment_idx);
		return row != 0 ? 1 : 0;
	}
}
