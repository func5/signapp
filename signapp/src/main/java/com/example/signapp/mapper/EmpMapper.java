package com.example.signapp.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.signapp.dto.Emp;

@Mapper
public interface EmpMapper {
	// 로그인용
	Emp selectEmployeeById(String empId);
	// 회원가입
	int insertEmployee(Emp emp); 
}
