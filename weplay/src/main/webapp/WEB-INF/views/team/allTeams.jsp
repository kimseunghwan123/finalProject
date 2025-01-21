<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>WEPLAY:AllTeams</title>

    <style>
        #outer{
            width:80%;
            margin: auto;
            padding-bottom: 5%;
            padding-top: 2%;
            background-color: white;
        }
        #search-area{
            width: 100%;
            text-align: center;
            margin-top: 2%;
            margin-bottom: 2%;
        }
        #result-area{
        	width: 100%;
            text-align: right;
            margin-bottom: 2%;
            padding-right: 2%;
        }
        #sigungu{
            margin-right: 2%;
        }
        #teams-area{
        	padding-left: 2%;
        	padding-right: 2%;
        }
        #teams-area tbody > tr:hover{
        	cursor: pointer;
        }
		.page-link:hover{
			cursor: pointer;
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
	
	<script src="resources/js/team/teamList.js"></script>
	<script src="resources/js/common/city-district-select.js"></script>

    <div id="outer">
        <div id="search-area">
            <b>지역 : </b>
            <label for="sido">시도:</label>
            <select id="sido">
				<option value="all" selected>전체</option>
            </select>
            <label for="sigungu">시군구:</label>
            <select id="sigungu">
                <option value="all" selected>전체</option>
            </select>
            <input type="text" id="keyword" placeholder="팀명 검색">
            <button id="searchByKeyword" class="btn btn-sm btn-dark">검색</button>
        </div>
        <div id="result-area">
            <p></p>
        </div>
        <div id="teams-area">
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>순위</th>
                        <th>팀명</th>
                        <th>팀 유형</th>
                        <th>지역</th>
                        <th>실력</th>
                        <th>팀원수</th>
                        <th>평균 나이</th>
                        <th>전적</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
            <div id="page-area">
            	
            </div>

        </div> <!-- #teams-area -->

    </div> <!-- #outer -->

    
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
    
</body>
</html>