package com.itbank.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.model.HashtagDTO;
import com.itbank.model.ImageDTO;
import com.itbank.model.PostDTO;
import com.itbank.model.UsersDTO;
import com.itbank.service.FollowService;
import com.itbank.service.MailService;
import com.itbank.service.PostService;
import com.itbank.service.UserProfile;
import com.itbank.service.UsersService;

@RestController
public class AjaxController {

	@Autowired FollowService followService;
	@Autowired UsersService userService;
	@Autowired PostService postService;
	@Autowired UserProfile userProfile;
	
	@Autowired private MailService mailService;
	private HashMap<String, String> authNumberMap = new HashMap<String, String>();
	
	//아이디 중복체크
	@GetMapping("/idCheck/{id}")
	public int idCheck(@PathVariable("id") String id) {
		System.out.println(id);
		int cnt = userService.idCheck(id);
		return cnt;
	}
	
	// 인증코드 생성 후 이메일 보내기
	@GetMapping("/sendAuthNumber")
	public int sendMail(String email , String phone_number) throws IOException {
		Random ran = new Random();
		String authNumber = ran.nextInt(89999999) + 10000000 + "";
		int row = 0;
		
		// 메일 보내기전 사용자가 존재하는지 확인
		if(userService.emailFindUsers(email,phone_number) != 0 ) {
			
			row = mailService.sendMail(email, authNumber);
			authNumberMap.put(email, authNumber);
			return row = 1;
		}else {
			// 없다면 0을 반환하여 없는사용자라 멘트출력
			return row;			
		}
		
	}
	
	// 클라이언트에게 인증번호를 받은뒤 내가보낸 인증코드와 일치하는지 확인
	@PostMapping("/sendAuthNumber")
	public int codeCheck(@RequestBody HashMap<String, String> param) {		

		String storedAuthNumber = authNumberMap.get(param.get("email"));
		
		String inputAuthNumber = param.get("authNumber");

		boolean flag = storedAuthNumber.equals(inputAuthNumber);
		
		return flag ? 1 : 0;
	}
	
	// 아이디 중복확인
	@PostMapping("/nickNameCheck")
	public int nickNameCheck(String nick_name) {
		
		return userService.getUserNickName(nick_name);
	}
	
	// 전화번호 중복확인
	@PostMapping("/phoneNumberCheck")
	public int phoneNumberCheck(String phoneNumber) {
		return userService.getUserPhoneNumber(phoneNumber);
	}
	
	// 팔로우가 되어있는지 확인
		@GetMapping("/findFollow/{idx}/{myIdx}")
		public int findFollow(@PathVariable("idx") int idx, @PathVariable("myIdx") int myIdx) {
			System.out.println(idx);
			System.out.println(myIdx);
			HashMap<String, Integer> idxHash = new HashMap<String, Integer>();
			idxHash.put("idx", idx);
			idxHash.put("myIdx", myIdx);
			
			int row = followService.findFollow(idxHash);
			
			return row;
		}
		
		// 팔로우
		@GetMapping("/follow/{idx}/{myIdx}") // 걔 팔로우 버튼 누르면 팔로우 페이지에서는 걔의 정보를 담고 있던 것. 버튼 누르면 걔의 idx 던져줌
		public int follow(@PathVariable int idx, @PathVariable int myIdx) {
			HashMap<String, Integer> idxhash = new HashMap<String, Integer>();
			idxhash.put("idx", idx);
			idxhash.put("myIdx", myIdx);

			int row = followService.addFollow(idxhash);
			System.out.println(row != 0 ? "팔로우 성공" : "팔로우 실패");

			return row;
		}
		
		// 언팔
		@GetMapping("/unfollow/{idx}/{myIdx}") // 걔 팔로우 버튼 누르면 팔로우 페이지에서는 걔의 정보를 담고 있던 것. 버튼 누르면 걔의 idx 던져줌
		public int unfollow(@PathVariable int idx, @PathVariable int myIdx) {
			HashMap<String, Integer> idxhash = new HashMap<String, Integer>();
			idxhash.put("idx", idx);
			idxhash.put("myIdx", myIdx);

			int row = followService.unFollow(idxhash);
			System.out.println(row != 0 ? "언팔로우 성공" : "언팔로우 실패");

			return row;
		}
		
// 계정의 팔로잉 카운트를 반환
	@GetMapping("/countFollowing/{idx}")
	public int countFolloing(@PathVariable("idx") int idx) {
		int row = followService.countFollowing(idx);

		System.out.println(row);

		return row;
	}

	// 계정의 팔로워 카운트를 반환
	@GetMapping("/countFollower/{idx}")
	public int countFollower(@PathVariable("idx") int idx) {
		int row = followService.countFollower(idx);

//				System.out.println(row);

		return row;
	}

// 검색

	// 유저 검색
	@GetMapping("/usersSearch/{searchValue}")
	public List<UsersDTO> usersSearch(@PathVariable("searchValue") String searchValue) {
		System.out.println(searchValue);
			List<UsersDTO> list = userService.usersSearch(searchValue);
			return list;

	}
	
	// 해시 검색
	@GetMapping("/hashSearch/{searchValue}")
	public List<HashMap<String, Object>> hashSearch(@PathVariable("searchValue") String searchValue) {	// 해시 서비스 따로 만들기 그래서 일단 유저서비스 DAO 돌려쓰겟습니다
		List<HashMap<String, Object>> list = userService.hashSearch(searchValue);
		return list;
	}
	
