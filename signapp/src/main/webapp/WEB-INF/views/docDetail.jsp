<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문서 상세보기</title>
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
            margin-bottom: 12px;
        }

        .doc-line label {
            display: inline-block;
            width: 100px;
            font-weight: bold;
        }

        .doc-line input,
        .doc-line textarea {
            font-size: 16px;
            border: none;
            border-bottom: 1px solid #aaa;
            background: transparent;
            padding: 4px;
            width: 100%;
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

        a {
            font-size: 16px;
            margin-left: 20px;
        }
        .sign-area {
    margin-top: 40px;
    display: flex;
    justify-content: space-around;
    gap: 20px;
}

.sign-box {
    text-align: center;
    padding: 20px;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0,0,0,0.05);
    width: 250px;
}

.sign-box label {
    display: block;
    font-weight: bold;
    margin-bottom: 10px;
    font-size: 16px;
}

.sign-box canvas {
    border: 1px solid #333;
    width: 240px;
    height: 100px;
    margin-bottom: 12px;
    border-radius: 6px;
}

.sign-box button {
    margin: 3px 4px;
    padding: 6px 12px;
    font-size: 14px;
    border: none;
    border-radius: 6px;
    background-color: #e4e4e4;
    cursor: pointer;
    transition: 0.2s ease;
}

.sign-box button:hover {
    background-color: #d0d0d0;
}

/* 버튼별 색상 커스터마이징 */
.sign-box button#btnClear {
    background-color: #f8f9fa;
    border: 1px solid #ccc;
}

.sign-box button#btnClear:hover {
    background-color: #e2e6ea;
}

.sign-box button#btnSign {
    background-color: #28a745;
    color: white;
}

.sign-box button#btnSign:hover {
    background-color: #218838;
}

.sign-box form:last-of-type button {
    background-color: #dc3545;
    color: white;
}

.sign-box form:last-of-type button:hover {
    background-color: #c82333;
}
.sign-box form {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 8px;
    margin-top: 10px;
}

/* 공통 버튼 스타일 */
.sign-box button {
    width: 160px;
    padding: 8px 14px;
    font-size: 14px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    transition: 0.2s ease;
}

/* 결재 버튼 (첫 번째 버튼) */
.sign-box button#btnSign {
    background-color: #28a745;
    color: white;
}
.sign-box button#btnSign:hover {
    background-color: #218838;
}

/* 지우기 버튼 (두 번째 버튼) */
.sign-box button#btnClear {
    background-color: #f8f9fa;
    border: 1px solid #ccc;
    color: #333;
}
.sign-box button#btnClear:hover {
    background-color: #e2e6ea;
}

/* 반려 버튼 (두 번째 form) */
.sign-box form:last-of-type button {
    background-color: #dc3545;
    color: white;
}
.sign-box form:last-of-type button:hover {
    background-color: #c82333;
}

        
    </style>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/signature_pad@4.1.7/dist/signature_pad.umd.min.js"></script>
    <script>
        $(document).ready(function () {
            const canvas = document.querySelector("canvas");
            if (canvas) {
                const signaturePad = new SignaturePad(canvas, {
                    minWidth: 1,
                    maxWidth: 1,
                    penColor: "rgb(0, 0, 0)"
                });

                $('#btnClear').click(function () {
                    signaturePad.clear();
                });

                $('#btnSign').click(function () {
                    if (signaturePad.isEmpty()) {
                        alert('사인 해주세요.');
                        return;
                    }

                    $.ajax({
                        async: true,
                        url: '/addSign',
                        type: 'post',
                        data: {
                            empId: $('#empId').val(),
                            docNo: $('input[name="docNo"]').val(),
                            signName: signaturePad.toDataURL()
                        }
                    }).done(function (data) {
                        alert(data);
                        location.href = '/docDetail?docNo=' + ${doc.docNo};
                    }).fail(function () {
                        alert('결제 실패');
                    });
                });
            }
        });
    </script>
</head>
<body>

<c:if test="${not empty alertMsg}">
	<script>
		alert("${alertMsg}");
	</script>
</c:if>

