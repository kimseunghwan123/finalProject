<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인하세요!</title>
<!-- jQuery 라이브러리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩 스타일 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩 스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
body {
	background-color: black;
}

#header {
	width: 80%;
	height: 100px;
	padding-top: 20px;
	margin: auto; > h1 { text-align : center;
	color: rgb(52, 152, 219);
	font-size: 50px;
	font-weight: 700;
	margin-bottom: 40px; >
	a {text-decoration: none;
}

}
}
#header-btn-area {
	display: inline-block;
	padding-left: 80%; > a { text-decoration : none;
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
	height: 75%;
	border-bottom: 1px solid lightgray;
}

.navi-in {
	list-style-type: none;
	margin: auto;
	display: none;
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

#body-login {
	width: 80%;
	margin: auto;
	text-align: center;
	margin-top: 50px;
	 padding-top: 30%;
	}
</style>
</head>
<body>

	<div id="header">
		<div id="header-btn-area">
			<a href="">로그인</a> | <a href="">회원가입</a>
			<!--<a href="">마이페이지</a> | <a href="">경기장 대여 내역</a>-->

		</div>

		<h1>
			<a href="">WEPLAY</a>
		</h1>

		<div id="header-navibar">
			<ul>
				<li class="navi-top"><a href="">팀</a></li>
				<li class="navi-top"><a href="">선수</a></li>
				<li class="navi-top"><a href="">My팀</a></li>
				<li class="navi-top"><a href="">경기</a>
					<ul class="navi-in">
						<li><a href="#">전체 경기</a></li>
						<li><a href="#">My팀 경기</a></li>
						<li><a href="#">경기 신청</a></li>
						<li><a href="#">경기 신청 내역</a></li>
						<li><a href="#">경기 기록(팀)</a></li>
						<li><a href="#">경기 기록(개인)</a></li>
					</ul></li>
				<li class="navi-top"><a href="">커뮤니티</a>
					<ul class="navi-in">
						<li><a href="#">자유 게시판</a></li>
						<li><a href="#">경기 게시판</a></li>
						<li><a href="#">팀원 모집</a></li>
						<li><a href="#">팀 구함</a></li>
					</ul></li class="navi-top">
				<li class="navi-top"><a href="">경기장 예약</a></li>
			</ul>
		</div>

	</div>


	<div id="body-login">
	<!--로그인시  -->
	<c:if test="${not empty loginUser }">
		<div class="card" style="width: 400px; height: 350px;">
			<img class="card-img-top" src="${loginUser.thumbnailImage}"
				alt="Card image">
			<div class="card-body">
				<h4 class="card-title">${loginUser.nickName }</h4>
				<p class="card-text">당신의 축구를 응원합니다.</p>
				<a href="#" class="btn btn-primary">프로필보기</a>
			</div>
		</div>
	</c:if>

	<!--비로그인시  -->
	<c:if test="${empty loginUser}">
		<a id="kakao-login-btn"><img src="resources/images/kakao_btn.png" />	</a>
	</c:if>

	</div>
	<script>
	$(() =>{
		$('#kakao-login-btn').click(() => {
			
		
		location.href ='https://kauth.kakao.com/oauth/authorize?client_id=64c3383cfe650be0d6284293b8d84835&redirect_uri=http://localhost:8099/weplay/code&response_type=code&scope=profile_image,profile_nickname'
		});	
	})
</script>


</body>
</html>