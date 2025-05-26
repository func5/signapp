package com.example.signapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class EmpController {
	
	@GetMapping("/")
	public String login() {
		return "login";
	}
}
