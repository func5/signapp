package com.example.signapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.signapp.dto.Document;
import com.example.signapp.dto.Page;
import com.example.signapp.mapper.DocMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class DocService {
	@Autowired DocMapper docMapper;
	
	public List<Document> getMyDocuments(Page page) {
		return docMapper.selectMyDocuments(page);
	}
	public List<Document> getTeamDocuments(Page page) { // 또는 부서 ID
		return docMapper.selectTeamDocuments(page);
	}
	
	public List<Document> getAllDocuments(Page page) {
		return docMapper.selectAllDocuments(page);
	}
	
	public int insertDocument(Document doc) {
		return docMapper.insertDocument(doc);
	}
	
	public Document getDocument(int docNo) {
		return docMapper.selectDocumentByNo(docNo);
	}
	
	public int updateDocument(Document doc) {
		return docMapper.updateDocument(doc);
	}
	
	public int deleteDocument(int docNo) {
		return docMapper.deleteDocument(docNo);
	}
	public int updateSignStatus(int docNo, String signStatus) {
		return docMapper.updateSignStatus(docNo, signStatus);
	}
	public List<Document> selectDocumentList(Page page) {
		return docMapper.selectDocumentList(page);
	}
	public int totalCount(Page page) {
		return docMapper.totalCount(page);
	}
}
