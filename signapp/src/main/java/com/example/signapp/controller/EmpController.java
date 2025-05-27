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
	
	// 로그인 + 필터 메세지
	@GetMapping({"/", "/login"})
	public String login(@RequestParam(required = false) String msg, Model model) {
	    if ("needLogin".equals(msg)) {
	        model.addAttribute("msg", "로그인이 필요합니다.");
	    }
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

    // 회원가입 처리 ( 중복방지 수정)
    @PostMapping("/join")
    public String join(Emp emp, Model model) {
    // ID 중복검사
    	if(empService.isDuplicateId(emp.getEmpId())) {
    		model.addAttribute("msg", "이미 존재하는 아이디입니다.");
    			return "join";
    }
    // 비밀번호 유효성 검사
    	if(emp.getEmpPw() == null || emp.getEmpPw().length() < 4) {
    		model.addAttribute("msg","비밀번호는 4자 이상이어야합니다.");
    		return"join";
    	}
    // 통과했으면 로그인 ㄱ	
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
