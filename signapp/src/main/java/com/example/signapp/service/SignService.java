package com.example.signapp.service;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.signapp.dto.Sign;
import com.example.signapp.mapper.SignMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class SignService {
	
	@Autowired SignMapper signMapper;
	
	public Sign getSign(int docNo, int empLevel) {
		return signMapper.getSign(docNo,empLevel);
	}
	
	public boolean addSign(Sign signForm) {
		// 0) signImg 파일이름을 생성
		String ext = ".png";	// data : image/png;Base64,xxxxxx...
		String fileName = UUID.randomUUID().toString().replace("-","")+ext;
		
		// 1) mapper 호출
		
		// 2) 이미지를 디코딩해서 원하는 위치에 저장
		FileOutputStream fos = null;
		try {
			fos = new FileOutputStream("c:\\sign_img\\"+fileName);
			// 파일을 만들 수 있는 비어있는 OutputStream에 sign_img안에 이미지문자를 디코딩
			String signImg = signForm.getSignName().split(",")[1];
			fos.write(Base64.getDecoder().decode(signImg));	// signImg ,뒤부터가 이미지 문자

			signForm.setSignName(signImg); // signName은 실제 이미지 파일명
			
		} catch (FileNotFoundException e) {
			log.error("파일생성 실패해서 롤백 합니다.");
			throw new RuntimeException();	// class SignException extends RuntimeException
		} catch (IOException e) {
			log.error("파일 디코딩 실패해서 롤백 합니다.");
			throw new RuntimeException();	// class SignException extends RuntimeException
		} finally {
			try {
				fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		// 3) DB에 저장
		int row = signMapper.insertSign(signForm);
		if(row != 1) {
			log.error("DB 저장 이상 발생 롤백 합니다.");
			throw new RuntimeException();	// class SignException extends RuntimeException
		}
		
		return true;
	}
	
	
}
