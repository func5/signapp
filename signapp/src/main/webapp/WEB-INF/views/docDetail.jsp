<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문서 상세보기</title>
</head>
<body>

<h1>📄 문서 상세</h1>
<hr>

<p><strong>문서번호:</strong> ${doc.docNo}</p>
<p><strong>제목:</strong> ${doc.docTitle}</p>
<p><strong>작성일:</strong> ${doc.createDate}</p>
<p><strong>내용:</strong> ${doc.docContent}</p>
<p><strong>결재 상태:</strong> 
    <c:choose>
        <c:when test="${doc.status == 'WAIT'}">⏳ 대기 중</c:when>
        <c:when test="${doc.status == 'APPROVED'}">✅ 승인</c:when>
        <c:when test="${doc.status == 'REJECTED'}">❌ 반려</c:when>
    </c:choose>
</p>

<hr>

<%-- 로그인 사용자 정보 가져오기 --%>
<c:set var="myEmpId" value="${loginEmployee.empId}" />
<c:set var="myLevel" value="${loginEmployee.empLevel}" />

<%-- 삭제/수정 버튼: 작성자 본인만 --%>
<c:if test="${myEmpId == doc.empId}">
    <form action="/deleteDoc" method="post" style="display:inline;">
        <input type="hidden" name="docNo" value="${doc.docNo}" />
        <button type="submit" class="btn">🗑️ 삭제</button>
    </form>

    <form action="/updateDoc" method="get" style="display:inline;">
        <input type="hidden" name="docNo" value="${doc.docNo}" />
        <button type="submit" class="btn">✏️ 수정하기</button>
    </form>
</c:if>

<%-- 결재 버튼: 팀장/관리자만 --%>
<c:if test="${myLevel == 2}">
    <form action="/signDoc" method="post">
        <input type="hidden" name="docNo" value="${doc.docNo}" />
        <input type="hidden" name="signStatus" value="APPROVED" />
        <button type="submit">✅ 팀장 결재</button>
    </form>
    <form action="/signDoc" method="post" style="margin-top:5px;">
        <input type="hidden" name="docNo" value="${doc.docNo}" />
        <input type="hidden" name="signStatus" value="REJECTED" />
        <button type="submit">❌ 반려</button>
    </form>
</c:if>

<c:if test="${myLevel == 3 and teamSignDone == true}">
    <a href="/adminSignForm?docNo=${doc.docNo}" class="btn btn-outline-primary">
        ✅ 관리자 결재하러 가기
    </a>
</c:if>

<br>
<a href="/docList">← 목록으로</a>

</body>
</html>
