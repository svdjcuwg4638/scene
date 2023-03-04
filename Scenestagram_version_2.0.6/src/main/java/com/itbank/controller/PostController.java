package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.ImageDTO;
import com.itbank.model.PostDTO;
import com.itbank.service.PostService;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired private PostService postService;
	
	@GetMapping("/list")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		List<ImageDTO> list = postService.getImage();		
		list.forEach(dto -> {
			String newFileName = dto.getFile_name();
			newFileName = newFileName.split(",")[0];
			dto.setFile_name(newFileName);
			System.out.println(newFileName);
		});
		mav.addObject("list", list);		
		return mav;
	}
	
	@GetMapping("/getList/{users_idx}")
	@ResponseBody
	public List<ImageDTO> getList(@PathVariable("users_idx") int users_idx) {
		List<ImageDTO> json = postService.getList(users_idx);
		return json;
	}
	
	@GetMapping("/detail/{post_idx}")
	public ModelAndView detail(@PathVariable("post_idx") int post_idx) {
		ModelAndView mav = new ModelAndView("/post/detail");
		PostDTO post_dto = postService.getDetail(post_idx);
		String imageFileName = postService.getImageName(post_idx);
		int row = postService.updateViews(post_idx);
		System.out.println(row == 1 ? "카운트 성공" : "카운트 실패");
//		System.out.println(imageFileName);
		int likeCount = postService.getLikeCount(post_idx);
		mav.addObject("likeCount", likeCount);
		mav.addObject("dto", post_dto);
		mav.addObject("image", imageFileName);		
		return mav;
	}
	
	@GetMapping("/add")
	public void add() {}
	
	@PostMapping("/add")
	@ResponseBody
	public String add(PostDTO dto) {
		int row = postService.addPost(dto);		
		return row+"";
	}
	
	@GetMapping("/like/status/{post_idx}/{users_idx}")
	@ResponseBody
	public int likeStatus(@PathVariable("post_idx") int post_idx, @PathVariable("users_idx") int users_idx) {
		int like = postService.getLikeStatus(post_idx, users_idx);
		return like;
	}
	
	@GetMapping("/like/{post_idx}/{users_idx}")
	@ResponseBody
	public int like(@PathVariable("post_idx") int post_idx, @PathVariable("users_idx") int users_idx) {		
		int row = 0;
		int like = postService.getLikeStatus(post_idx, users_idx);
		if(like == 0) {
			row = postService.insertLike(post_idx, users_idx);
			like = 1;
		}
		else {
			row = postService.deleteLike(post_idx, users_idx);
			like = 0;
		}
		System.out.println(row == 1 ? "적용 성공" : "적용 실패");		
		
		return like;
	}
	
	@GetMapping("/modify/{post_idx}")
	public ModelAndView modify(@PathVariable("post_idx") int post_idx) {
		ModelAndView mav = new ModelAndView("/post/modify");
		PostDTO dto = postService.getDetail(post_idx);
		mav.addObject("dto", dto);		
		return mav; 
	}
	
	@PostMapping("/modify/{post_idx}")
	public String modify(PostDTO dto) {
		System.out.println("게시글 idx : " + dto.getIdx());
		int row = postService.modifyPost(dto);
		System.out.println(row != 0 ? "게시글 수정 성공" : "게시글 수정 실패");
		return "redirect:/post/detail/" + dto.getIdx();		
	}
	
	@GetMapping("/remove/{post_idx}")
	public String remove(@PathVariable("post_idx") int post_idx) {
		int row = postService.removePost(post_idx);
		System.out.println(row != 0 ? "상태 변경 성공" : "상태 변경 실패");
		return "redirect:/post/list";
	}
	
	@GetMapping("/map")
	public void map() {}

	// 해시 검색 결과에 대한 포스트 리스트 페이지
	@GetMapping("/postList/{hashtag}")
	public ModelAndView postList(@PathVariable("hashtag") String hashtag) {
		ModelAndView mav = new ModelAndView("/post/postList");
		mav.addObject("hashtag", hashtag);
		return mav;
	}


  // 탐색탭 왔을 때 추천 수 높은 게시글의 이미지 잘라서 줄 것임
   @GetMapping("/explore")
   public ModelAndView explore() {
      ModelAndView mav = new ModelAndView("/post/explore");
      return mav;
   }
	
	@GetMapping("/modalTest")
	public ModelAndView modalTest() {
		ModelAndView mav = new ModelAndView();
		List<ImageDTO> list = postService.getImage();		
		list.forEach(dto -> {
			String newFileName = dto.getFile_name();
			newFileName = newFileName.split(",")[0];
			dto.setFile_name(newFileName);
			System.out.println(newFileName);
		});
		mav.addObject("list", list);
		mav.addObject("size", list.size());
		return mav;
	}
	
	@GetMapping("/modalTest/{post_idx}")
	@ResponseBody
	public HashMap<String, Object> modalTest(@PathVariable("post_idx") int post_idx) {
		HashMap<String, Object> dto = postService.getDetailData(post_idx);
		return dto;
	}
	
	@GetMapping("/modalTest/{users_idx}/{offset}")
	@ResponseBody
	public HashMap<String, Object> modalTest(@PathVariable("users_idx") int users_idx, @PathVariable("offset") int offset) {
		HashMap<String, Object> dto = postService.getData(users_idx, offset);
		return dto;
	}
	
}
