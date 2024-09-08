package kr.ac.hansung.cse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

	@RequestMapping("/login") // 로그인페이지로 이동한다.
	public String showLogin( @RequestParam(value="error", required=false) String error, 
							@RequestParam(value="logout", required=false) String logout,
							Model model ) {
		
		if(error != null) { // login?error로 이동한다.
			model.addAttribute("errorMsg", "사용자이름과 비밀번호가 유효하지 않습니다");
		}
		
		if(logout != null) { // login?logout로 이동한다.
			model.addAttribute("logoutMsg", "성공적으로 로그아웃 되었습니다");
		}
		
		return "login";
	}
}
