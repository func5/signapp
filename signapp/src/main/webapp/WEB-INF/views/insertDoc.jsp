<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공문서 작성</title>
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

        .sign-area {
            margin-top: 60px;
            display: flex;
            justify-content: space-around;
        }

        .sign-box {
            text-align: center;
        }

        .sign-box label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
        }

        .sign-line {
            width: 180px;
            height: 40px;
            border-bottom: 1px solid #000;
            margin: 0 auto;
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
    </style>
</head>
<body>
<div class="doc-wrapper">
    <form action="/insertDoc" method="post" enctype="multipart/form-data">
        <div class="doc-title">문서 작성</div>

        <div class="doc-line">
            <label for="title">제목</label>
            <input type="text" name="title" id="title" required>
        </div>

        <div class="doc-line">
            <label for="writer">작성자</label>
            <input type="text" name="writer" id="writer" required>
        </div>

        <div class="doc-content">
            <label for="content">내용</label>
            <textarea name="content" id="content" required></textarea>
        </div>

        <div class="sign-area">
            <div class="sign-box">
                <label>결재자 1 서명</label>
                <div class="sign-line"></div>
            </div>
            <div class="sign-box">
                <label>결재자 2 서명</label>
                <div class="sign-line"></div>
            </div>
        </div>

        <div class="form-controls">
            <button type="submit">등록</button>
        </div>
    </form>
</div>
</body>
</html>


    <div class="back-link">
        <p><a href="/docList">← 문서 목록으로 돌아가기</a></p>
    </div>

</body>
</html>
