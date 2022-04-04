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
	    .rg-table{margin:20px; width:500px;border-spacing:0;font-size:12px;color:#333}
		.rg-table>tbody>tr>th,
		.rg-table>tbody>tr>td,
		.rg-table>tfoot>tr>th,
		.rg-table>tfoot>tr>td{padding:10px 8px;vertical-align:middle;border-width:0;border-bottom-width:1px;border-color:#ccc;border-style:solid}
		.rg-table>tbody>tr>th,.rg-table>tbody>tr>td{color:#555}
		
		.st_mybd_btn.st_mybd_medium {height:35px;padding:6px 20px 8px}
		p {margin-left: 20px; font-size:8pt; color:red; font-weight:bold;}
		.btn_content {text-align: center;}
    </style>
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">
    
	$(document).ready(function() {
		
		// 날짜 세팅
		var today = new Date();
		var today_year = today.getFullYear();
		var today_month = today.getMonth()+1;
		var today_day = today.getDate();
       
		var now_year = '';
		for (var i=(today_year-20); i <= today_year; i++) {
			now_year += $(".now_y").append("<option value='" + i + "'>" + i + "</option>");
		}
       
		var now_month = '';
		for (var i=1; i <= 12; i++) {
			now_month += $(".now_m").append("<option value='" + i + "'>" + i + "</option>");
		}
       
		var now_day = '';
		for (var i=1; i <= 31; i++) {
			now_day += $(".now_d").append("<option value='" + i + "'>" + i + "</option>");
		}
        
        var his_year = '';
        for (var i=(today_year-20); i <= today_year; i++) {
        	his_year += $(".his_y").append("<option value='" + i + "'>" + i + "</option>");
        }
       
		var his_month = '';
		for (var i=1; i <= 12; i++) {
			his_month += $(".his_m").append("<option value='" + i + "'>" + i + "</option>");
		}
       
	});    	
    
    function his_form_chk(){
    	var form = document.his_form;

//     	if(!form.now_y.value) {
//     		alert("등록일(연도)을 입력하세요.");
//     		return false;
//     	}
    	
//     	if(!form.now_m.value) {
//     		alert("등록일(월)을 입력하세요.");
//     		return false;
//     	}
    	
//     	if(!form.now_d.value) {
//     		alert("등록일(일자)을 입력하세요.");
//     		return false;
//     	}
    	
//     	if(!form.his_y.value) {
//     		alert("날짜(연도)를 입력하세요.");
//     		return false;
//     	}

//     	if(!form.his_m.value) {
//     		alert("날짜(월)를 입력하세요.");
//     		return false;
//     	}

    	if(!form.hiscntn.value) {
    		alert("내용을 입력하세요.");
    		form.hiscntn.focus();
    		return false;
    	}
    	
    	return true;
    }
    
    </script>
    
</head>

<body onbeforeunload="opener.location.reload();">
	<div>
		<form name='his_form' onSubmit='return his_form_chk()' action="/bbs/popup/his_update_form" method="post">
		
			<table class="rg-table rg-form rg-responsive">
				<colgroup>
					<col style="width:130px;">
					<col style="width:*;">
				</colgroup>
			
				<tbody>
					<c:forEach items="${hisData}" var="hItem">
					<tr>
						<th>등록일</th>
						<td>
							<input type="hidden" name="seq" value="${hItem.seq }" />
							<select name="now_y" class="now_y">
								<c:forEach var="now_y_item" varStatus="i" begin="2002" end="2022" step="1">
									<c:set var="rgdtm_year" value="${hItem.rgdtm}" />
									<option value="${now_y_item}" <c:if test="${fn:substring(rgdtm_year, 0, 4) eq now_y_item}">selected</c:if>>
									${now_y_item}
									</option>
								</c:forEach>
							</select> 년
							
							<select name="now_m" class="now_m">
								<c:forEach var="now_m_item" varStatus="i" begin="1" end="12" step="1">
									<c:set var="rgdtm_month" value="${hItem.rgdtm}" />
									<option value="${now_m_item}" <c:if test="${fn:substring(rgdtm_month, 5, 7) eq now_m_item}">selected</c:if>>
									${now_m_item}
									</option>
								</c:forEach>
							</select> 월
							
							<select name="now_d" class="now_d">
								<c:forEach var="now_d_item" varStatus="i" begin="1" end="31" step="1">
									<c:set var="rgdtm_day" value="${hItem.rgdtm}" />
									<option value="${now_d_item}" <c:if test="${fn:substring(rgdtm_day, 8, 10) eq now_d_item}">selected</c:if>>
									${now_d_item}
									</option>
								</c:forEach>
							</select> 일
						</td>
					</tr>
					<tr>
						<th>날짜</th>
						<td>
							<select name="his_y" class="his_y">
								<c:forEach var="his_y_item" varStatus="i" begin="1980" end="2022" step="1">
									<option value="${his_y_item}" <c:if test="${hItem.hisyear eq his_y_item}">selected</c:if>>
									${his_y_item}
									</option>
								</c:forEach>
							</select> 년
								
							<select name="his_m" class="his_m">
								<c:forEach var="his_m_item" varStatus="i" begin="1" end="12" step="1">
									<option value="${his_m_item}" <c:if test="${hItem.hismonth eq his_m_item}">selected</c:if>>
									${his_m_item}
									</option>
								</c:forEach>
							</select> 월
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<input type="text" name="hiscntn" value="${hItem.hiscntn}" style="width:100%;">
						</td>
					</tr>
					
					</c:forEach>
				</tbody>
			</table>
			
			<p>※ 모든 정보를 입력해야 정상적으로 수정 완료 됩니다!</p>
			<p>※ 팝업을 닫으면 추가 사항이 반영됩니다.</p>

			<div class="btn_content">	
				<button type="submit" id="submitBtn" class="st_mybd_btn st_mybd_medium">수정</button>
				<button type="button" id="deleteBtn" class="st_mybd_btn st_mybd_medium" onclick="javascript:opener.location.reload();window.close();">취소</button>
			</div>
		</form>
		
		
	</div>

</body>
</html>