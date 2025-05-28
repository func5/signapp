package com.example.signapp.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.signapp.dto.Sign;
import com.example.signapp.service.DocService;
import com.example.signapp.service.SignService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class SignRest {
	
	@Autowired SignService signService;
	@Autowired DocService docService;
	
	@ResponseBody
	@PostMapping("/addSign")
	public String addSign(Sign signForm) {
		boolean isSuccess = signService.addSign(signForm);
		// DB 저장 service - mapper
		if(!isSuccess) {
			return "결제 실패";
		}
		
		Sign sign = signService.getSign(signForm.getDocNo(), 3);
		if (sign != null) { // level3 서명 완료
			docService.updateSignStatus(sign.getDocNo(), "APPROVED");
		}
		
		return "결제 완료";
	}
}