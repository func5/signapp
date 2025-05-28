<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f9f9f9;
        }

        /* === 사이드바 === */
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            width: 220px;
            height: 100vh;
            background: linear-gradient(180deg, #3e3e3e, #2c2c2c);
            color: white;
            padding: 20px;
            box-sizing: border-box;
        }

        .sidebar .logo {
            font-weight: bold;
            font-size: 18px;
            margin-bottom: 30px;
        }

        .sidebar .small {
            font-size: 13px;
            opacity: 0.7;
        }

        .nav-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .nav-list li {
            margin-bottom: 18px;
        }

        .nav-list a {
            color: white;
            text-decoration: none;
            font-size: 15px;
            display: flex;
            align-items: center;
            padding: 8px 12px;
            border-radius: 6px;
            transition: background-color 0.2s ease;
        }

        .nav-list a span {
            margin-right: 10px;
            font-size: 16px;
        }

        .nav-list a:hover {
            background-color: rgba(255, 255, 255, 0.15);
        }

        /* === 콘텐츠 영역 === */
        .main {
            margin-left: 240px;
            padding: 30px;
        }

        h1 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #222;
        }

        .top-buttons {
            margin-bottom: 20px;
        }

        .btn-blue {
            display: inline-block;
            background-color: #007bff;
            color: white;
            padding: 8px 16px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            margin-right: 10px;
        }

        .btn-blue:hover {
            background-color: #0056b3;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.05);
            border-radius: 10px;
            overflow: hidden;
        }

        th {
            background-color: #f0f0f0;
            text-align: left;
            padding: 12px;
            font-weight: bold;
            border-bottom: 1px solid #ddd;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #eee;
        }

        td a {
            text-decoration: none;
            color: #007bff;
        }

        td a:hover {
            text-decoration: underline;
        }

        .status-badge {
            font-weight: bold;
            padding: 4px 8px;
            border-radius: 6px;
            font-size: 12px;
            display: inline-block;
        }

        .status-WAIT {
            background-color: #fff3cd;
            color: #856404;
        }

        .status-APPROVED {
            background-color: #d4edda;
            color: #155724;
        }

        .status-REJECTED {
            background-color: #f8d7da;
            color: #721c24;
        }

        form {
            margin-top: 20px;
        }

        form select, form input[type="text"] {
            padding: 6px 10px;
            font-size: 14px;
            margin-right: 8px;
        }

        form button {
            padding: 6px 14px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        form button:hover {
            background-color: #0056b3;
        }

        a.page-link {
            margin: 0 4px;
            text-decoration: none;
            color: #333;
        }

        a.page-link:hover {
            text-decoration: underline;
            color: #007bff;
        }
        .modal {
		    display: none;
		    position: fixed;
		    z-index: 1000;
		    left: 0; top: 0;
		    width: 100%; height: 100%;
		    background-color: rgba(0, 0, 0, 0.5);
		}
		
		.modal-content {
		    background-color: white;
		    margin: 10% auto;
		    padding: 20px;
		    border-radius: 10px;
		    width: 400px;
		    box-shadow: 0 0 10px rgba(0,0,0,0.3);
		    text-align: center;
		}
		
		.close-btn {
		    float: right;
		    font-size: 22px;
		    font-weight: bold;
		    cursor: pointer;
		}
		.user-info-box {
		  margin: 16px 0 24px;
		  padding: 12px 16px;
		  background-color: rgba(255, 255, 255, 0.05);
		  border-radius: 8px;
		  color: #f0f0f0;
		  font-size: 14px;
		  line-height: 1.5;
		}
		
		.user-info-box .greeting {
		  font-size: 13px;
		  opacity: 0.8;
		  margin-bottom: 4px;
		  color: #ddd;
		}
		
		.user-info-box .user-detail .icon {
		  margin-right: 4px;
		}
		
		.user-info-box .rank {
		  font-weight: bold;
		  color: #fdd835;
		  margin-left: 6px;
		}
    </style>
    <meta charset="UTF-8">
    <title>문서 목록</title>
</head>
<body>
<!-- 사이드바 -->
	<div class="sidebar">
	  <div class="logo">구디아카데미 <span class="small"></span></div> 
	    
	    <div class="user-info-box">
		  <div class="greeting">
		    <c:choose>
		      <c:when test="${loginEmployee.empLevel == 3}">어서오십시오 🙇</c:when>
		      <c:otherwise>반갑습니다 👋</c:otherwise>
		    </c:choose>
		  </div>
		  <div class="user-detail">
		    <span class="icon">
			  <c:choose>
			    <c:when test="${loginEmployee.empLevel == 1}">🧑‍💼</c:when>
			    <c:when test="${loginEmployee.empLevel == 2}">👨‍💼</c:when>
			    <c:when test="${loginEmployee.empLevel == 3}">👑</c:when>
			  </c:choose>
			</span>
			${loginEmployee.empName}
		    <span class="rank">
		      <c:choose>
		        <c:when test="${loginEmployee.empLevel == 1}">사원님</c:when>
		        <c:when test="${loginEmployee.empLevel == 2}">팀장님</c:when>
		        <c:when test="${loginEmployee.empLevel == 3}">대표님</c:when>
		      </c:choose>
		    </span>
		  </div>
		</div>
	  <ul class="nav-list">
	    <li><a href="/docList"><span>🏠</span> HOME</a></li>
	    <li><a href="#"><span>👤</span> 내 인사정보</a></li>
	    <li><a href="/insertDoc"><span>💰</span> 문서작성</a></li> 
	    <li><a href="#" id="openSearchModal"><span>📋</span> 검색</a></li>
	    <li><a href="/logout"><span>📝</span> 로그아웃</a></li> 
	  </ul>
	</div>
    <!-- 본문 콘텐츠 시작 -->
	<div class="main">

    <br>

    <!-- 문서 목록 테이블 -->
    <table border="1" cellpadding="8" cellspacing="0">
        <thead>
            <tr>
                <th>문서번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>결제 상태</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="doc" items="${docList}">
                <tr>
                    <td>${doc.docNo}</td>
                    <td><a href="/docDetail?docNo=${doc.docNo}">${doc.docTitle}</a></td>
                    <td>${doc.empName}</td>
                    <td>${doc.createDate}</td>
                    <td>
					  <span class="status-badge status-${doc.status}">
					      <c:choose>
					          <c:when test="${doc.status == 'WAIT'}">대기 중</c:when>
					          <c:when test="${doc.status == 'APPROVED'}">승인</c:when>
					          <c:when test="${doc.status == 'REJECTED'}">반려</c:when>
					          <c:otherwise>알 수 없음</c:otherwise>
					      </c:choose>
					  </span>
					</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    
    <div class="usage-bar">
  <div class="usage-icon">
    <span style="margin-right: 6px;">☁️</span> 저장용량
  </div>
  <div class="usage-progress">
    <div class="progress-bar" style="width: 8.4%;"></div>
  </div>
  <div class="usage-text">15GB 중 1.26GB 사용</div>
  <button class="purchase-btn">추가 저장용량 구매</button>
</div>

<style>
.usage-bar {
  margin-top: 400px;
  padding: 20px;
  background: #fff;
  border: 1px solid #ddd;
  border-radius: 12px;
  max-width: 700px;
  box-shadow: 0 0 10px rgba(0,0,0,0.05);
  text-align: center;
  margin-left: auto;
  margin-right: auto;
}

.usage-icon {
  font-weight: bold;
  font-size: 16px;
  margin-bottom: 10px;
}

.usage-progress {
  height: 8px;
  background-color: #eee;
  border-radius: 10px;
  overflow: hidden;
  margin: 10px 0;
}

.progress-bar {
  height: 100%;
  background-color: #3b82f6;
}

.usage-text {
  font-size: 14px;
  color: #666;
  margin-bottom: 12px;
}

.purchase-btn {
  padding: 6px 14px;
  font-size: 14px;
  border: 1px solid #bbb;
  border-radius: 20px;
  background-color: #f8f9fa;
  cursor: pointer;
}

.purchase-btn:hover {
  background-color: #e2e6ea;
}
</style>
    
    <!-- 검색 모달 -->
	<div id="searchModal" class="modal">
	  <div class="modal-content">
	    <span class="close-btn">&times;</span>
	    <h3>🔍 문서 검색</h3>
	    <form method="get" action="/docList">
	        <select name="searchType">
	            <option value="title">제목</option>
	            <option value="name">작성자</option>
	        </select>
	        <input type="text" name="searchWord" placeholder="검색어를 입력하세요" />
	        <button type="submit">검색</button>
	    </form>
	  </div>
</div>

<script>
// 검색창 팝업 열고 닫기 기능 추가
  // HTML 문서가 완전히 로드되면 실행
  document.addEventListener("DOMContentLoaded", () => {
    
    // 검색 모달 요소 가져오기
    const modal = document.getElementById('searchModal');
    
    // 사이드바 "검색" 메뉴 요소 가져오기
    const openBtn = document.getElementById('openSearchModal');
    
    // 모달 안의 닫기 버튼(X) 요소 가져오기
    const closeBtn = document.querySelector('.close-btn');

    // "검색" 메뉴 클릭 시 → 모달 표시
    openBtn.addEventListener('click', (e) => {
      e.preventDefault(); // a 태그 기본 이동 막기
      modal.style.display = 'block'; // 모달 보이기
    });

    // 닫기 버튼 클릭 시 → 모달 숨기기
    closeBtn.addEventListener('click', () => {
      modal.style.display = 'none';
    });

    // 모달 바깥 영역 클릭 시 → 모달 숨기기
    window.addEventListener('click', (e) => {
      if (e.target === modal) {
        modal.style.display = 'none';
      }
    });

  });
</script>

</body>
</html>
