package com.example.signapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.example.signapp.SignappApplication;
import com.example.signapp.dto.Document;
import com.example.signapp.dto.Page;
import com.example.signapp.mapper.DocMapper;
import com.example.signapp.mapper.SignMapper;

import lombok.extern.slf4j.Slf4j;

@Transactional
@Service
@Slf4j
public class DocService {

	@Autowired DocMapper docMapper;
	@Autowired SignMapper signMapper;

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
		int row =  docMapper.updateSignStatus(docNo, signStatus);
		
		// 반려일 때만 사인 삭제
		if (row > 0 && "REJECTED".equals(signStatus)) {
			signMapper.deleteSign(docNo);
		}
		return row;
	}
	
	public List<Document> selectDocumentList(Page page) {
		return docMapper.selectDocumentList(page);
	}
	
	public int totalCount(Page page) {
		return docMapper.totalCount(page);
	}
}
