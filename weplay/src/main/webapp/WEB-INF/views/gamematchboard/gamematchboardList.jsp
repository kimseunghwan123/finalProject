<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위플레이 > 공지사항 > 목록(경기게시판)</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
thead ,tbody, .align_center{
    color: #1e90ff;

}
.outer{
	width : 1000px;
	height : 800px;
	margin : auto;
}

#btn_reg{
	float:right;
	background-color:#17a2b8;
	margin:5px;
}

.align_center{
	text-align:center;
	margin: 50px;
	padding:50px;
}
.board-basic{
	font-weight:bold;
}

/* 테이블 css */
.table table-hover{
	text-align:center;
}

</style>
</head>
<body>
<!-- include header.jsp   해당페이지로 인클루드  header페이지 실행 -->
	<jsp:include page="../common/header.jsp"/>
	<br>
	<div class="align_center">
		<h2 class="board-basic">경기게시판</h2>
	</div>
 	<br>
 	 <!-- 등록 버튼Start -->
	<a id="btn_reg" class="btn btn-primary" href="gamematchboard.regForm" role="button">등록하기</a>
     <!-- 등록 버튼 영역 END -->
     
	<br><br>
	<table id="gamematchboardlist"	class="table table-hover">
		<thead>
			<tr>
				<th>no.</th>
				<th>게시판 제목</th>
				<th>게시판 내용</th>
				<th>게시여부</th>
				<th>조회수</th>
				<th>게시판유형</th>
				<th>공지여부상태</th>
				<th>작성일</th>
				<th>수정일</th>
				<th>작성자</th>
				<th>첨부파일</th>
			</tr>
		</thead>
		<tbody>
             <c:forEach items="${ gamematchboardList }" var="gamematchboard">
                        <tr id="tr_gamematchboard" class="list">
                            <td>${ gamematchboard.boardNo }</td>
                            <td>${ gamematchboard.boardTitle }</td>
                            <td>${ gamematchboard.boardContent }</td>
                            <td>${ gamematchboard.status }</td>
                            <td>${ gamematchboard.boardViewCount }</td>
                            <td>${ gamematchboard.boardType }</td>
                            <td>${ gamematchboard.noticeStatus }</td>
                            <td>${ gamematchboard.createDate }</td>
                            <td>${ gamematchboard.updateDate }</td>
                            <td>${ gamematchboard.nickName }</td>
                            <td>${ gamematchboard.filePath }</td>
                        </tr>
           </c:forEach>
		</tbody>
	</table>
	
           

	<script>
	// loginId null 체크
	// 수정화면 진입 (관리자전용URL)
 	$('tbody > tr.list').click(function(){
        const boardNo = $(this).children().eq(0).text();
        location.href= 'selectUpdate.gamematchboard?boardNo=' + boardNo + '&flag=' + 'Y';
      })
		
       	// 상세화면 진입 (회원전용URL)
     /*    $('tbody > tr.list').click(function(){
           const boardNo = $(this).children().eq(0).text();
           location.href= 'selectUpdate.gamematchboard?boardNo=' + boardNo + '&flag=' + 'N';
        });  */
	
	</script>	 
</body>
</html>