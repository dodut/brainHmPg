<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>관리자 페이지</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        
        <style type="text/css">
       		.btnDiv {margin:10px;}
        	.st_mybd_list {width:1100px;border-top:2px solid #a5a5a5;border-bottom:1px solid #a5a5a5;background:#fff;border-collapse:separate;border-spacing:0}
        	.st_mybd_list thead tr {text-align: center;}
			.st_mybd_list thead tr th {position:relative;height:40px;border-bottom:1px solid #a5a5a5;font-size:13px;color:#333333}
			.st_mybd_list thead tr th:before {content:'';display:block;position:absolute;top:0;left:0;width:1px;height:12px;background:#a5a5a5}
			.st_mybd_list thead tr th:first-child:before {display:none}
			.st_mybd_list tbody tr td {height:20px;padding:10px 5px;border-top:1px solid #e4e4e4;font-size:13px;color:#666666;text-align:center;line-height:20px;letter-spacing:-.03em}
			.st_mybd_list tbody tr:hover td {background:#fafafa}
			.st_mybd_list tbody tr:first-child td {border-top:0}
			.st_mybd_list tbody tr td.st_mybd_subject {padding-left:10px;text-align:center}
			.st_mybd_list tbody tr td a {color:#666666}
			.st_mybd_list tbody tr td a:hover {color:#444444}
			.st_mybd_list tbody tr td.st_mybd_none_data {text-align:center;line-height:150px}
			.st_mybd_list tbody tr td .secret_icon {margin-left:4px}
			
			/* 버튼 */
			.st_mybd_btn {box-sizing:border-box;display:inline-block;position:relative;height:28px;margin:0;padding:3px 15px;border:1px solid #dfdfdf;background:#dfdfdf;font-family:'Malgun Gothic', sans-serif;font-size:13px;font-weight:bold;color:#5f5f5f;line-height:20px;text-decoration:none;cursor:pointer}
			.st_mybd_btn:hover:before {content:'';display:block;position:absolute;top:0;bottom:0;left:0;right:0;background:rgba(0, 0, 0, .05)}
			.st_mybd_btn.st_mybd_small {height:25px;padding:1px 10px;font-size:11px}
			.st_mybd_btn.st_mybd_medium {height:35px;padding:6px 20px 8px}
			.st_mybd_btn.st_mybd_big {height:45px;padding:12px 30px}
			.st_mybd_btn.st_mybd_highlight {border:1px solid #4e4e4e;background:#4e4e4e;color:#ffffff}
			.st_mybd_btn.st_mybd_highlight:hover:before {background:rgba(255, 255, 255, .15)}
			
			/* pagenate */
			.paginate strong {border:1px solid #aaa;background:white;color:#83878a;}
			.paginate{margin:0;padding:1em 0;text-align:center;}
			.paginate a,.paginate strong{display:inline-block;width:36px;height:36px;line-height:36px;vertical-align:middle;font-size:.875em;font-family:Arial,sans-serif;margin:0 .2em}
			.paginate strong{font-weight:normal;}
			.paginate .dir{font-family:Tahoma,sans-serif;font-size:1em}
			
        </style>
        
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.min.js" type="text/javascript"></script>
        <script type="text/javascript">
	        function insertPop() {
	    		window.open('/bbs/popup/his_insert_form', '연혁 & 실적 추가', 'width=600, height=300, top=200, left=500');
	    	}
	    	
	    	function updatePop(idx) {
	    		window.open('/bbs/popup/his_update_form?seq='+idx, '연혁 & 실적 수정', 'width=600, height=330, top=200, left=500');
	    	}
	    	
	    	function deletePop(idx) {
	    		if(confirm("정말 삭제하시겠습니까?") == true) {
	        		location.href='/admin1_2/delete?seq='+idx;
	        		alert("삭제가 완료되었습니다.");
	        		
	    		} else {
	    			return false;
	    		}
	    	}
	    	
// 	    	function apiPop() {
// 	    		window.open('/bbs/popup/map', '지도', 'width=700, height=500, top=200, left=500');
// 	    	}
	    	
	    	$(document).ready(function() {
        		var rows = $("#table_body >tr").length;
        		var prevVal1 = new Array(); //seq
        		var prevVal2 = new Array(); //ord 초기값
        		
        		$("input[id=seq]").each(function(index, item) {
        			prevVal1.push($(item).val());
        		});
        		
        		$("input[id=ord]").each(function(index, item) {
        			prevVal2.push($(item).val());
        		});
        		
        		
        		// 순서 수정 버튼 클릭 시
        		$("#updateBtn").click(function() {
        			var nextVal = new Array(); //ord 변경값
        			
        			$("input[id=ord]").each(function(index, item) {
        				nextVal.push($(item).val());
        			});

	        		
       				var sendVal = new Array(); //ajax로 보낼 값 (변경된 값)
	        		for(i = 0; i < rows; i++) {
	        			if(prevVal2[i] != nextVal[i]) {
	        				sendVal.push(prevVal1[i], nextVal[i]);
	        			}
	        		}
       				
       				if(sendVal.length == 0) {
       					alert("순서 수정에 실패하였습니다.");
       				}
       				
       				// 데이터 분리
	        		var seqData = new Array();
	        		var ordData = new Array();
	        		for(i = 0; i < sendVal.length; i++) {
	        			if((i % 2) == 1) {
	        				ordData.push(sendVal[i]);
	        			} else {
	        				seqData.push(sendVal[i]);
	        			}
	        		}
	        		
        			
	        		$.ajax({
	        			url: "/admin1_2",
	        			type: "POST",
	        			data: {"seq": seqData, "ord": ordData},
	        			dataType: "",
// 	        			contentType: "application/json; charset=utf-8",
	        			success: function(data) {
	        				console.log("전달 완료");
	        				alert("순서가 정상적으로 수정되었습니다.");
	        				window.location.href = "admin1_2";
	        				console.log(seqData);
	        				console.log(ordData);
	        			},
	        			error: function(request, status, error) {
	        				console.log("실패");
	        				alert("일시적인 에러이거나 수정된 순서가 없습니다.");
	        				console.log("code:"+request.status+"\n"+"error:"+error);

	        			}
	        		}); //ajax end
	        		
	        	}); //#updateBtn click end
	        	
        	}); //jquery end
	    	
	    	
        </script>
    </head>
    
    <body>
        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">관리자페이지</div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/admin1_2">연혁&실적관리</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">조직도 관리</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/admin3_3">담당자 안내 관리</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">공지사항 관리</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">문의게시판 관리</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">로그인 사용자 관리</a>
                </div>
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Top navigation-->
                <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <div class="container-fluid">
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                                <li class="nav-item active"><a class="nav-link" href="/sub_main">Home</a></li>
                                <li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- Page content-->
                <div class="container-fluid">
                	<div class="btnDiv">
	           			<input type="button" id="updateBtn" class="st_mybd_btn st_mybd_highlight" value = "순서 수정" />	
	           			<input type="button" id="createBtn" class="st_mybd_btn st_mybd_highlight" value = "추가" onclick="insertPop();"/>
<!-- 	           			<input type="button" id="apiBtn" class="st_mybd_btn st_mybd_highlight" value = "지도" onclick="apiPop();"/> -->
                	</div>
                	
                    <table class="st_mybd_list">
						<colgroup>
							<col style="width:130px;">
							<col style="width:130px;">
							<col style="width:*;">
							<col style="width:130px;">
							<col style="width:90px;">
							<col style="width:130px;">
						</colgroup>
					
						<thead>
							<tr>
								<th scope="col">카테고리</th>
								<th scope="col">날짜</th>
								<th scope="col">내용</th>
								<th scope="col">작성일</th>
								<th scope="col">순서</th>
								<th scope="col"></th>
							</tr>
						</thead>
					
						<tbody id="table_body">
							<c:forEach items="${hList}" var="hItem">
								<tr>
									<td>
										<c:choose>
											<c:when test="${hItem.hisyear lt 2000}">
												2000년 이전
											</c:when>
											<c:when test="${hItem.hisyear le 2010}">
												2001~2010년
											</c:when>
											<c:otherwise>
												2011년~현재
											</c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${fn:length(hItem.hismonth) eq 1 }">
									   			${hItem.hisyear}. 0${hItem.hismonth}
									    	</c:when>
									    	<c:otherwise>
									   			${hItem.hisyear}. ${hItem.hismonth}
									    	</c:otherwise>
									    </c:choose>
									</td>
									<td>${hItem.hiscntn}</td>
									<td>${hItem.rgdtm }</td>
									<td>
										<input type="hidden" id="seq" value="${hItem.seq }" />
										<input type="text" id="ord" value="${hItem.hisord}" style="width:60px;" />
									</td>
									<td>
										<input type="button" value="수정" class="st_mybd_btn st_mybd_small" onclick="updatePop('${hItem.seq}')">
										<input type="button" value="삭제" class="st_mybd_btn st_mybd_small" onclick="deletePop('${hItem.seq}');">
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
                </div> <!-- .container-fluid end -->
                
                <!-- pagenate -->
				<div class="paginate">
					<c:if test="${criteria2.currentPageNo > 1 }">
						<a href="/admin1_2?page=${criteria2.currentPageNo - 1}" class="dir" title="이전"><span>‹</span></a>	
					</c:if>

					<c:forEach var="num" begin="${criteria2.blockBegin}" end="${criteria2.blockEnd}">
						<c:choose>
						<c:when test="${num == criteria2.currentPageNo}">
							<strong>${num}</strong>
						</c:when>
						<c:otherwise>
							<a href='/admin1_2?page=${num}'>${num}</a>
						</c:otherwise>
					</c:choose>
					</c:forEach>
					
					<c:if test="${criteria2.currentPageNo < criteria2.totalPageNo }">
					<a href="/admin1_2?page=${criteria2.currentPageNo + 1}" class="dir" title="다음"><span>›</span></a>	
					</c:if>
				</div>
				
            </div> <!-- #page-content-wrapper end -->
        </div>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>

