package com.example.signapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.signapp.dto.Emp;
import com.example.signapp.service.EmpService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class EmpController {
	@Autowired EmpService empService;
	
	// 로그인
	@GetMapping({"/", "login"})
	public String login() {
		return "login";
	}
	
    @PostMapping("/login")
    public String login(@RequestParam String empId,
                        @RequestParam String empPw,
                        HttpSession session,
                        Model model) {

        Emp loginUser = empService.login(empId);

        if (loginUser != null && loginUser.getEmpPw().equals(empPw)) {
            session.setAttribute("loginEmployee", loginUser);
            return "redirect:/docList"; // 로그인 후 문서 목록으로 이동
        } else {
            model.addAttribute("msg", "아이디 또는 비밀번호가 틀렸습니다.");
            return "login";	// 로그인 실패시
        }
    }
    
    // 회원가입
    @GetMapping("/join")
    public String join() {
        return "join";
    }

    // 회원가입 처리
    @PostMapping("/join")
    public String join(Emp emp) {
    	empService.registerEmployee(emp);
        return "redirect:/login";
    }
    
    // 로그아웃
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

}
