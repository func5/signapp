<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문서 목록</title>
</head>
<body>
    <h1>문서 목록</h1>

    <div>
        <a href="/insertDoc">+ 문서 작성</a> |
        <a href="/logout">로그아웃</a>
    </div>
    <br>

    <!-- 문서 목록 테이블 -->
    <table border="1" cellpadding="8" cellspacing="0">
        <thead>
            <tr>
                <th>문서번호</th>
                <th>제목</th>
                <th>작성일</th>
                <th>결제 상태</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="doc" items="${docList}">
                <tr>
                    <td>${doc.docNo}</td>
                    <td><a href="/docDetail?docNo=${doc.docNo}">${doc.docTitle}</a></td>
                    <td>${doc.createDate}</td>
                    <td>
        			  <c:choose>
			          <c:when test="${doc.status == 'WAIT'}">⏳ 대기 중</c:when>
			          <c:when test="${doc.status == 'APPROVED'}">✅ 승인</c:when>
			          <c:when test="${doc.status == 'REJECTED'}">❌ 반려</c:when>
			          <c:otherwise>❓알 수 없음</c:otherwise>
			        </c:choose>
			      </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
