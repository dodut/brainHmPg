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
        
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.min.js" type="text/javascript"></script>
        
        <script type="text/javascript">
        	function updatePop(idx) {
        		window.open('/bbs/popup/ct_update_form?seq='+idx, '담당자 안내 수정', 'width=600, height=400, top=200, left=500');
        	}
        	
        	$(document).ready(function() {
        		var rows = $("#table_body >tr").length;
        		//console.log(rows);
        		
        		var prevVal1 = new Array(); //seq
        		var prevVal2 = new Array(); //ord 초기값
        		$("input[id=seq]").each(function(index, item) {
        			prevVal1.push($(item).val());
        		});
        		$("input[id=ord]").each(function(index, item) {
        			prevVal2.push($(item).val());
        		});
        		
        		
        		
        		$("#updateBtn").click(function() {
        			var nextVal = new Array(); //ord 변경값
        			
        			$("input[id=ord]").each(function(index, item) {
        				nextVal.push($(item).val());
        			});
        			
        			console.log("    seq: " + prevVal1);
        			console.log("기존 ord: " + prevVal2);
        			console.log("변경 ord: " + nextVal);
        			

	        		
       				var sendVal = new Array(); //ajax로 보낼 값 (변경된 값)
	        		for(i = 0; i < rows; i++) {
	        			if(prevVal2[i] != nextVal[i]) {
	        				sendVal.push(prevVal1[i], nextVal[i]);
	        			}
	        		}
	        		//console.log(sendVal);
	        		var seqData = new Array();
	        		var ordData = new Array();
	        		for(i = 0; i < sendVal.length; i++) {
	        			if((i % 2) == 1) {
	        				ordData.push(sendVal[i]);
	        			} else {
	        				seqData.push(sendVal[i]);
	        			}
	        			
	        		}
// 	        		console.log("seqData :" + seqData);
// 	        		console.log("ordData :" + ordData);
	        		
	        		
        			
	        		$.ajax({
	        			url: "/admin3_3",
	        			type: "POST",
	        			data: {"seq": seqData, "ord": ordData},
	        			dataType: "",
	        			success: function(data) {
	        				console.log("전달 완료");
	        			},
	        			error: function(request, status, error) {
	        				console.log("실패");
	        				//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

	        			}
	        		});
	        	})
        	});
        	
        </script>
    </head>
    <body>
        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">관리자페이지</div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">연혁&실적관리</a>
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
                    <table class="st_mybd_list">
						<colgroup>
							<col style="width:15%;">
							<col style="width:*;">
							<col style="width:12%;">
							<col style="width:28%;">
							<col style="width:10%;">
							<col style="width:10%">
						</colgroup>
					
						<thead>
							<tr>
								<th scope="col">부서명</th>
								<th scope="col">담당 업무</th>
								<th scope="col">내선 번호</th>
								<th scope="col">메일</th>
								<th scope="col">순서</th>
								<th></th>
							</tr>
						</thead>
					
						<tbody id="table_body">
							<c:forEach items="${ctList}" var="ctItem">
								<tr>
									<td>
										<input type="hidden" id="seq" value="${ctItem.ctseq }" />
<%-- 										<input type="hidden" id="ord" value="${ctItem.ctord }" /> --%>
										${ctItem.ctpart}
									</td>
									<td>${ctItem.ctchr}</td>
									<td>
										<c:set var="ctphone" value="${ctItem.ctphone}" />
											${fn:substring(ctphone, 0, 2)}-${fn:substring(ctphone, 2, 5)}-${fn:substring(ctphone, 5, 9)}
									</td>
									<td><a href="mailto:${ctItem.ctmail}" target="_blank">${ctItem.ctmail}</a></td>
									<td><input type="text" id="ord" value="${ctItem.ctord}" style="width:60px;" /></td>
									<td>
										<input type="button" value="수정" onclick="updatePop('${ctItem.ctseq}')">
										<input type="button" value="삭제" onclick="deletePop();">
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
                </div>
            <input type="button" id="updateBtn" value = "순서 수정"  />
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>

