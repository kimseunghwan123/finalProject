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
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />


	<div class="outer">


		<!-- 여기는 ajax할필요없음 -->
		<div id="boardList-area" align="center">
			<table>
				<thead>
					<tr>
						<td><textarea id="boardBrgName" style="resize: none;"></textarea></td>
						<td><button id="boardBrgInsert"
								onclick="insertTeamBoardBrg();" class="btn btn-sm btn-primary">등록</button></td>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list }">
							<tr>
								<td colspan="2">현재 게시판없어요.😢</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="teamBoardBrg" items="${list}">
								<tr>
									<td class="boardCode" style="display: none;">${teamBoardBrg.boardCode}</td>
									<td><p onclick="selectTeamBoard(this);" style="cursor: pointer;">${ teamBoardBrg.boardName }</p></td>
									<td><p onclick="delTeamBoardBrg(this);"
											style="cursor: pointer;">❌</p></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>


			<div></div>
             <button class="btn btn-sm btn-primary" onclick="teamManage()">팀 관리</button>
			<button class="btn btn-sm btn-danger">팀 삭제</button>
		</div>

		<!-- 브릿지 ajax 스크립트 -->


		<div id="boardSelect-area">


			<table border="1" align="center">
				<thead>
				</thead>
				<tbody>
					<tr>
						
						<th>
							<select id="selBoardCode">
								<c:forEach var="teamBoardBrg" items="${list}">
						 		   <option value="${teamBoardBrg.boardCode}">${teamBoardBrg.boardName}</option>
								</c:forEach>
						    </select>
						</th>
						<c:choose>
							<c:when test="${not empty sessionScope.loginUser }">
								<td><textarea id="content" cols="50" rows="3"
										style="resize: none;"></textarea></td>
								<td><button class="btn btn-sm btn-primary" onclick="addteamBoard(); reselectTeamBoard();">글 등록</button></td>
							</c:when>
							<c:otherwise>
								<td><textarea readonly cols="50" rows="3"
										style="resize: none;">로그인 후 이용가능한 서비스입니다.</textarea></td>
								<td><button  class="btn btn-sm btn-primary" >글 등록</button></td>

							</c:otherwise>
						</c:choose>
					</tr>
				</tbody>

			</table>

			<br> <br> <br> <br>
		</div>
	</div>
	<script>
    // 삭제 브릿지테이블
    function delTeamBoardBrg(element) {
        var boardCode = $(element).closest('tr').find('.boardCode').text();
        $.ajax({
            type: "post",
            url: "deleteTeamBoardBrg",
            data: {
                boardCode: boardCode
            },
            success: function (response) {
                if (response === 'success') {
                    alert("게시글이 삭제되었습니다.");
                    // 삭제된 항목을 화면에서 제거하는 코드를 추가하세요
                    $(element).closest('tr').remove();
                    location.reload();
                } else {
                    // 실패 시 처리할 내용
                    alert("게시글 삭제에 실패했습니다.");
                }
            },
            error: function (xhr, status, error) {
                // 오류 발생 시 처리할 내용
                console.error(xhr.responseText);
                alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
            }
        });
    }

    //삽입브릿지
    function insertTeamBoardBrg() {
        $.ajax({
            type: "post",
            url: "insertTeamBoardBrg",
            data: {
                teamNo: getParameterByName('teamNo'),
                boardName: $('#boardBrgName').val()
            },
            success: function (response) {
                // AJAX 요청 성공 시 처리할 내용
                if (response === 'success') {
                    alert("게시글이 성공적으로 등록되었습니다");
                    location.reload();
                } else {
                    alert("게시글 등록에 실패했습니다.");
                }
            },
            error: function (xhr, status, error) {
                // AJAX 요청 실패 시 처리할 내용
                alert("AJAX 요청에 실패했습니다.");
                console.error(xhr.responseText);
            }
        });
    }

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

    // 팀 보드 선택
    function selectTeamBoard(element) {
        var selectedBoardCode = $(element).closest('tr').find('.boardCode').text();
        $.ajax({
            url: 'teamBoardSelect',
            data: {
                boardCode: selectedBoardCode
            },
            success: function (result) {
                console.log(selectedBoardCode);

                let resultStr = '';
                for (let i in result) {
                    resultStr += '<tr>' +
                        '<td>' + result[i].nickName + '</td>' +
                        '<td>' + result[i].content + '</td>' +
                        '<td>' + result[i].createDate + '</td>' +
                        '</tr>';
                }
                $('#boardSelect-area thead').html(resultStr);
            },
            error: function (e) {
                console.log(e);
            }
        });
    }
    // 팀 보드 추가
    var userNo = "${sessionScope.loginUser.userNo}";
    function addteamBoard() {
        if ($('#content').val().trim() != '') {
            $.ajax({
                url: 'teamBoardInsert',
                data: {
                    boardCode: $('#selBoardCode').val(),
                    content: $('#content').val(),
                    userNo: userNo
                },
                type: 'post',
                success: function (result) {
                    console.log(result);
                    

                    if (result === 'success') {
                        $('#content').val('');
                        alert("게시글이 성공적으로 등록되었습니다");
                    }
                }

            });
        } else {
            alert('경고');
        }
    }
    //팀보드 재셀렉트
    function reselectTeamBoard() {
    	var boardCode =$('#selBoardCode').val();
        $.ajax({
            url: 'teamBoardSelect',
            data: {
                boardCode: boardCode
            },
            success: function (result) {
            	 console.log(boardCode);

                let resultStr = '';
                for (let i in result) {
                    resultStr += '<tr>' +
                        '<td>' + result[i].nickName + '</td>' +
                        '<td>' + result[i].content + '</td>' +
                        '<td>' + result[i].createDate + '</td>' +
                        '</tr>';
                }
                $('#boardSelect-area thead').html(resultStr);
            },
            error: function (e) {
                console.log(e);
            }
        });
    }
    
	//파라미터 그대로 바꾸기   
    const teamManage = () => {
	    const currentUrl = window.location.href; // 현재 페이지의 URL 가져오기
	    const newUrl = currentUrl.replace("teamBoard.teamBoard", "approveList.do"); // URL에서 teamInfo를 teamBoard.teamBoard로 변경
	    window.location.href = newUrl; // 새로운 URL로 이동
	};
</script>
	
</body>
</html>