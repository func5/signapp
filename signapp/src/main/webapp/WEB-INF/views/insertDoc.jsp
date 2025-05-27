<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문서 등록</title>
</head>
<body>
    <h2>문서 작성</h2>

	<form action="/insertDoc" method="post" enctype="multipart/form-data">
	    <label>제목: <input type="text" name="title" required></label><br><br>
	    <label>내용: <br>
	        <textarea name="content" rows="10" cols="60" required></textarea>
	    </label><br><br>
	    <button type="submit">등록</button>
	</form>

    <p><a href="/docList">문서 목록으로 돌아가기</a></p>
</body>
</html>
