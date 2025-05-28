package com.example.signapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.signapp.dto.Document;
import com.example.signapp.dto.Page;

@Mapper
public interface DocMapper {
    // 사원 본인 문서
    List<Document> selectMyDocuments(Page page);

    // 팀장의 경우 같은 부서 문서
    List<Document> selectTeamDocuments(Page page);

    // 관리자 전체 문서
    List<Document> selectAllDocuments(Page page);
    
    int insertDocument(Document doc);
    
    Document selectDocumentByNo(int docNo);
    
    // 본인 문서 수정
 	int updateDocument(Document doc);

 	// 본인 문서 삭제
 	int deleteDocument(int docNo);
 	
 	// 결제 상태 업데이트(반려까지만)
	int updateSignStatus(int docNo, String signStatus);
	
	/** 문서 리스트 **/
	List<Document> selectDocumentList(Page page);
	
	/** 검색 **/
	int totalCount(Page page);

}
