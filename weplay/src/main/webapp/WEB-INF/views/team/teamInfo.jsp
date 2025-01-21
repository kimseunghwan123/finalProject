<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>WEPLAY:TeamInfo</title>
	
    <style>
        #outer{
            width:80%;
            margin: auto;
            padding-bottom: 5%;
            padding-top: 5%;
            background-color: white;
        }
        #info-area{
            display: flex;
            width: 100%;
        }
        .content-box{
            display: inline-block;
        }
        #logo-area{
            text-align: center;
            width: 50%;
            padding-left: 5%;
            >img{
                width: 60%;
                margin-bottom: 5%;
            }
        }
        #content-area{
            width: 50%;
            padding-right: 10%;
            text-align: left;
            >h1{display: inline-block; margin-right: 10%;}
            >h3{margin-bottom: 5%;}
            span{display: inline-block; font-size: 18px; margin-right: 5%; margin-bottom: 2%;}
            >div{width: 40%;display: inline-block; margin-right: 5%;}
            >p{font-size: 18px;}
        }
        #btn-area{
            width: 100%;
            padding-top: 2%;
            text-align: center;
        }
        .modal-body {
        	display: flex;
        }
        #modal-logo{
        	width: 40%;
        	height: 100%;
        	> img{
        		width: 100%;
        		height: 100%;
        	}
        }
        #modal-text{
        	width: 60%;
        	> textarea{
        		width: 100%;
        		height: 100%;
        	}
        }
        
    </style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
    <div id="outer">
        <div id="info-area">
            <div id="logo-area" class="content-box">
                <img src="${ team.teamLogo }"> <br>
                <input id="teamNo" type="hidden" value="${ team.teamNo }">
                <input id="memberNo" type="hidden" value="${ loginUser.userNo }">
                <input id="memberTeamNo" type="hidden" value="${ loginUser.teamNo }"> 
                <input id="memberType" type="hidden" value="${ loginUser.memberType }">
                
                <button class="btn btn-success apply-join" data-toggle="modal" data-target="#ApplyJoinModal">팀 가입 신청</button>
                <button class="btn btn-primary apply-match">경기 신청</button>
            </div>
            <div id="content-area" class="content-box">
                <h1 id="teamName">${ team.teamName }</h1>
                
                <c:if test="${ not empty loginUser and loginUser.teamNo eq team.teamNo }">
                	<button class="btn btn-outline-primary" onclick="goToTeamBoard()">팀 페이지로 이동</button> <br>
               	</c:if>
               	
                <h3>${ team.teamRecord }</h3>
                <span>창단연도 : ${ team.fdYear }</span> <br>
                <div>
                    <span>지역 : ${ team.location }</span> <br>
                    <span>팀유형 : ${ team.teamType }</span> <br>
                    <span>실력 : ${ team.teamSkill }</span> <br>
                </div>
                <div>
                    <span>인원 : ${ team.teamMembers }</span> <br>
                    <span>평균 나이 : ${ team.avgAge }</span> <br>
                    <span>유니폼 : ${ team.uniform }</span> <br>
                </div>
                <br><br>
                <h4>팀 소개</h4>
                <p>${ team.teamInfo }</p>
            </div>
        </div>
        <div id="btn-area">
            <button onclick="history.back()" class="btn btn-info">뒤로가기</button>
        </div>
    </div>
   
    <!-- The Modal -->
	<div class="modal" id="ApplyJoinModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">${ team.teamName } 가입 신청</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      	<div id="modal-logo">
	      		<img src="${ team.teamLogo }">
	      	</div>
	        <div id="modal-text">
		        <textarea placeholder="신청 사유 또는 간단한 자기소개를 입력해주세요.."></textarea>
	        </div>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-dark" data-dismiss="modal">취소</button>
	        <button type="button" id="apply-join" class="btn btn-success" data-dismiss="modal">가입 신청</button>
	      </div>
	
	    </div>
	  </div>
	</div>
	
	<script>
		$(() => {
		    if($('#memberTeamNo').val() != '0'){
		        $('.apply-join').attr('disabled', true);
		        $('.apply-join').addClass('disabled');
		    }
		    if($('#memberType').val() != '관리자' && $('#memberType').val() != '창시자'){
		        $('.apply-match').attr('disabled', true);
		        $('.apply-match').addClass('disabled');
		    }
		    
		    $('.apply-join').click(() => {
		        $('#modal-text textarea').val('');
		    });
		    
		    $('#apply-join').click(() => {			
		        $.ajax({
		            url : 'joinTeam',
		            type : 'post',
		            data : {
		                memberNo : $('#memberNo').val(),
		                teamNo : $('#teamNo').val(),
		                applyContent : $('#modal-text textarea').val()
		            },
		            success : result => {
		                if(result == 'Y'){
		                    alert('가입 신청 성공!');
		                }
		                else if(result == 'N'){
		                    alert('이미 가입 신청을 하셨습니다.');
		                }
		                else {
		                    alert('가입 신청 실패..');
		                }
		            }
		        });
		    });
		    $('.apply-match').click(() => {
		        if(confirm($('#teamName').text() + '와의 경기를 신청하시겠습니까?')){
		            location.href = 'matchApplicationForm?awayTeamNo=' + $('#teamNo').val();
		        }
		    });
		});
		
		//파라미터 그대로 바꾸기
		const goToTeamBoard = () => {
		    const currentUrl = window.location.href; // 현재 페이지의 URL 가져오기
		    const newUrl = currentUrl.replace("teamInfo", "teamBoard.teamBoard"); // URL에서 teamInfo를 teamBoard.teamBoard로 변경
		    window.location.href = newUrl; // 새로운 URL로 이동
		};

	</script>
	
</body>
</html>