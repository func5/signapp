package com.example.signapp.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.signapp.dto.Sign;

@Mapper
public interface SignMapper {
	int insertSign(Sign sign);
	
	Sign getSign(int docNo, int empLevel);
}
