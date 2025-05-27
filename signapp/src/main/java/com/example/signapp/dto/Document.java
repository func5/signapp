package com.example.signapp.dto;

import lombok.Data;

@Data
public class Document {
	private int docNo;
	private String empId;
	private String docTitle;
	private String docContent;
	private String createDate;
	private String status;		// 대기, 반려, 결제
	private String empName;
}
