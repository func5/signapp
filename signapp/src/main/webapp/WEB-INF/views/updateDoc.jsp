<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문서 수정</title>
</head>
<body>
    <h2>문서 수정</h2>

	<form action="/updateDoc" method="post" enctype="multipart/form-data">
		<input type="hidden" name="docNo" value="${doc.docNo}">
		<input type="hidden" name="signStatus" value="${doc.status}">
	    <label>제목: <input type="text" name="docTitle" value="${doc.docTitle}" required></label><br><br>
	    <label>내용: <br>
	        <textarea name="docContent" rows="10" cols="60" required>${doc.docContent}</textarea>
	    </label><br><br>
	    <button type="submit">수정</button>
	</form>

    <p><a href="/docList">문서 목록으로 돌아가기</a></p>
</body>
</html>
