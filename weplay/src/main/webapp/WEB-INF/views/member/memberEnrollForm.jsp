<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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



<!-- 아이디 중복체크 -->
	<script>
			function idCheck(){
						
			const $userId = $('#enroll-form input[name=userId]');
				 console.log($userId);
				// AJAX요청
				$.ajax({ // 보낼 값이 많으므로 객체 만들기 {}
					type : "POST",
					url : 'idCheck.do',
					data : {checkId : $userId.val()},
					success : function(result){
								
					if(result =='NNNNN'){ // 중복된 아이디
						alert('이미 존재하거나 탈퇴한 회원의 아이디입니다.');
						$userId.val('').focus();
						 } else { // 중복 X == 사용 가능
									
					if(confirm('사용 가능한 아이디입니다. 사용하시겠습니까?')){
						// 아이디 값은 변경이 불가능하도록 == readonly
						$userId.attr('readonly', true);
										
						// 중복확인 전 막아두었던 submit버튼 활성화
						//$('#enroll-form button[type=submit]').removeAttr('disabled');
					}
					else{
					$userId.focus();
					}
				}
					},
					error : function(){
					console.log('AJAX통신실패');
					}
					});
				}
				
	</script>
	
	<!-- 비밀번호 중복체크 -->
		<script>
			function pwdCheck(){
				const p1 = document.getElementsByClassName('pwdCheck')[0].value;
				const p2 = document.getElementsByClassName('pwdCheck')[1].value;
				const memEnroll = document.getElementById('memJoin');
				const name = document.getElementById('name');
					if(p1 != p2){
						alert("비밀번호가 일치하지 않습니다!");
							p1 = null;
							p2 = null;
							return false;
							}
							else{
							alert("비밀번호가 일치합니다.");
							memEnroll.disabled = false;
							return true;
							}
						}
		</script>
		
	<!-- 닉네임 중복체크 -->		
		<script>
			function nickNameCheck(){
						
				const $nickname = $('#enroll-form input[name=nickname]');
					// console.log($nickname);
					$.ajax({ 
						type : "POST",
						url : 'nickNameCheck.do',
						data : {checkNickname : $nickname.val()},
						success : function(result){
								
						if(result =='NNNNN'){ // 중복된 닉네임
							alert('중복되는 닉네임입니다.');
								
							$nickname.val('').focus();
								} else { // 중복 X == 사용 가능
									
						if(confirm('사용 가능한 닉네임입니다. 사용하시겠습니까?')){
							$nickname.attr('readonly', true);
							}
							  else{
								$nickname.focus();
							}
								}
							},
							error : function(){
							console.log('AJAX통신실패');
							}
						});
					}
				
		</script>		

		
		
		
<!-- 정규표현식 -->
		<script>
			/* 아이디 */
			$('input[name=userId]').blur(function(){
				const idReg =  /^[A-Za-z0-9]{4,12}$/;
				const idVal = $('input[name=userId]').val();

				if(!idReg.test(idVal)){
					$('input[name=userId]').val('');
					$('input[name=userId]').css('border-color','orangered');
				}
				else{
					$('input[name=userId]').css('border-color', 'rgb(230, 230, 230)');
				}
			});
		</script>

		<script>
			/* 비밀번호 */
			$('input[name=userPwd]').blur(function(){
				const pwdReg =  /^[A-Za-z0-9]{4,15}$/;
				const pwdVal = $('input[name=userPwd]').val();

				if(!pwdReg.test(pwdVal)){
					$('input[name=userPwd]').val('');
					$('input[name=userPwd]').css('border-color','orangered');
				}
				else{
					$('input[name=userPwd]').css('border-color','rgb(230, 230, 230)');
				}
			});
		</script>

		<script>
			/* 비밀번호 확인 */
				$('#userPwd2').blur(function(){
					const pwdReg2 = /^[A-Za-z0-9]{4,15}$/;
					const pwdVal2 = $('#userPwd2').val();

					if(!pwdReg2.test(pwdVal2)){
						$('#userPwd2').val('');
						$('#userPwd2').css('border-color','orangered');
					}
					else{
						$('#userPwd2').css('border-color','rgb(230, 230, 230)');
					}
				});
		</script>

		

		<script>
			/* 닉네임 */
			$('input[name=nickname]').blur(function(){
					const nicknameReg = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]{2,15}$/;
					const nicknameVal = $('input[name=nickname]').val();

					if(!nicknameReg.test(nicknameVal)){
						$('input[name=nickname]').val('');
						$('input[name=nickname]').css('border-color','orangered');
					}
					else{
						$('input[name=nickname]').css('border-color','rgb(230, 230, 230)');
					}
				});
		</script>


</head>
<body>
	<jsp:include page="../common/header.jsp" />


	<form id="enroll-form" method="post" action="insert.member">
		<table align="center">
			<tr>
				<td>* 아이디</td>
				<td><input type="text" maxlength="12" required name="userId" placeholder="4~12 영숫자" autofocus></td>
				<td><button class="btn btn-sm btn-primary" type="button" onclick="idCheck();">중복확인</button></td>
			<tr>
				<td>* 비밀번호</td>
				<td><input type="password" maxlength="15" required
					name="userPwd"  class="pwdCheck" placeholder="4~15 영숫자"></td>
			</tr>
			<tr>
				<td>* 비밀번호확인</td>
				<td><input type="password" maxlength="15" required id="userPwd2" class="pwdCheck"></td>
				<td><button onclick="pwdCheck();" class="btn btn-sm btn-primary">일치확인</button></td>
			</tr>
			<tr>
				<td>* 닉네임</td>
				<td><input type="text" maxlength="5" required name="nickName"placeholder="한글 또는 영숫자"></td>
				<td><button class="btn btn-sm btn-primary" type="button" onclick="nickNameCheck();">중복확인</button></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="text" maxlength="5" required name="age"></td>
			</tr>
			<tr>
				<td>핸드폰</td>
				<td><input type="tel" required name="phone"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" required
					name="address"></td>
			</tr>
			<tr>
				<td>소개글</td>
				<td><input type="text" required name="info"></td>
			</tr>
			<tr>
				<td>실력</td>
				<td><input type="text" required name="skill"></td>
			</tr>
			<tr>
				<td>주포지션</td>
				<td><input type="text" maxlength="13" required name="position"></td>
			</tr>
			<tr>
				<td>서브포지션</td>
				<td><input type="text" maxlength="13" required
					name="subPosition"></td>
			</tr>

		</table>

		<div align="center">
			<button type="reset" class="btn btn-sm btn-secondary">취소</button>
			<button type="submit" class="btn btn-sm btn-primary">회원가입</button>
		</div>

	</form>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>