<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인페이지</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩 스타일 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩 스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
#login-form {
	background-color: cyan;
	padding-top: 10px;
	top: 40%;
	width: 80%;
	margin: auto;
	margin-top: 20%;
}

.outer {
	width: 80%;
	margin: auto;
	padding-bottom: 5%;
	padding-top: 2%;
	background-color: white;
	overflow: hidden; /* 부모 요소의 높이를 자식 요소에 맞추기 위해 사용 */
}

#boardList-area {
	float: left;
	width: 30%;
	border-right: 1px solid black; /* 세로 줄 스타일 지정 */
	padding-right: 10px; /* 원하는 간격 조정 */
	padding-left: 20px;
}

#boardSelect-area {
	float: right;
	width: 70%;
}

#teamBoardName {
	resize: none; /* 사용자가 크기를 조절할 수 없도록 함 */
	width: 90%;
	height: 30px;
}
 #pagingArea {width:fit-content; margin:auto;}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />


	<div class="outer">
		<h2>팀 관리</h2>
		<!-- Nav tabs -->
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active"
				data-toggle="tab" href="#home">신청</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#menu1">팀 인원</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#menu2">팀 삭제</a></li>
		</ul>

		<!-- Tab panes -->

		<div class="tab-content">
			<div class="tab-pane container active" id="home">
			<h3>가입 신청한 인원</h3>
			
				<table class="table table-bordered">
					<thead>
						<tr>
							<td>이름</td>
							<td>팀이름</td>
							<td>신청글</td>
							<td>신청일</td>
							<td>상태</td>
							<td>저장하기</td>
							<td>승인하기</td>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty list}">
								<tr>
									<td colspan="6">내용 없음</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="teamApplication" items="${list}">
									<tr>
										<td style="display: none;">${teamApplication.memberNo}</td>
										<td style="display: none;">${teamApplication.applyNo}</td>
										<td>${teamApplication.nickName}</td>
										<td>${teamApplication.teamName}</td>
										<td>${teamApplication.applyContent}</td>
										<td>${teamApplication.applyDate}</td>
										<td>
										<select>
												<option value="Y"
													<c:if test="${teamApplication.status eq 'Y'}">selected</c:if>>신청중</option>
												<option value="N"
													<c:if test="${teamApplication.status eq 'N'}">selected</c:if>>신청취소</option>
												<option value="A"
													<c:if test="${teamApplication.status eq 'A'}">selected</c:if>>승낙</option>
												<option value="R"
													<c:if test="${teamApplication.status eq 'R'}">selected</c:if>>거절</option>
										</select>
										</td>
										<td>
										    <a style="cursor: pointer;" onclick="update(this)">저장</a>
										</td>
										<td>
										    <a style="cursor: pointer;" onclick="come(this)">🆗</a>
										</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<div id="pagingArea">
				    <ul class="pagination">
				        <c:choose>
				            <c:when test="${ pageInfo.currentPage == 1 }">
				                <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
				            </c:when>
				            <c:otherwise>
				                <li class="page-item">
				                    <a class="page-link" href="approveList.do?teamNo=${map.teamNo}&page=${ pageInfo.currentPage - 1 }">이전</a>
				                </li>
				            </c:otherwise>
				        </c:choose>
				
				        <c:forEach var="p" begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }">
				            <li class="page-item ${ p == pageInfo.currentPage ? 'active' : ''}">
				                <a class="page-link" href="approveList.do?teamNo=${map.teamNo}&page=${p}">${p}</a>
				            </li>
				        </c:forEach>
				
				        <c:choose>
				            <c:when test="${ pageInfo.currentPage == pageInfo.maxPage }">
				                <li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
				            </c:when>
				            <c:otherwise>
				                <li class="page-item">
				                    <a class="page-link" href="approveList.do?teamNo=${map.teamNo}&page=${ pageInfo.currentPage + 1 }">다음</a>
				                </li>
				            </c:otherwise>
				        </c:choose>
				    </ul>
				</div>
								
			</div>
			
			
			<div class="tab-pane container fade" id="menu1">
				<h3>현재 팀 인원</h3>
				<table class="table table-bordered">
					<thead>
						<tr>
							<td>회원번호</td>
							<td>이름</td>
							<td>회원등급</td>
							<td>신청일</td>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty memberList}">
								<tr>
									<td colspan="4">내용 없음</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="teamMember" items="${memberList}">
									<tr>
										<td>${teamMember.memberNo}</td>
										<td>${teamMember.nickName}</td>
										<td>${teamMember.memberType}</td>
										<td>${teamMember.enrollDate}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			
			
			<div class="tab-pane container fade" id="menu2">
			<button align="center";>팀 삭제하시겠습니까?</button>
			</div>
		</div>

	</div>
	<script>
	
		// 파라미터 받아와서 teamNo 넣기
	    function getParameterByName(name) {
	        name = name.replace(/[\[\]]/g, "\\$&");
	        var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
	            results = regex.exec(window.location.href);
	        if (!results)
	            return null;
	        if (!results[2])
	            return '';
	        return decodeURIComponent(results[2].replace(/\+/g, " "));
	    }
		  

	 // 삽입
	    function come(element) {
	        var teamNo = getParameterByName('teamNo');
	        var memberNo = $(element).closest('tr').find('td:eq(0)').text(); // memberNo 값 가져오기
	        var status = $(element).closest('tr').find('select').val(); // 선택된 상태 값 가져오기

	        // A 상태인 경우 insertToTeamMember URL 사용
	        if (status === 'A') {
	            $.ajax({
	                type: "post",
	                url: 'insertToTeamMember',
	                data: {
	                    teamNo: teamNo,
	                    memberNo: memberNo,
	                },
	                success: function(response) {
	                    console.log("서버 응답:", response);
	                    if (response) {
	                        alert("팀 영입 성공!");
	                        // 여기서 선택한 행의 상태를 변경하거나 다시 로딩하는 등의 작업 수행
	                    } else {
	                        alert("팀 영입 실패");
	                    }
	                },
	                error: function(xhr, status, error) {
	                    console.error("AJAX 오류 발생:", error);
	                    alert("실패했습니다.");
	                }
	            });
	        }
	    }




	    // 업데이트만
	    function update(element) {
	        var applyNo = $(element).closest('tr').find('td:eq(1)').text(); // 행의 두 번째 열에서 applyNo 가져오기
	        var status = $(element).closest('tr').find('select').val(); // 선택된 상태 값 가져오기
	        $.ajax({
	            type: "post",
	            url: 'updateTeamApplication',
	            data: {
	                applyNo: applyNo,
	                status: status // 변경된 상태 값 서버로 전송
	            },
	            success: function(response) {
	                if (response === 'success') {
	                    alert("업데이트합니다");
	                    location.reload();
	                    // 여기서 선택한 행의 상태를 변경하거나 다시 로딩하는 등의 작업 수행
	                } else {
	                    alert("업뎃실패");
	                }
	            },
	            error: function(xhr, status, error) {
                    console.error("AJAX 오류 발생:", error);
                    alert("실패했습니다.");
                }
	        });
	    }

			
			
		
	
	</script>

</body>
</html>