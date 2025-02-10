<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위플레이 > 경기게시판 > 등록</title>

<style>

.align_center{
    color: #1e90ff;

}

#txtArea_content{
	width:650px;
	height:350px;
}

.th_left{
    width:475px;
}

#spn_textcount{
	float:right;
}

#td_status_left{
	float:left;
	border: 1px solid #17a2b8;
}

#save{
    background: #17a2b8;
    color: #fff;
    border: 1px solid #17a2b8;

    /* background: cadetblue;
    color: #fff;
    border: 1px solid cadetblue; */
}


.radio-btn{
    position: relative;
    display: inline-block;
    margin: 5px 3px;
}

/* 게시여부 라디오버튼 영역 스타일적용 START */
.radio-btn-wrap{
	margin:-5px -4px;
	float:left;
}

.radio-btn{
	margin: 5px 4px;
}

.radio-btn-wrap .radio-btn input[type="radio"] {
    overflow: hidden;
    position: absolute;
    top: 0;
    left: 0;
    width: 0;
    height: 0;
    opacity: 0;
}

.radio-btn-wrap .radio-btn input[type="radio"]:checked + label{
    
    background: #17a2b8;
    color: #fff;
    border: 1px solid #17a2b8;
    
    /*background: cadetblue;
    color: #fff;
    border: 1px solid cadetblue;*/
}

.radio-btn-wrap .radio-btn label {
    display: block;
    height: 40px;
    padding: 0 15px;
    font-size: 16px;
    color: #636366;
    line-height: 38px;
    border: 1px solid #17a2b8;
    /*border: 1px solid cadetblue;*/
    border-radius: 24px;
    box-sizing: border-box;
    cursor: pointer;
}

	/* display: block;
    height: 40px;
    padding: 0 15px;
    font-size: 16px;
    color: #636366;
    line-height: 38px;
    border: 1px solid #aeaeb2;
    border-radius: 24px;
    box-sizing: border-box;
    cursor: pointer; */
/* 게시여부 라디오버튼 영역 스타일적용 END */

/* 첨부파일 영역 스타일적용 START */
.filebox{
	margin-top:8px;
}

.filebox label {
	float:left;
    display: inline-block;
    width: 140px;
    height: 48px;
    padding: 0 12px;
    color: #3a3a3d;
    font-size: 18px;
    line-height: 48px;
    border-radius: 4px;
    box-sizing: border-box;
    background-color: #9ca0a1;
    vertical-align: middle;
    cursor: pointer;
    text-align: center;
}

.filebox input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}

.filebox .upload-name {
    display: inline-block;
    padding: 0 32px 0 12px;
    background: none;
    vertical-align: middle;
    border: 0;
}

input[type="text"], input[type="password"] {
    width: 100%;
    height: 48px;
    padding: 0 16px;
    border-radius: 4px;
    background-color: #fafafa;
    color: #1a1d1d;
    font-size: 18px;
    line-height: 48px;
    box-sizing: border-box;
}

/* 삭제버튼 */
.btn-reset {
    display: none;
    position: absolute;
    top: 12px;
    right: 10px;
    width: 24px;
    height: 24px;
    background: url(../images/btn/btn_inp_reset.png) 0 0 no-repeat;
}

.align_center{
	text-align:center;
	margin: 50px;
	padding:50px;
}
.board-basic{
	font-weight:bold;
}

/* 첨부파일 영역 스타일적용 END */
</style>
<script type="text/javascript">

/************************ 
* 함수설명 : 등록버튼 클릭 이벤트
*************************/ 
function regGameMatchBoard(){
	
	var inptTitle   = $('#title').val();
	var inptContent = $('#txtArea_content').val();
	var chkStatus   = $('input[name="status"]:checked').val();
	var chkBoardType = $('input[name="boardType"]:checked').val();
	//var chkBoardType =$('input[name="boardType"]:checked').val();
	// 유효성 검사 함수 호출
	if(validation()){
		// confirm 함수는 확인창 결과값으로 TRUE와 FALSE 값을 RETURN 하게 됨.
		if(confirm("게시글을 등록하시겠습니까?")){	
		// 게시글 저장 submission 정보 세팅
		// data : getParameter 지정 값   : 값
		var formDoc = $("#frm").serialize();
		
		$.ajax({
			type: "POST",
			url : "gamematchboard.regInfo",
			data : formDoc,
			success:function(res){
				alert("게시글이 정상적으로 등록되었습니다.");
				location.href= "gamematchboard.list";
				/*if(res == "success"){
					alert("게시글이 정상적으로 등록되었습니다.");
					location.href="gamematchboard.list";
				}else{
					alert("게시글 등록 중 오류가 발생하였습니다.");
					return;
				} */
			},
			error:function(e){
				alert("게시글 등록 중 오류가 발생하였습니다.");
				return;
			}
			
		});		
		
	    }
	}
}

/********************************* 
* 함수설명 : 경기게시판 등록 시 유효성 검사(필수값)
**********************************/
function validation(){
	
	// 각 필드 필수값 체크
	var content = $("#txtArea_content").val();
	
	// 경기게시판 제목 체크
	if($("#title").val() == ""){ 
		alert("제목을 입력하세요.");
		$("#title").focus();
		return;
	}
	// 라디오버튼 (게시여부) 체크여부 확인
	if( !$('input[name="status"]').is(':checked') ){
		alert("게시여부를 선택해주세요.");
		return;
	}
	
	// 경기게시판 내용 체크
	if($("#txtArea_content").val() == ""){
		alert("경기게시판 내용을 입력해주세요.");
		$("#txtArea_content").focus();
		return;
	}	
	
	// 경기게시판 제목 글자수 체크
	if($("#title").val().length > 40){ 
		alert("경기게시판 제목은 최대 40자까지만 입력 가능합니다.");
		$("#title").focus();
		return;
	}
	
	// 경기게시판 내용 글자수 체크
	if(content.length > 400){
		$("#txtArea_content").val($("#txtArea_content").val().substring(0, 400));
		alert("경기게시판은 400자까지만 입력 가능합니다.");
		return;
	}
	return true;
}

