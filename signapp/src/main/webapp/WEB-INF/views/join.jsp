<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <title>회원가입</title>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
 <style>
	    body {
	        background-color: #f5f5f5;
	        font-family: 'Segoe UI', sans-serif;
	        margin: 0;
	        padding: 0;
	        display: flex;
	        justify-content: center;
	        align-items: center;
	        height: 100vh;
	    }
	
	    .join-card {
	        background: white;
	        padding: 40px;
	        border-radius: 12px;
	        box-shadow: 0 0 20px rgba(0,0,0,0.05);
	        width: 100%;
	        max-width: 450px;
	        box-sizing: border-box;
	    }
	
	    h3 {
	        text-align: center;
	        font-weight: bold;
	        margin-bottom: 30px;
	        color: #222;
	    }
	
	    .form-label {
	        font-weight: bold;
	        color: #333;
	    }
	
	    .btn-primary {
	        background-color: #222;
	        border: none;
	        font-weight: bold;
	    }
	
	    .btn-primary:hover {
	        background-color: #444;
	    }
	
	    .alert {
	        font-size: 14px;
	        padding: 10px;
	    }
</style>
    
</head>
<body class="bg-light">

<div class="join-card">
    <h3 class="mb-4">회원가입</h3>
    
    <%-- 메세지 출력 --%>
    <c:if test="${msg != null}">
        <div class="alert alert-danger text-center">${msg}</div>
    </c:if>

    <form action="/join" method="post">
        <div class="mb-3">
            <label for="empId" class="form-label">아이디</label>
            <input type="text" name="empId" id="empId" class="form-control" required>
        </div>

        <div class="mb-3">
            <label for="empName" class="form-label">이름</label>
            <input type="text" name="empName" id="empName" class="form-control" required>
        </div>
        
        <div class="mb-3">
            <label for="empPw" class="form-label">비밀번호</label>
            <input type="password" name="empPw" id="empPw" class="form-control" required>
        </div>

        <div class="mb-3">
		    <label for="dept" class="form-label">부서</label>
		    <select name="dept" id="dept" class="form-select" required>
		        <option value="">-- 선택하세요 --</option>
		        <option value="인사팀">인사팀</option>
		        <option value="총무팀">총무팀</option>
		        <option value="영업팀">영업팀</option>
		        <option value="개발팀">개발팀</option>
		        <option value="경원지원팀">경영지원</option>
		        <option value="경영전략">경영전략</option>
		    </select>
		</div>
		
        <div class="mb-3">
            <label for="empLevel" class="form-label">직급</label>
            <select name="empLevel" id="empLevel" class="form-select" required>
            	<option value="">-- 선택하세요 --</option>
                <option value="1">1 - 사원</option>
                <option value="2">2 - 팀장</option>
                <option value="3">3 - 대표</option>
            </select>
        </div>

        <div class="d-grid">
            <button type="submit" class="btn btn-primary">가입하기</button>
        </div>
    </form>
</div>
	<script>
	  const urlParams = new URLSearchParams(window.location.search);
	  const msg = urlParams.get("msg");
	
	  if (msg === "ok") {
	    alert("회원가입이 완료되었습니다. 로그인해주세요.");
	    window.location.href = "/login";
	  }
	</script>

</body>
</html>