<div class="doc-wrapper">
    <div class="doc-title">📄 문서 상세</div>

    <div class="doc-line">
        <label>문서번호</label>
        <input type="text" value="${doc.docNo}" readonly>
    </div>
    <div class="doc-line">
        <label>제목</label>
        <input type="text" value="${doc.docTitle}" readonly>
    </div>
    <div class="doc-line">
        <label>작성일</label>
        <input type="text" value="${doc.createDate}" readonly>
    </div>
    <div class="doc-line">
        <label>작성자</label>
        <input type="text" value="${doc.empName}" readonly>
    </div>
    <div class="doc-line">
        <label>내용</label>
        <textarea readonly>${doc.docContent}</textarea>
    </div>
    <div class="doc-line">
        <label>결재 상태</label>
        <span style="line-height: 2;">
            <c:choose>
                <c:when test="${doc.status == 'WAIT'}">⏳ 대기 중</c:when>
                <c:when test="${doc.status == 'APPROVED'}">✅ 승인</c:when>
                <c:when test="${doc.status == 'REJECTED'}">❌ 반려</c:when>
            </c:choose>
        </span>
    </div>

    <hr>

    <%-- 로그인 사용자 정보 가져오기 --%>
    <c:set var="myEmpId" value="${loginEmployee.empId}" />
    <c:set var="myLevel" value="${loginEmployee.empLevel}" />

    <%-- 삭제/수정 버튼: 작성자 본인만 --%>
    <div class="form-controls">
        <c:if test="${myEmpId == doc.empId}">
            <form action="/deleteDoc" method="post" style="display:inline;" onsubmit="return confirm('정말 삭제하시겠습니까?');">
                <input type="hidden" name="docNo" value="${doc.docNo}" />
                <button type="submit" class="btn">🗑️ 삭제</button>
            </form>

            <form action="/updateDoc" method="get" style="display:inline;">
		    <input type="hidden" name="docNo" value="${doc.docNo}" />
		    <button type="submit" class="btn">✏️ 수정</button>
		</form>
        </c:if>
    </div>

    <div class="sign-area">
        <!-- LV2 -->
        <div class="sign-box">
            <label>서명</label>
            <c:if test="${not empty signLv2 and doc.status ne 'REJECTED'}">
                <p>${signLv2.empName}</p>
                <img src="data:image/png;base64,${signLv2.signName}" />
            </c:if>
            <c:if test="${empty signLv2 and myLevel == 2 and doc.status ne 'REJECTED'}">
                <form action="/signDoc" method="post">
                    <canvas style="border: 1px solid #000000; width:240px; height:100px;"></canvas><br>
                    <button type="button" id="btnClear">사인 지우기</button>
                    <input type="hidden" name="docNo" value="${doc.docNo}" />
                    <input type="hidden" id="empId" name="empId" value="${myEmpId}" />
                    <input type="hidden" name="signStatus" value="APPROVED" />
                    <button type="button" id="btnSign">✅ 팀장 결제</button>
                </form>
                <form action="/signDoc" method="post" style="margin-top:5px;">
                    <input type="hidden" name="docNo" value="${doc.docNo}" />
                    <input type="hidden" name="signStatus" value="REJECTED" />
                    <button type="submit">❌ 반려</button>
                </form>
            </c:if>
        </div>

        <!-- LV3 -->
        <div class="sign-box">
            <label>서명</label>
            <c:if test="${not empty signLv3}">
                <p>${signLv3.empName}</p>
                <img src="data:image/png;base64,${signLv3.signName}" />
            </c:if>
            <c:if test="${empty signLv3 and signLv2 != null and myLevel == 3 and doc.status ne 'REJECTED'}">
                <form action="/signDoc" method="post">
                    <canvas style="border: 1px solid #000000; width:240px; height:100px;"></canvas><br>
                    <button type="button" id="btnClear">사인 지우기</button>
                    <input type="hidden" name="docNo" value="${doc.docNo}" />
                    <input type="hidden" id="empId" name="empId" value="${myEmpId}" />
                    <input type="hidden" name="signStatus" value="APPROVED" />
                    <button type="button" id="btnSign">✅ 최종 결제</button>
                </form>
                <form action="/signDoc" method="post" style="margin-top:5px;">
                    <input type="hidden" name="docNo" value="${doc.docNo}" />
                    <input type="hidden" name="signStatus" value="REJECTED" />
                    <button type="submit">❌ 반려</button>
                </form>
            </c:if>
        </div>
    </div>
</div>

<br>
<a href="/docList">← 목록으로</a>

</body>
</html>
