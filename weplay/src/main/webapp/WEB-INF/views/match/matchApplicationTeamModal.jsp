<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WEPLAY:TeamModal</title>

</head>
<body>
	
	<div class="modal" id="teamModal">
		<div class="modal-dialog modal-xl">
		    <div class="modal-content">
		
			      <!-- Modal Header -->
			    <div class="modal-header">
				    <h4 class="modal-title">팀 검색</h4>
				    <button type="button" class="close" data-dismiss="modal">&times;</button>
			    </div>
			
			    <!-- Modal body -->
			    <div class="modal-body">
			        <div class="modal-search-area">
			        	<b>지역 : </b>
			            <label for="sido">시도:</label>
			            <select id="sido">
							<option value="all" selected>전체</option>
			            </select>
			            <label for="sigungu">시군구:</label>
			            <select id="sigungu">
			                <option value="all" selected>전체</option>
			            </select>
			            <br>
			        	<input type="text" id="keyword" placeholder="검색어 입력"/>
			        	<button type="button" id="searchByKeyword" class="btn btn-sm btn-dark">검색</button>
			        
			        </div>
			        <div id="teams-area">
			        	<div id="team-result-area">
			        	</div>
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
			            <div id="team-page-area">
			            	
			            </div>
			
			        </div> <!-- #teams-area -->
			        
			    </div>
			
			    <!-- Modal footer -->
			    <div class="modal-footer">
		        	<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
		      	</div>
		
		    </div>
		</div>
	</div>
	
	<script>
		const page = 1;
		$(() => {
			selectCities();
			
			// 시도 선택시 시도에 맞는 시군구를 가져옴
			$('#sido').change(() => { 
				if($('#sido').val() != 'all' && $('#sido').val() != '세종'){
					selectDistricts();
				}
				else{
					$('#sigungu').html(optionAll);
				}
				selectTeams(page);
			});
			$('#sigungu').change(() => { 
				selectTeams(page);
			});
			
			$('#searchByKeyword').click(() => {
				selectTeams(page);
			});
			
			$('#teams-area tbody').on('click', '.chooseTeam', function() {
				const $teamTds = $(this).parent().parent().children();
				
				$('#away-team').val($teamTds.eq(0).val());
				$('#away-teamName').html('<h2>' + $teamTds.eq(2).text() + '</h2>');
			});
			
			$('#search-team-btn').click(() => {
				$('#sido').val('all');
				$('#sigungu').html(optionAll);
				$('#keyword').val('');
				selectTeams(page);
			})
			
		});
	
		function selectTeams(page){ // 팀 목록 조회	
			$.ajax({
				url : 'teams/' + page,
				type : 'get',
				data : {
					sido : $('#sido').val(),
					sigungu : $('#sigungu').val(),
					keyword : $('#keyword').val()
				},
				success : result => {
					const pageInfo = result[0];
					const teams = result[1];
					
					$('#team-result-area').html(createTeamResult(pageInfo.listCount));
	
					if(teams.length == 0){
						const teamTrEmpty = '<tr><td colspan="9">조회된 팀이 없습니다.</td></tr>';
						$('#teams-area tbody').html(teamTrEmpty);
						$('#team-page-area').html('');
					}
					else{
						$('#teams-area tbody').html('');
						for(let i in teams){
							const teamTr = createTeamTr(teams[i]);
							$('#teams-area tbody').append(teamTr);
						}
						const pageUl = pagination(pageInfo);
						
						$('#team-page-area').html(pageUl);
						
					}
				}
			});
		}
	
		function createTeamResult(listCount){
			const $keyword = $('#keyword').val();
			const $sido = $('#sido').val();
			const $sigungu = $('#sigungu').val();
			
			let result = '';
			if($keyword == ''){
				result = '조회 결과 : ';
			}
			else{
				result = '<b>' + $keyword + '</b> 검색 결과 : ';
			}
			result += '<b>' + listCount + '</b>팀';
	
			if($sido != 'all' && $sigungu == 'all'){
				result += '(' + $sido + ')';
			}
			else if($sigungu != 'all' && $sigungu != 'all'){
				result += '(' + $sido + ' ' + $sigungu + ')';
			}
			return result;
		}
	
		function createTeamTr(team){ // 팀 테이블 행 생성 메소드
			const teamTr = document.createElement('tr');
			teamTr.setAttribute("class", "team-tr");
	
			const keys = Object.keys(team);
				
			for (let i in keys) {
				const key = keys[i] // 각각의 키
				const value = team[key] // 각각의 키에 해당하는 각각의 값
				
				if(i == 0){ // teamNo => input:hidden
					const teamNo = document.createElement("input");
					teamNo.setAttribute("class", "teamNo");
					teamNo.setAttribute("type", "hidden");
					teamNo.setAttribute("value", value);
					teamTr.appendChild(teamNo);
				}
				else{
					const td = document.createElement('td');
					td.innerText = value;
					teamTr.appendChild(td);
				}
			}
			const td = document.createElement('td');
			td.innerHTML = '<button type="button" class="btn btn-sm btn-success chooseTeam" data-dismiss="modal">선택</button>';
			teamTr.appendChild(td);
			
			return teamTr;
		}
	
		function pagination(pageInfo){ // 페이징 처리
		    		
		    const pageUl = document.createElement('ul');
		    pageUl.setAttribute("class", "pagination justify-content-center");
		    		
		    const moveLi = document.createElement('li');
		    moveLi.setAttribute("class", "page-item");
		    
		    if(pageInfo.currentPage != 1){
		    	moveLi.innerHTML = '<a class="page-link" onclick="selectTeams(' + (pageInfo.currentPage - 1) + ');">이전</a>';
		  		pageUl.appendChild(moveLi);
		    }
		    
		    for(let i = pageInfo.startPage; i <= pageInfo.endPage; i++){
		  		
		  	const pageLi = document.createElement('li');
		    	if(i == pageInfo.currentPage){
		  			pageLi.setAttribute("class", "page-item active");
		    	}
		    	else{
		    		pageLi.setAttribute("class", "page-item");
		    	}
		  		pageLi.innerHTML = '<a class="page-link" onclick="selectTeams(' + i + ');">' + i + '</a>';
		  		pageUl.appendChild(pageLi);
		    }
		    
		    if(pageInfo.maxPage > pageInfo.currentPage){
		    	moveLi.innerHTML = '<a class="page-link" onclick="selectTeams(' + (pageInfo.currentPage + 1) + ');">다음</a>';
		  		pageUl.appendChild(moveLi);
		    }
		    
		    return pageUl;
		}
	</script>
</body>
</html>