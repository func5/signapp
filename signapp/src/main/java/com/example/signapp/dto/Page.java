package com.example.signapp.dto;

import lombok.Data;

@Data
public class Page {
	private int rowPerPage;
	private int currentPage;
	private int beginRow;
	private int totalCount;
	private String searchWord; // 검색어
	private String searchType; // 검색타입
	private String empId;
	private String searchName; // 검색할 name
	
	public Page(int rowPerPage, int currentPage, int totalCount, String searchWord, String searchType, String empId) {
		this.rowPerPage = rowPerPage;
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.searchWord= searchWord;
		this.searchType = searchType;
		this.beginRow = (currentPage - 1) * rowPerPage;
		this.empId = empId;
		
		if("name".equals(searchType)) {
			this.searchName = searchWord;
		}
	}
	
	public int getLastPage() {
		int lastPage = this.totalCount / this.rowPerPage;
		if(this.totalCount % this.rowPerPage != 0) {
			lastPage += 1;
		}
		return lastPage;
	}
}
