<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>경기 신청</title>
    <style>
        #outer{
            width:80%;
            margin: auto;
            padding-bottom: 5%;
            padding-top: 2%;
            background-color: white;
        }
        #match-header{
            width: 100%;
            text-align: center;
            > h3, h2{
                display: inline-flex;
            }
            > h2{
                margin-left: 10%;
                margin-right: 10%;
                font-weight: 700;
            }
        }
        #match-team{
            background-color: lightgray;
            text-align: center;
            padding: auto;
            > div {
                display: inline-block;
            }
        }
        #search-team-btn{
            float: inline-end;
            margin-right: 10%;
        }
        #home-teamName, #away-teamName{
            width: 35%;
        }
        #match-form{
        	padding-top: 3%;
            text-align: center;
        }
        textarea[name='applyContent']{
            display: inline-flex;
            width: 40%;
            height: 200px;
        }
		.modal-search-area{
			text-align: center;		
		}
    </style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	<!-- teamModal -->
    <jsp:include page="matchApplicationTeamModal.jsp"/>	
    <!-- fieldModal -->
	<jsp:include page="matchApplicationFieldModal.jsp"/>	
	
	<script src="resources/js/common/city-district-select.js"></script>
	
    <div id="outer">
        <div id="match-header">
            <h3 style="color:rgb(52, 152, 219);">HOME</h3>
            <h2>경기 신청</h2>
            <h3 style="color:rgb(231, 76, 60);">AWAY</h3>
        </div>
	    <div id="match-team">
	        <div id="home-teamName"><h2>${ homeTeam.teamName }</h2></div>
	        <div><h2>VS</h2></div>
	        <div id="away-teamName"><h2><c:out value="${ awayTeam.teamName }" default="선택 안함" /></h2></div>
	    </div>
	    <button id="search-team-btn" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#teamModal">상대팀 검색</button>
        <form action="applyMatch" method="post" id="match-form">
	        <input type="hidden" id="home-team" name="homeTeam" value="${ homeTeam.teamNo }">
	        <input type="hidden" id="away-team" name="awayTeam" value="${ awayTeam.teamNo }">
            <label for="matchDate">경기 희망일시 : </label>
            <input type="date" name="matchDate" id="matchDate"/>
            <input type="time" name="matchDateTime" id="matchDateTime"/>
            <label for="matchTime">경기 시간 : </label>
            <select name="matchTime" id="matchTime">
                <option value="90">90분</option>
                <option value="60">60분</option>
                <option value="40">40분</option>
            </select>
            <br>
            <button id="search-field-btn" type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#fieldModal">경기장 검색</button>
            <br>
            <input type="hidden" name="fieldNo" id="fieldNo">
            <span>경기장 : </span><b id="fieldName">선택 안함</b> <br>
            <span>위치 : </span><b id="location">--</b> <br>
            <span>정보 : </span><b id="fieldInfo">-- | --</b> <br>
            <br>
            <input type="hidden" name="memberNo" value="${ loginUser.userNo }">
            <label for="applyName">신청자명 : </label>
            <input type="text" name="applyName" id="applyName" placeholder="본명 입력" pattern="^[가-힣]{2,5}" title="한글 2글자에서 5글자로 입력해주세요." required> <br>
            <label for="applyPhone">전화번호 : </label>
            <input type="text" name="applyPhone" id="applyPhone" value="${ loginUser.phone }" placeholder="010-0000-0000" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxLength={13} title="'-'를 포함한 전화번호를 입력해주세요." required> <br>
            <textarea name="applyContent" onkeyup="contentCheck(this);" placeholder="신청 사유 / 추가 정보를 입력해주세요. 최대 100글자"></textarea> <br>
            <br>
            <button type="button" onclick="history.back()" class="btn btn-secondary">취소</button>
            <button type="submit" class="btn btn-primary">신청</button>
        </form>
    </div>
    
	<script>
		function contentCheck(content){
			var regExp = /[\{\}\[\]\/;:|\)*`^\_<>\#$%\'\"\\\(\=]/gi; 
	        if(regExp.test(content.value) ){
	        	alert('특수문자는 입력하실 수 없습니다.');
	        	content.value = content.value.substring( 0 , content.value.length - 1 ); 
	        }
	        if(content.value.length > 100){
	        	alert('100글자 이상 입력하실 수 없습니다.');
	        	content.value = content.value.substring( 0 , content.value.length - 1 ); 
	        }
		}
	</script>
    
</body>
</html>