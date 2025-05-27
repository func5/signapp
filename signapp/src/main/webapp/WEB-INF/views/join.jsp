<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container mt-5" style="max-width: 500px;">
    <h3 class="mb-4 text-center">회원가입</h3>
    
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
		    <input type="text" name="dept" id="dept" class="form-control" required />
		</div>
		
        <div class="mb-3">
            <label for="empLevel" class="form-label">레벨 선택</label>
            <select name="empLevel" id="empLevel" class="form-select" required>
                <option value="1">1 - 일반 사원</option>
                <option value="2">2 - 팀장급</option>
                <option value="3">3 - 관리자</option>
            </select>
        </div>

        <div class="d-grid">
            <button type="submit" class="btn btn-primary">가입하기</button>
        </div>
    </form>
</div>

</body>
</html>
