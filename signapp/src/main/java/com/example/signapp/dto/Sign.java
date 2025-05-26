package com.example.signapp.dto;

import lombok.Data;

@Data
public class Sign {
	private int signNo;
	private int docNo;
	private String empId;
	private String createDate;
	private String signName;
}
