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

</style>

<script type="text/javascript">

/************************ 
* 함수설명 : 등록버튼 클릭 이벤트
*************************/ 
function regGameMatchBoard(){
	
	var inptTitle   = $('#title').val();
	var inptContent = $('#txtArea_content').val();
	var chkStatus   = $('input[name="status"]:checked').val();
	
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
		alert("자유게시판 내용을 입력해주세요.");
		$("#txtArea_content").focus();
		return;
	}	
	
	// 자유게시판 제목 글자수 체크
	if($("#title").val().length > 40){ 
		alert("자유게시판 제목은 최대 40자까지만 입력 가능합니다.");
		$("#title").focus();
		return;
	}
	
	// 경기게시판 내용 글자수 체크
	if(content.length > 400){
		$("#txtArea_content").val($("#txtArea_content").val().substring(0, 400));
		alert("자유게시판은 400자까지만 입력 가능합니다.");
		return;
	}
	return true;
}

/*********************************** 
* 함수설명 : 자유게시판 내용 글자 count하는 부분
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

function boardType(){
	
}


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
            <th><span>내용</span>	</th>
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
						<button type="button" id="fileReset" class="btn-reset"><span class="blind">삭제</span></button>	
					</div>
					<!-- 업로드 영역 END -->
				</div>
					
					<ul class="list-text interval bullet">	
						<!-- <li>허용 파일 형식 : pdf, jpg/jpeg, png, gif, doc/docx, hwp (15MB 미만)</li> -->
					</ul>	
			</td>
		</tr> 
		<!-- 첨부파일 전체영역 END -->               
	<tr>
		<th><span>게시판 유형</span></th>
	<tr>
			<td>
				<div class="boardTypebox">	
				<!-- 경기게시판 B -->
					  <label for="boardType_110" tabindex="0">경기게시판B</label>	
						<input type="checkbox" id="apndboardTypeId_110"  data-file_id="110" tabindex="-1" button="boardType();">
				</div>
			</td>
	
				
	
	
	
	
	</tr>
          	<!-- 	<li><div class="boardTypebox">	
					<label for="file_110" tabindex="0">게시판유형선택</label>	
						<input type="radio" id="boardType_110" name="boardType" data-file_id="110" tabindex="-1" onchange="boardType();">	
						<input type="hidden" id="apndboardTypeId_110" data-attr_item_sno="" data-prod_id="">	
			</div></li> -->       
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