<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정페이지</title>
</head>
<style>
#enroll-form {
	background-color: cyan;
	padding-top: 10px;
	top: 40%;
	width: 80%;
	margin: auto;
	margin-top: 20%;
}
</style>
<body>
	<jsp:include page="../common/header.jsp" />


	<form id="enroll-form" method="post" action="update.member">
		<table align="center">
			<tr>
				<td>* 아이디</td>
				<td><input type="text" readonly maxlength="12" value="${loginUser.userId }" required
					name="userId"></td>
			<tr>
				<td>* 비밀번호</td>
				<td><input type="password" maxlength="15" required
					name="userPwd"></td>
			</tr>
			<tr>
				<td>* 비밀번호확인</td>
				<td><input type="password" maxlength="15" required></td>
			</tr>
			<tr>
				<td>* 닉네임</td>
				<td><input type="text" maxlength="5" value="${loginUser.nickName }"required name="nickName"></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="text" maxlength="5" value="${loginUser.age}"required name="age"></td>
			</tr>
			<tr>
				<td>핸드폰</td>
				<td><input type="tel" value="${loginUser.phone}" required name="phone"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" value="${loginUser.address}" required name="address"></td>
			</tr>
			<tr>
				<td>소개글</td>
				<td><input type="text" value="${loginUser.info}" required name="info"></td>
			</tr>
			<tr>
				<td>실력</td>
				<td><input type="text" value="${loginUser.skill}" required name="skill"></td>
			</tr>
			<tr>
				<td>주포지션</td>
				<td><input type="text"  value="${loginUser.position}"maxlength="13" required name="position"></td>
			</tr>
			<tr>
				<td>서브포지션</td>
				<td><input type="text" value="${loginUser.subPosition}" maxlength="13" required
					name="subPosition"></td>
			</tr>

		</table>

		<div align="center">
			<button type="reset" class="btn btn-sm btn-secondary">취소</button>
			<button type="submit" onclick="showAlert()"
				class="btn btn-sm btn-primary">정보수정</button>
		</div>

	</form>

	<script>
		function showAlert() {
			alert("정보를 수정하시겠습니까?");
		}
	</script>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>