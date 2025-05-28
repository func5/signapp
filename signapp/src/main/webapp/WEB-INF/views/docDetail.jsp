<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문서 상세보기</title>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/signature_pad@4.1.7/dist/signature_pad.umd.min.js"></script>
<script>
	$(document).ready(function(){
		// 캔버스에 사인 후 객체로 받는 SignaturePad 생성자
		// SignaturePad API 설명 >> https://github.com/szimek/signature_pad <<
		const signaturePad = new SignaturePad($('canvas')[0], {
		    minWidth: 1,
		    maxWidth: 1,
		    penColor: "rgb(0, 0, 0)"
		});
		
		// 캔버스 내용을 초기화하는 SignaturePad API clear() 메서드
		$('#btnClear').click(function(){
			signaturePad.clear();
		})
		
		// Ajax로 SignaturePad 객체안 사인 이미지를 서버로 전송
		$('#btnSign').click(function(){

			if(signaturePad.isEmpty()){		// 사인 내용이 없음
				alert('사인 해주세요.');
				return;
			}
			else{
				// $.ajax({}).done.fail();
				$.ajax({
					asyn : true	// true 비동기(백그라운드로 실행)
					, url: '/addSign'
					, type: 'post'
					, data : {
					    empId : $('#empId').val(),             	// id → empId
					    docNo : $('input[name="docNo"]').val(), // form의 hidden 값에서 docNo 추출
					    signName : signaturePad.toDataURL()  	// signImg → signName
					}
				}).done(function(data){	// ajax 성공
					alert(data);
					// js로 페이지 이동 location.href='이동할 페이지'
					location.href='/docDetail?docNo='+${doc.docNo};
					// 사인을 초기화..
					
				}).fail(function(){	// ajax 실패
					alert('결제 실패');
				})
			}
			
			
		})
	});
</script>
</head>
<body>

<c:if test="${not empty alertMsg}">
	<script>
		alert("${alertMsg}");
	</script>
</c:if>

<h1>📄 문서 상세</h1>
<hr>

<p><strong>문서번호:</strong> ${doc.docNo}</p>
<p><strong>제목:</strong> ${doc.docTitle}</p>
<p><strong>작성일:</strong> ${doc.createDate}</p>
<p><strong>작성자:</strong> ${doc.empName}</p>
<p><strong>내용:</strong> ${doc.docContent}</p>
<p><strong>결재 상태:</strong> 
    <c:choose>
        <c:when test="${doc.status == 'WAIT'}">⏳ 대기 중</c:when>
        <c:when test="${doc.status == 'APPROVED'}">✅ 승인</c:when>
        <c:when test="${doc.status == 'REJECTED'}">❌ 반려</c:when>
    </c:choose>
</p>

<hr>

<%-- 로그인 사용자 정보 가져오기 --%>
<c:set var="myEmpId" value="${loginEmployee.empId}" />
<c:set var="myLevel" value="${loginEmployee.empLevel}" />

<%-- 삭제/수정 버튼: 작성자 본인만 --%>
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

<form>
	<table border="1">
		<tr>
			<th>/</th>
			<th>lv2</th>
			<th>lv3</th>
		</tr>
		<tr>
			<td>사인</td>
			<!-- lv2 -->
			<td>
				<div>
					<!-- 사인이 있을 때 (null이 아니고, 비어있지 않을 때) and 반려면 이미 사인을 했더라도 사인이 안뜨게 -->
					<c:if test="${not empty signLv2  and doc.status ne 'REJECTED'}">
					    <p>결재자: ${signLv2.empName}</p>
					    <p><img src="data:image/png;base64,${signLv2.signName}"/></p>
					</c:if>
					
					<%-- 결재 버튼: 팀장/관리자만 --%>
					<c:if test="${myLevel == 2}">
						
						<!-- 사인이 없을 때 (null이거나 비어있을 때) and 반려면 사인 못하게-->
						<c:if test="${empty signLv2 and doc.status ne 'REJECTED'}">
						    <form action="/signDoc" method="post" name="signForm">
						        <!-- id : 사인 레벨이 되는 로그인 사용자 id -->
						        <canvas style="border: 1px solid #000000;"></canvas>
						        <br>
						        <button type="button" id="btnClear">사인 지우기</button>
						
						        <input type="hidden" name="docNo" value="${doc.docNo}" />
						        <input type="hidden" id="empId" name="empId" value="${myEmpId}" />
						        <input type="hidden" name="signStatus" value="APPROVED" />
						        <button type="button" id="btnSign">✅ 팀장 결재</button>
						    </form>
						    
						    <form action="/signDoc" method="post" style="margin-top:5px;">
						        <input type="hidden" name="docNo" value="${doc.docNo}" />
						        <input type="hidden" name="signStatus" value="REJECTED" />
						        <button type="submit">❌ 반려</button>
					    	</form>
						</c:if>
					</c:if>
				</div>
			</td>
			<!-- lv3 -->
			<td>
				<!-- 사인이 있을 때 (null이 아니고, 비어있지 않을 때) -->
				<c:if test="${not empty signLv3}">
				    <p>결재자: ${signLv3.empName}</p>
				    <p><img src="data:image/png;base64,${signLv3.signName}"/></p>
				</c:if>
				
				<c:if test="${myLevel == 3 and signLv2 != null and doc.status ne 'REJECTED'}">
				    	<!-- 사인이 없을 때 (null이거나 비어있을 때) -->
					<c:if test="${empty signLv3}">
					    <form action="/signDoc" method="post" name="signForm">
					        <!-- id : 사인 레벨이 되는 로그인 사용자 id -->
					        <canvas style="border: 1px solid #000000;"></canvas>
					        <br>
					        <button type="button" id="btnClear">사인 지우기</button>
					
					        <input type="hidden" name="docNo" value="${doc.docNo}" />
					        <input type="hidden" id="empId" name="empId" value="${myEmpId}" />
					        <input type="hidden" name="signStatus" value="APPROVED" />
					        <button type="button" id="btnSign">✅ 최종 결재</button>
					    </form>
					    
					    <form action="/signDoc" method="post" style="margin-top:5px;">
					        <input type="hidden" name="docNo" value="${doc.docNo}" />
					        <input type="hidden" name="signStatus" value="REJECTED" />
					        <button type="submit">❌ 반려</button>
				    	</form>
					</c:if>
				</c:if>
			</td>
		</tr>
	</table>
</form>

<br>
<a href="/docList">← 목록으로</a>

</body>
</html>