/*********************************** 
* 함수설명 : 경기게시판 내용 글자 count하는 부분
************************************/
function countText(){

	var content = $("#txtArea_content").val();
	// 글자수 세기
	if(content.length == 0 || content == ''){
		$('#spn_textcount').text('0/400');
	}else{
		$('#spn_textcount').text(content.length + '/400');
	}
	
	// 글자 수 제한
	if(content.length > 400){
		$("#txtArea_content").val($("#txtArea_content").val().substring(0, 400));
		alert("자유게시판은 400자까지만 입력 가능합니다.");
		return;
	}
}

// 첨부파일
function upload(){
		//debugger
		console.log( $("#file_110") );
		console.log($("#file_110")[0].files[0].name);
		
		// 파일명 받기
		var fileName = "";
		if( typeof $("#file_110")[0] != "undefined"){
			fileName = $("#file_110")[0].files[0].name;
		}
		
		// 파일명 upload 영역의 fileName_110인 요소에 세팅하기
		$("#fileName_110").val(fileName);
		alert("첨부파일이 선택되었습니다.");
	}	
function resetfile(ths){
	
	var ths = $(ths);
	ths.parents("tr").cancel();
	alert("첨부파일이 삭제되었습니다.");
	}		
	

/*  function boardType(){
	var chkBoardType = $('input[name="boardType"]:checked').val();	
	// 라디오버튼 (게시여부) 체크여부 확인
	if( !$('input[name="boardType"]').is(':checked') ){
		alert("게시유형여부를 선택완료했습니다.");
		return;	
}  */
	

</script>

</head>
<body>

<div class="container">
	
	<jsp:include page="../common/header.jsp"/>
	<br>
	<div class="align_center">
		<h2 class="board-basic">경기게시판</h2>
	</div>
	
	<!-- FORM 영역 START -->
	<form id="frm" action="gamematchboard.regInfo" >
		<table class="table-light table-striped text-center" width="100%">
			<tr>
				<th class="th_left"><span>제목</span></th>
				<td><input type="text" id="title" name="boardTitle" maxlength="26" style="width:650px;"/></td>
			</tr>
			
       <tr>
       		<!-- 게시여부 영역  STRT -->
           	<th class="th_left"><span>게시여부</span></th>
				<td>
					<div class="radio-btn-wrap" id="gamematchboard_rdo_wrap">
						<span class="radio-btn">
							<input type="radio" id="rdo_statusY" name="status" checked="" value="Y">	
								<label for="rdo_statusY">게시</label>
						</span>
								
						<span class="radio-btn">	
							<input type="radio" id="rdo_statusN" name="status" value="N">	
								<label for="rdo_statusN">미게시</label>
						</span>
					</div>
	            </td>
            <!-- 게시여부 영역  END -->
            
        </tr>			
			
       <tr>
            <th><span>내용</span></th>
            <td>
                <textarea rows="10" cols="30" id="txtArea_content" name="boardContent" onkeyup="countText();"></textarea>
            </td>
        </tr>
        
        <tr>  
        	<td></td>   
            <td>
            	<span id="spn_textcount">0/400</span>
            </td>
            <td></td>
        </tr>
         
         
    <tr>
		<th class="th_left"><span>게시판 유형</span></th>
		<td>
				<div class="radio-btn-wrap" id="freboard_rdo_wrap">
					<span class="radio-btn">
						<input type="radio" id="boardType" name="boardType" checked="" value="B">	
							<label for="rdo_statusY">경기게시판ㅠ</label>
					</span>
				</div>
            </td>
	</tr>
         
         
	  <!-- 첨부파일 전체영역 START -->         
		<tr data-attr_seq="194" data-attr_disp_form_cd="FD" data-attr_calc_typ_cd="null" data-attr_mndt_inpt_yn="Y">	
			<th><span>첨부파일</span></th>	
			
			<td>
				<div class="filebox">	
					<label for="file_110" tabindex="0">파일선택</label>	
						<input type="file" id="file_110" name="fileUpload" data-file_id="110" tabindex="-1" onchange="upload();">	
						<input type="hidden" id="apndFileId_110" data-attr_item_sno="" data-prod_id="">	
					
					<!-- 업로드 영역 START -->
					<div class="upload-box">    
						<input type="text" id="fileName_110" name="filePath" class="upload-name inp" placeholder="선택된 파일 없음" title="선택된 파일 없음" readonly="">
						<button type="button" id="fileReset" class="btn-reset" onclick="resetfile(this);">삭제</button>	
					</div>
					<!-- 업로드 영역 END -->
					<form>   
 						<input type = "file" name = "originName"/>
					</form>
					<form>   
 						<input type = "file" name = "changeName"/>
					</form>
					
					
				</div>
					
					<ul class="list-text interval bullet">	
						<!-- <li>허용 파일 형식 : pdf, jpg/jpeg, png, gif, doc/docx, hwp (15MB 미만)</li> -->
					</ul>	
			</td>
		</tr> 
		<!-- 첨부파일 전체영역 END -->      
        <tr>
            <td colspan="2">
                <input type="button" id="save"   class="btn btn-primary" value="등록" onclick="regGameMatchBoard();"/>
                <input type="button" id="cancle" class="btn btn-light"   value="취소" onclick="history.back();"/>
            </td>
        </tr>		
		</table>
	
	</form>
	<!-- FORM 영역 END -->

	</div>




</body>
</html>