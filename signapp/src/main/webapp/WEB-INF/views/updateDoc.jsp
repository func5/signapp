<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문서 수정</title>
    <style>
        body {
            font-family: '맑은 고딕', 'Segoe UI', sans-serif;
            background-color: #f9f9f9;
            padding: 40px;
        }

        .doc-wrapper {
            width: 800px;
            margin: auto;
            background-color: white;
            padding: 50px 60px;
            box-shadow: 0 0 15px rgba(0,0,0,0.05);
            border: 1px solid #ccc;
        }

        .doc-title {
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            border-bottom: 2px solid #000;
            padding-bottom: 12px;
            margin-bottom: 30px;
        }

        .doc-line {
            display: flex;
            margin-bottom: 18px;
        }

        .doc-line label {
            width: 100px;
            font-weight: bold;
        }

        .doc-line input[type="text"] {
            flex: 1;
            border: none;
            border-bottom: 1px solid #aaa;
            background: transparent;
            font-size: 16px;
            padding: 4px;
        }

        .doc-content {
            margin-top: 30px;
        }

        .doc-content label {
            font-weight: bold;
        }

        .doc-content textarea {
            width: 100%;
            height: 300px;
            border: 1px solid #ccc;
            padding: 15px;
            box-sizing: border-box;
            font-size: 15px;
            margin-top: 10px;
        }

        .form-controls {
            text-align: center;
            margin-top: 40px;
        }

        .form-controls button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .form-controls button:hover {
            background-color: #0056b3;
        }

        .back-link {
            text-align: center;
            margin-top: 30px;
        }

        .back-link a {
            color: #007bff;
            text-decoration: none;
        }

        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="doc-wrapper">
    <form action="/updateDoc" method="post" enctype="multipart/form-data">
        <input type="hidden" name="docNo" value="${doc.docNo}">
        <input type="hidden" name="signStatus" value="${doc.status}">

        <div class="doc-title">문서 수정</div>

        <div class="doc-line">
            <label for="title">제목</label>
            <input type="text" name="docTitle" id="title" value="${doc.docTitle}" required>
        </div>

        <div class="doc-line">
            <label for="writer">작성자</label>
            <input type="text" id="writer" value="${doc.empName}" readonly>
        </div>

        <div class="doc-content">
            <label for="content">내용</label>
            <textarea name="docContent" id="content" required>${doc.docContent}</textarea>
        </div>

        <div class="form-controls">
            <button type="submit">수정</button>
        </div>
    </form>

    <div class="back-link">
        <p><a href="/docList">← 문서 목록으로 돌아가기</a></p>
    </div>
</div>
</body>
</html>
