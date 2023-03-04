package com.itbank.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itbank.model.UsersDTO;
import com.itbank.service.UserProfile;
import com.itbank.service.UsersService;

@Controller
@RequestMapping("/users")
public class UsersController {
	
	@Autowired private UsersService usersService;
	@Autowired private UserProfile userProfile;
	@Autowired private BCryptPasswordEncoder pwdEncoder;

	private static final Logger logger = LoggerFactory.getLogger(UsersController.class); 
	
	// 로그인
	@GetMapping("/login")
	public void ge() {}
	
	@PostMapping("/login")
	public String login(UsersDTO dto, HttpSession session , RedirectAttributes rttr) {
		logger.info("post login");
		
		session.getAttribute("login");
		UsersDTO login = usersService.login(dto);
		boolean pwdMatch = false;
		if(login.getStatus().equals("deactivate")) {
			rttr.addFlashAttribute("withdrowuser","회원탈퇴한 계정입니다.");
			return "redirect:/users/login";
		}
		
		if(login != null) {
			pwdMatch = pwdEncoder.matches(dto.getPw(), login.getPw());
		}
		
		if(login != null && pwdMatch == true) {
			session.setAttribute("login", login);
			return "redirect:/users/main";
		}else {
			session.setAttribute("login", null);
			rttr.addFlashAttribute("msg",false);
			rttr.addFlashAttribute("inputPhoneNumber",dto.getPhone_number());
			return "redirect:/users/login";
		}
		
	}
	// 로그인 end
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/users/login";
	}
	
	// 회원가입
	@GetMapping("/join")
	public void join() {}
	
	@PostMapping("/join")
	public String join(UsersDTO dto) {
		
		logger.info("post join");
		String inputPass = dto.getPw();
		String pwd = pwdEncoder.encode(inputPass);
		dto.setPw(pwd);
		int row = usersService.insert(dto);
		System.out.println(row == 0  ? "가입실패" : "가입성공");
		
		return "redirect:/users/login";
		
	}
	//회원가입 end
	
	@GetMapping("/main")
	public void main() {}		
	
	//개인정보 수정
	@GetMapping("/infoModify")
	public void userModify() {
	}
	@PostMapping("/infoModify")
	public void modify(UsersDTO dto, HttpSession session) {
		int row = usersService.infoModify(dto);
		System.out.println(row ==  0 ? "회원정보 수정실패" : "회원정보 수정성공");
		session.setAttribute("login", usersService.getUser(dto.getIdx()));
	}
	//개인정보 수정 end
	
	//회원탈퇴
	@GetMapping("/withdraw")
	public String withDrawal(HttpSession session) {
		UsersDTO dto = (UsersDTO)session.getAttribute("login");
		int row = usersService.withdrawal(dto.getIdx());
		System.out.println(row == 0 ? "삭제실패" : "삭제성공");
		session.setAttribute("login", null);
		return "redirect:/";
	}
	//회원탈퇴 end
	
	// 비밀번호 찾기
	@GetMapping("/findPw")
	public void moveFindPw() {
	}
	
	// 아이디 찾기
	@GetMapping("/findId")
	public void findId() {}
	
	@PostMapping("/findId")
	public ModelAndView findId(UsersDTO dto) {
		ModelAndView mav = new ModelAndView("/users/idTest");
		String id = usersService.findId(dto);
		
		mav.addObject("id", id);
		
		return mav;
	}
	//아이디 찾기 end
	
	//비밀번호 변경
	@GetMapping("/replacePw")
	public String replacePw(UsersDTO dto) {
		
	    String inputPass = dto.getPw();
	    String pwd = pwdEncoder.encode(inputPass);
	    dto.setPw(pwd);
		
		System.out.println(usersService.replacePw(dto) ==0 ? "수정성공" : "수정실패");
		return "redirect:/";
	}
	
// 02-08
	@GetMapping("/usersList")
	public ModelAndView usersList() {
		ModelAndView mav = new ModelAndView("/users/usersList");
		List<UsersDTO> list = usersService.getList();
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping("/viewDetail")
	public void viewDetail() {}
	
	// 02-08
	@GetMapping("/viewDetail/{idx}")
	public ModelAndView viewDetail(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/users/viewDetail");
		UsersDTO dto = usersService.getUser(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@GetMapping("/follow")
	public void follow() {}
	
	// 02-08
	@GetMapping("/follow/{idx}")
	public ModelAndView follow(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/users/follow");
		UsersDTO dto = usersService.getUser(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@GetMapping("/search")
	public void search() {}
	
	@PostMapping("/search")
	public ModelAndView search(String search) {
		ModelAndView mav = new ModelAndView("/users/search");
		
		if(search.contains("#") == false) {
			List<UsersDTO> list = usersService.usersSearch(search);
			mav.addObject("list", list);
		}
		else {
			
		}
		return mav;
	}
	
	@GetMapping("/getUserIDXByNickName/{nick_name}")
	@ResponseBody
	public int getUserIDXByNickName(@PathVariable("nick_name") String nick_name) {
		int idx = usersService.getUserIDXByNickName(nick_name);
		return idx;
	}
	
	@GetMapping("/infoModify_replacePw")
	public void infoReplacePw() {}
		
	@PostMapping("/infoModify_replacePw")
	public String infoReplacePwPost(HttpSession session ,String old_pw,String pw,RedirectAttributes rttr) {
		System.out.println(old_pw);
		UsersDTO users = (UsersDTO)session.getAttribute("login");
		boolean pwdMatch = false;
		pwdMatch = pwdEncoder.matches(old_pw, users.getPw());
		System.out.println(pwdMatch);
		
		if(pwdMatch == true) {
			 String pwd = pwdEncoder.encode(pw);
			 users.setPw(pwd);
			 System.out.println(usersService.replacePw(users) == 0 ? "수정실패" : "수정성공");
			 rttr.addFlashAttribute("infoModify_replacePw_msg","비밀번호가 변경되었습니다.");
			 return "redirect:/users/infoModify_replacePw";
		}else {
			rttr.addFlashAttribute("infoModify_replacePw_msg","이전 비밀번호가 틀립니다.");
			return "redirect:/users/infoModify_replacePw";
		}
	}

	@GetMapping("/recommendAll")
	public void recommendAll() {}
	
	// 사진 수정
	@PostMapping("/profileImgModify")
	@ResponseBody
	public int profileImgModify(MultipartFile profileimageFile , HttpSession session) {
		UsersDTO login = (UsersDTO)session.getAttribute("login");
		int idx = login.getIdx();
		String fileName = "userImg.jpg";
		int result = 0;
		if(profileimageFile != null && !profileimageFile.isEmpty()) {
			fileName = profileimageFile.getOriginalFilename();
			userProfile.saveProfile(profileimageFile);
		}
		result = usersService.profileImgModify(fileName, idx);
		login.setUser_img(fileName);
		session.setAttribute("login", login);
		
		return result;				
	}
}
