package com.itbank.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.service.FollowService;

@Controller
@RequestMapping("/users")
public class FollowController {

	@Autowired
	private FollowService followService;

	@GetMapping("/follow/{idx}/{myIdx}") // 걔 팔로우 버튼 누르면 팔로우 페이지에서는 걔의 정보를 담고 있던 것. 버튼 누르면 걔의 idx 던져줌
	public String follow(@PathVariable int idx, @PathVariable int myIdx) {
		HashMap<String, Integer> idxhash = new HashMap<String, Integer>();
		idxhash.put("idx", idx);
		idxhash.put("myIdx", myIdx);

		int row = followService.addFollow(idxhash);
		System.out.println(row != 0 ? "팔로우 성공" : "팔로우 실패");

		return "users/myPage";
	}

	@GetMapping("/unfollow/{idx}/{myIdx}") // 걔 팔로우 버튼 누르면 팔로우 페이지에서는 걔의 정보를 담고 있던 것. 버튼 누르면 걔의 idx 던져줌
	public String unfollow(@PathVariable int idx, @PathVariable int myIdx) {
		HashMap<String, Integer> idxhash = new HashMap<String, Integer>();
		idxhash.put("idx", idx);
		idxhash.put("myIdx", myIdx);

		int row = followService.unFollow(idxhash);
		System.out.println(row != 0 ? "언팔로우 성공" : "언팔로우 실패");

		return "users/myPage";
	}

}
