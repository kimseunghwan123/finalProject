<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위플레이 >  경기게시판 > 상세페이지</title>

<style>

thead ,tbody, .align_center{
    color: #1e90ff;

}


#detail-area{
	width:100%;
	height:100%;
	word-break:break-all; /* 줄바꿈 처리 */
}

#detail_title-area{
    display: flex;
    flex-wrap: wrap;
    align-items: flex-start;
    justify-content: space-between;
    padding: 20px 60px;
    box-sizing: border-box;
    border-bottom: 1px solid #d1d1d7;
    background-color: #f2f2f2;
}

#detail_content-area{
	height:400px;
    padding: 60px;
    border-bottom: 1px solid #d1d1d7;
    color: #1a1d1d;
    font-size: 18px;
    line-height: 26px;
    white-space: break-spaces;
}
.detail_content-area{
	display:block;
	height:400px;
    padding: 60px;
    border-bottom: 1px solid #d1d1d7;
    color: #1a1d1d;
    font-size: 18px;
    line-height: 26px;
    white-space: break-spaces;
	
}

.detail_title_name_td{
    width: 60%;
    color: #1a1d1d;
    font-size: 26px;
    font-weight: 700;
    line-height: 40px;
}

.detail_title_date_td{
	margin-right:0;
	padding-right:0;
}

.btn-wrap{
	display: flex;
    align-items: center;
    justify-content: center;
    margin-top: 40px;
}

#detail-golist{
	width:448px;
	color: #fff;
    background-color: #007bff;
    border-color: #007bff;
}

.align_center{
	text-align:center;
	margin: 50px;
	padding:50px;
}
.board-basic{
	font-weight:bold;
}
board_type-area{
 display: flex;
    flex-wrap: wrap;
    align-items: flex-start;
    justify-content: space-between;
    padding: 20px 60px;
    box-sizing: border-box;
    border-bottom: 1px solid #d1d1d7;
    background-color: #f2f2f2;



}
.file_path-area{
   display: flex;
    flex-wrap: wrap;
    align-items: flex-start;
    justify-content: space-between;
    padding: 20px 60px;
    box-sizing: border-box;
    border-bottom: 1px solid #d1d1d7;
    background-color: #f2f2f2;


}


</style>



</head>
<body>
<jsp:include page="../common/header.jsp"/>

<div class="outer">

	<br>
	<div class="align_center">
		<h2 class="board-basic">경기게시판</h2>
	</div>
	<br>
	
	<br>
	<table id="detail-area">

		<!-- 타이틀 영역 -->
	    <tr id="detail_title-area">
	         <td class="detail_title_name_td" width="500" colspan="3">${gamematchboardOne.boardTitle}</td>
	         <td class="detail_title_date_td">${gamematchboardOne.createDate}</td>
	    </tr>
	    <!-- 컨텐츠영역 -->
	    <tr id="detail_content-area">
		   <td class="detail_content-area">${gamematchboardOne.boardContent}</td>  
	    </tr>
	    
	    <tr id="board_type-area">
		   <td class="board_type-area">${gamematchboardOne.boardType}</td>  
	    </tr>
	  <!-- 첨부파일영역 -->
	    <tr id="file_path-area">
		   <td class="file_path-area">${gamematchboardOne.filePath}</td>  
	    </tr>
	</table>
	<div class="btn-wrap">
		<input type="button" id="detail-golist" class="btn btn-light"   value="목록으로 이동" onclick="history.back();"/>
		
        <!--작성자 보이게끔-->
        <!--로그인 유저가 작성자와 같은지-->
        <!-- 로그인 여부 판단 그리고 로그인유저의 이름(UNIQUE)이랑 공지사항의 작성자 (사용하기엔 무리) 이것은 적합하지 않음 -->
        <!-- 새롭게 조회해온 USER_NO컬럼값을 가지고 비교    매핑값? SERVLET키값= -->
	</div>	
	<br>
	<br><br>

</div>
</body>
</html>