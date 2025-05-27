package com.example.signapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.signapp.dto.Document;
import com.example.signapp.mapper.DocMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class DocService {
	@Autowired DocMapper docMapper;
	
	public List<Document> getMyDocuments(String empId) {
		return docMapper.selectMyDocuments(empId);
	}
	public List<Document> getTeamDocuments(String empId) { // 또는 부서 ID
		return docMapper.selectTeamDocuments(empId);
	}
	
	public List<Document> getAllDocuments() {
		return docMapper.selectAllDocuments();
	}
	
	public int insertDocument(Document doc) {
		return docMapper.insertDocument(doc);
	}
	
	public Document getDocument(int docNo) {
		return docMapper.selectDocumentByNo(docNo);
	}
}
