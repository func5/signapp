<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f4f4;
            padding: 60px;
        }
        .login-container {
            width: 350px;
            margin: auto;
            padding: 30px;
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
        }
        label {
            display: block;
            margin-top: 15px;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        button {
            width: 100%;
            padding: 10px;
            margin-top: 20px;
            background-color: #1976d2;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
        .msg {
            color: red;
            margin-top: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h2>로그인</h2>
    
    <form action="/login" method="post">
        <label for="empId">ID</label>
        <input type="text" id="empId" name="empId" value="${param.empId }" required>

        <label for="empPw">비밀번호</label>
        <input type="password" id="empPw" name="empPw" required>

        <button type="submit">로그인</button>

        <div class="msg">
            <c:if test="${not empty msg}">
                ${msg}
            </c:if>
        </div>
        
      <div style="text-align: center; margin-top: 15px;">
    	<a href="/join">회원가입</a>
</div>
    </form>
</div>
</body>
</html>
