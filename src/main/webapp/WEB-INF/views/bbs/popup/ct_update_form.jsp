<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    
    <script type="text/javascript">
    
    function ct_form_chk(){
    	var form = document.ct_form;

    	if(!form.ctpart.value) {
    		alert("부서명을 입력하세요.");
    		form.ctpart.focus();
    		return false;
    	}
    	
    	if(!form.ctchr.value) {
    		alert("담당 업무를 입력하세요.");
    		form.ctchr.focus();
    		return false;
    	}

    	if(!form.ctphone.value) {
    		alert("내선 번호를 입력하세요.");
    		form.ctphone.focus();
    		return false;
    	}
    	
    	var phone_chk = /^[0-9]*$/;
    	if(!phone_chk.test(form.ctphone.value)) {
    		alert("내선 번호는 숫자만 입력할 수 있습니다.");
    		form.ctphone.focus();
    		return false;
    	}
    	
    	if(!form.ctmail.value) {
    		alert("메일을 입력하세요.");
    		form.ctmail.focus();
    		return false;
    	}

    	return true;
    }
    
    
    </script>
    
</head>

<body onbeforeunload="opener.location.reload();">
	<div>
		<form name='ct_form' onSubmit='return ct_form_chk()' action="/bbs/popup/ct_update_form" method="post">
		
			<table class="rg-table rg-form rg-responsive">
				<colgroup>
					<col style="width:130px;">
					<col style="width:*;">
				</colgroup>
			
				<tbody>
					<c:forEach items="${ctData}" var="ctItem">
					<tr>
						<th>부서명</th>
						<td>
							<input type="hidden" name="seq" value="${ctItem.ctseq }" />
							<input type="text" name="ctpart" id="part" value="${ctItem.ctpart}" style="width:100%;" />
						</td>
					</tr>
					<tr>
						<th>담당 업무</th>
						<td>
							<input type="text" name="ctchr" id="chr" value="${ctItem.ctchr}" style="width:100%;" />
						</td>
					</tr>
					<tr>
						<th>내선 번호</th>
						<td>
							<input type="text" name="ctphone" id="phone" value="${ctItem.ctphone}" style="width:100%;" />
						</td>
					</tr>
					<tr>
						<th>메일</th>
						<td>
							<input type="text" name="ctmail" id="mail" value="${ctItem.ctmail}" style="width:100%;" />
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