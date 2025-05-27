package com.example.signapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.signapp.dto.Document;

@Mapper
public interface DocMapper {
    // 사원 본인 문서
    List<Document> selectMyDocuments(String empId);

    // 팀장의 경우 같은 부서 문서
    List<Document> selectTeamDocuments(String empId);

    // 관리자 전체 문서
    List<Document> selectAllDocuments();
    
    int insertDocument(Document doc);
    
    Document selectDocumentByNo(int docNo);
    
    // 본인 문서 수정
 	int updateDocument(Document doc);

 	// 본인 문서 삭제
 	int deleteDocument(int docNo);
 	
 	// 결제 상태 업데이트(반려까지만)
	int updateSignStatus(int docNo, String signStatus);

}
