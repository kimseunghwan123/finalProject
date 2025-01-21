<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WEPLAY</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- 부트스트랩 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
body {
	background-color: black;
}

#header {
	width: 80%;
	height: 20%;
	padding-top: 20px;
	margin: auto; > h1 { text-align : center;
	color: rgb(52, 152, 219);
	font-size: 50px;
	font-weight: 700;
	margin-bottom: 40px; >
	a {text-decoration: none;}

}
}
#header-btn-area {
	display: inline-block;
	padding-left: 75%; 
	> a { 
		text-decoration : none;
		color: white;
	}

}
#header-navibar>ul {
	width: 100%;
	height: 100%;
	list-style-type: none;
	margin: auto;
	padding: 0;
}

.navi-top {
	float: left;
	width: 16.66%;
	height: 100%;
	line-height: 55px;
	text-align: center;
	z-index: 10;
}

.navi-top>a {
	color: white;
	font-size: 22px;
	font-weight: 900;
	display: block;
	width: 100%;
	height: 100%;
	transform: scale(1);
}

#header-navibar {
	height: 60px;
	border-bottom: 1px solid lightgray;
	border: 1px solid lightgrey;
}

.navi-in {
	list-style-type: none;
	margin: auto;
	display: none;
	background-color: black;
	position: relative; 
	z-index: 20;
}

.navi-in a {
	text-decoration: none;
	color: white;
	font-size: 18px;
	font-weight: 900;
}

.navi-top>a:hover, .navi-in a:hover {
	color: rgb(52, 152, 219);
}

.navi-top>a:hover+.navi-in {
	display: block;
}

.navi-in:hover {
	display: block;
}

#header{
    color: #1e90ff;

}



</style>
</head>
<body>

	<c:if test="${ not empty alertMsg }">
		<script>
			alert('${ alertMsg }');
		</script>
		<c:remove var="alertMsg" />
	</c:if>

	<div id="header">
		<div id="header-btn-area">

			<c:choose>
				<c:when test="${empty sessionScope.loginUser }">
					<!-- 로그인 전 -->
					<a href="loginForm.member">로그인</a> | <a href="enrollForm.member">회원가입</a>
				</c:when>
				<c:otherwise>
					<label>${ loginUser.nickName }님 환영합니다</label> <br>
					<a href="mypage.member">마이페이지</a> | <a href="">경기장 대여 내역</a> | <a href="logout.member">로그아웃 </a>
				</c:otherwise>
			</c:choose>
		</div>

		<h1>
			<a href="${pageContext.request.contextPath}">WEPLAY</a>
		</h1>

		<div id="header-navibar">
			<ul>
				<li class="navi-top"><a href="allTeams">팀</a></li>
				<li class="navi-top"><a href="">선수</a></li>
				<li class="navi-top"><a href="">My팀</a></li>
				<li class="navi-top"><a href="">경기</a>
					<ul class="navi-in">
						<li><a href="#">전체 경기</a></li>
						<li><a href="#">My팀 경기</a></li>
						<li><a href="matchApplicationForm">경기 신청</a></li>
						<li><a href="matchApplications">경기 신청 내역</a></li>
						<li><a href="#">경기 기록(팀)</a></li>
						<li><a href="#">경기 기록(개인)</a></li>
					</ul></li>
				<li class="navi-top"><a href="">커뮤니티</a>
					<ul class="navi-in">
						<li><a href="freboard.list">자유 게시판</a></li>
						<li><a href="gamematchboard.list">경기 게시판</a></li>
					</ul></li class="navi-top">
				<li class="navi-top"><a href="">경기장 예약</a></li>
			</ul>
		</div>

	</div>

</body>
</html>