	// 태그 검색 결과에 대한 스크롤 페이징
	@GetMapping("/getPostList/{offset}/{hashtag}")
	public List<HashMap<String, Object>> getPostList(@PathVariable("offset") int offset, @PathVariable("hashtag") String hashtag) {
		HashMap<String, Object> tagOff = new HashMap<String, Object>();
		tagOff.put("hashtag", "#" + hashtag);
		tagOff.put("offset", offset);
		System.out.println(hashtag);
		System.out.println(offset);
		
		List<HashMap<String, Object>> list = postService.getPostList(tagOff);
		
   		list.forEach(dto -> {
      		String fileName = (String) dto.get("FILE_NAME");
      		fileName = fileName.split(",")[0];
      		dto.put("FILE_NAME", fileName);
      		System.out.println(fileName);
   		});
		
		return list;
	}
	
	
	// 타임라인 게시글 스크롤 
	@GetMapping("/getPostListScroll/{offset}/{idx}")
	public List<HashMap<String, Object>> getPost(@PathVariable("offset") int offset , @PathVariable("idx") int idx){
		System.out.println(idx);
		List<HashMap<String, Object>> list = postService.getPost(offset, idx);
		return list;
	}

	// 뷰디테일 페이지의 작성자 게시물을 가져오는 브링포스트 . 대상의 idx를 가져와서 사진의 이름을 돌려줄 것
	@GetMapping("/bringPost/{idx}/{offset}")
    	public List<HashMap<String, Object>> bringPost(@PathVariable("idx") int idx, @PathVariable("offset") int offset) {
      		HashMap<String, Object> idxOff = new HashMap<String, Object>();
      		idxOff.put("idx", idx);
      		idxOff.put("offset", offset);
      
      		List<HashMap<String, Object>> list = postService.bringPost(idxOff);       
       		
       		list.forEach(dto -> {
          		String fileName = (String) dto.get("FILE_NAME");
          		fileName = fileName.split(",")[0];
          		dto.put("FILE_NAME", fileName);
          		System.out.println(fileName);
       		});
       
       		return list;
    	}

	// 메인 온로드 될 때 추천친구 받아올 함수.   로그인의 idx를 같이 받아옴
    @GetMapping("/recommend/{idx}")
    public List<UsersDTO> recommend(@PathVariable("idx") int idx) {
       List<UsersDTO> list = userService.recommend(idx);
       System.out.println(list);
       
       return list;
    }
    
 // 팔로우가 있는 기준   (1촌 추천)
    @GetMapping("/recommendAll/{idx}")
    public List<UsersDTO> recommendAll(@PathVariable("idx") int idx) {
       List<UsersDTO> list = userService.recommend(idx);
       System.out.println(list);
       
       return list;
    }
    
    // 팔로우가 없는 기준   (유명인 추천)
    @GetMapping("/recommendFamous/{idx}")
    public List<UsersDTO> recommendFamous(@PathVariable("idx") int idx) {
       List<UsersDTO> list = userService.recommendFamous(idx);
       System.out.println(list);
       
       return list;
    }

// 탐색탭 왔을 때 추천 수 높은 게시글의 이미지 잘라서 줄 것임
    @GetMapping("/explore/{offset}")
    public List<HashMap<String, Object>> explore(@PathVariable("offset") int offset) {
       List<HashMap<String, Object>> list = postService.explore(offset);
       System.out.println(list);
       
       System.out.println(list);
       list.forEach(dto -> {
			String fileName = (String) dto.get("FILE_NAME");
			fileName = fileName.split(",")[0];
			dto.put("FILE_NAME", fileName);
			System.out.println(fileName);
       });
       return list;
    }
    
 // 탐색탭에서 다음 이전 버튼 눌렀을 때 실행
    @GetMapping("/getPostDetailOne/{offset}")
    public HashMap<String, Object> getPostDetailOne(@PathVariable("offset") int offset) {
    	HashMap<String, Object> dto = postService.getPostDetailOne(offset);
       return dto;
    }

// 검색결과에 대한 게시글의 카운트 개수 반환
    @GetMapping("/resultCount/{hashtag}")
    public int resultCount(@PathVariable("hashtag") String hashtag) {
    	hashtag = "#" + hashtag;
    	int row = postService.resultCount(hashtag);
    	System.out.println(row);
    	return row;
    }
    
 // 검색결과에 대한 게시글 다음 이전 버튼 눌렀을 때 실행
    @GetMapping("/getPostDetailOne/{offset}/{hashtag}")
    public HashMap<String, Object> getPostDetailHashtag(@PathVariable("offset") int offset, @PathVariable("hashtag") String hashtag) {
    	HashMap<String, Object> dto = postService.getPostDetailHashtag(offset, hashtag);    	
    	return dto;
    }

 // 뷰 디테일 페이지의 포스트 수 반환
    @GetMapping("/countPost/{idx}")
    public int countPost(@PathVariable("idx") int idx) {
       int row = postService.countPost(idx);
       System.out.println(row);
       
       return row;
    }
    // 유저 이미지 업로드
    @PostMapping("/upload-image")
    public String handleFileUpload(@RequestParam("imageFile") MultipartFile file , HttpSession session) {
        UsersDTO loginuser = (UsersDTO)session.getAttribute("login");
        int userIdx = loginuser.getIdx();
        String webPath = "resources/img";
        String folderPath = session.getServletContext().getRealPath(webPath);
        System.out.println(userService.profileImgModify(file.getOriginalFilename(), userIdx) == 0 ? "이미지 수정실패" : "이미지 수정성공");
        File dest = new File(folderPath);
        try {
            file.transferTo(dest);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "result";
    }
}



