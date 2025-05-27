package com.example.signapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.signapp.dto.Emp;
import com.example.signapp.mapper.EmpMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class EmpService {
	@Autowired EmpMapper empMapper;
	
	// 로그인
	public Emp login(String empId) {
		log.debug("로그인 요청 - ID: {}", empId);
			return empMapper.selectEmployeeById(empId);
	}
	
	// 회원가입
	public int registerEmployee(Emp emp) {
		log.debug("회원가입 요청 : {}", emp);
			return empMapper.insertEmployee(emp);
	}
	
	// 중복검사
	public boolean isDuplicateId(String empId) {
		return empMapper.selectEmployeeById(empId) != null;
	}
}
