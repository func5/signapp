package com.example.signapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.signapp.dto.Document;
import com.example.signapp.dto.Emp;
import com.example.signapp.dto.Sign;
import com.example.signapp.service.DocService;
import com.example.signapp.service.SignService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class DocController {
	@Autowired DocService docService;
	@Autowired SignService signService; // 윤성권 추가
	
    // 리스트
    @GetMapping("/docList")
    public String docList(HttpSession session, Model model) {
    	// 로그인 사용자 정보 세션에서 꺼내고
        Emp loginEmp = (Emp) session.getAttribute("loginEmployee");
       
        // 로그인한 사용자의 레벨과 아이디 
        int empLevel = loginEmp.getEmpLevel();
        String empId = loginEmp.getEmpId();

        List<Document> docList = null;
        // 사원 : 내가 작성한 문서만
        if (empLevel == 1) {
            docList = docService.getMyDocuments(empId);
        // 팀장 : 같은부서 와 사원들 문서
        } else if (empLevel == 2) {
            docList = docService.getTeamDocuments(empId);
        // 관리자 : 전부 다 조회    
        } else if (empLevel == 3) {
            docList = docService.getAllDocuments();
        }

        //log.info(docList.toString());
        model.addAttribute("docList", docList);
        return "docList";
    }
    
    // 문서 등록 
    @GetMapping("/insertDoc")
    public String insertDoc(HttpSession session) {
    	return "insertDoc";
    }
    
    @PostMapping("/insertDoc")
    public String insertDoc(@RequestParam String title,
                            @RequestParam String content,
                            HttpSession session) throws Exception {
        Emp loginEmployee = (Emp) session.getAttribute("loginEmployee");

        if (loginEmployee.getEmpLevel() != 1) {
            return "redirect:/login"; // 레벨 1만 등록 가능
        }

        // 문서 생성
        Document doc = new Document();
        doc.setEmpId(loginEmployee.getEmpId());
        doc.setDocTitle(title);
        doc.setDocContent(content);
        doc.setStatus("WAIT");

        docService.insertDocument(doc);

        return "redirect:/docList";
    }
    
    // 상세보기
    @GetMapping("/docDetail")
    public String docDetail(@RequestParam int docNo, HttpSession session, Model model) {
        Emp loginEmp = (Emp) session.getAttribute("loginEmployee");

        Document doc = docService.getDocument(docNo);
        // 사원이면서 본인 문서가 아니면 접근 제한
        if (loginEmp.getEmpLevel() == 1 && !loginEmp.getEmpId().equals(doc.getEmpId())) {
            return "redirect:/docList";
        }

        Sign signLv2 = signService.getSign(docNo,2);	// 윤성권 추가
        Sign signLv3 = signService.getSign(docNo,3);	// 윤성권 추가
        
        model.addAttribute("signLv2",signLv2);
        model.addAttribute("signLv3",signLv3);
        
        model.addAttribute("doc", doc);
        return "docDetail"; // ← 요기 이름!
    }
}
