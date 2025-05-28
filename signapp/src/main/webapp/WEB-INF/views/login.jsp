<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
<style>
		/* 전체 배경 */
		body {
		    font-family: 'Segoe UI', sans-serif;
		    background-color: #f5f5f5;
		    margin: 0;
		    padding: 0;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    height: 100vh;
		}
		
		/* 로그인 카드 스타일 */
		.login-container {
		    background: white;
		    padding: 40px;
		    border-radius: 12px;
		    box-shadow: 0 0 20px rgba(0,0,0,0.05);
		    width: 100%;
		    max-width: 400px;
		    box-sizing: border-box;
		    text-align: left;
		}
		
		/* 제목 */
		h2 {
		    text-align: center;
		    font-size: 24px;
		    margin-bottom: 30px;
		    color: #222;
		}
		
		/* 폼 라벨 */
		label {
		    font-weight: bold;
		    font-size: 14px;
		    color: #333;
		    margin-top: 15px;
		    display: block;
		}
		
		/* 인풋박스 */
		input[type="text"],
		input[type="password"] {
		    width: 100%;
		    padding: 12px;
		    margin-top: 8px;
		    border: 1px solid #ccc;
		    border-radius: 6px;
		    font-size: 14px;
		    box-sizing: border-box;
		}
		
		/* 버튼 */
		button {
		    width: 100%;
		    padding: 12px;
		    margin-top: 25px;
		    background-color: #222;
		    color: white;
		    font-size: 16px;
		    font-weight: bold;
		    border: none;
		    border-radius: 6px;
		    cursor: pointer;
		}
		
		button:hover {
		    background-color: #444;
		}
		
		/* 메시지 */
		.msg {
		    color: red;
		    text-align: center;
		    margin-top: 10px;
		}
		
		/* 회원가입 링크 */
		.login-container .join-link {
		    text-align: center;
		    margin-top: 25px;
		    font-size: 13px;
		    color: #666;
		}
		
		.login-container .join-link a {
		    color: #222;
		    text-decoration: none;
		    font-weight: bold;
		}

</style>

</head>
<body>
<div class="login-container">
    <h2>로그인</h2>
    <form action="/login" method="post">
        <label for="empId">아이디</label>
        <input type="text" id="empId" name="empId" value="${param.empId}" required>

        <label for="empPw">비밀번호</label>
        <input type="password" id="empPw" name="empPw" required>

        <button type="submit">로그인</button>

        <div class="msg">
            <c:if test="${not empty msg}">${msg}</c:if>
        </div>

        <div class="join-link">
            계정이 없으신가요? <a href="/join">회원가입</a>
        </div>
    </form>
</div>


<script>
// 로그인 msg가 떠서 
  const url = new URL(window.location.href);
  if (url.searchParams.has("msg")) {
    url.searchParams.delete("msg");
    window.history.replaceState({}, document.title, url.pathname); // msg 지운 주소로 덮어쓰기
  }
</script>
</body>
</html>
