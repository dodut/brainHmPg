<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
<meta http-equiv="imagetoolbar" content="no"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
<title>패스워드 확인</title>
<script type="text/javascript" src="/img_up/_addon/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/all_default.js"></script>

<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>

<link rel="stylesheet" type="text/css" href="/bbs_shop/popup/css/style.css" />
<script type="text/javascript">
if(window.console == undefined)
{
    console = { log : function(){} };
}
function log(o)
{
	console.log(o);
}
</script>
</head>
<body>
<div id="tmp_id_win" style="display:none;">
<iframe src="" width=600 height=100 style='border:0' title='' name="ok_frame" id="ok_frame"></iframe>
</div>
<script type="text/javascript">

function edit_form_chk(){
	var form = document.edit_form;
	
	if(!form.passwd.value){
		alert("암호를 입력하세요.");
		form.passwd.focus();
		return false;
	} 
	else {
		ajax_check_pwd_Proc();
	}
} 

function ajax_check_pwd_Proc(){
	var form = document.edit_form;
	var json = { "seq" : $("#seq").val(), "passwd" : $("#passwd").val() };

	$.ajax({
		type: "POST",			
		url: "/bbs/checkPwProc", // 호출할 주소
		contentType: "application/json",
		data: JSON.stringify(json),
	    dataType: "json", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
	    
	    success: function(data) { // 결과 받기
	        //console.log(data.status); 
	       
	        if(data.status == 200){
	        	//console.log("OK");
	        	opener.goViewPage($("#seq").val());	// 부모창 호출
				//location.href="/bbs/sub3_2_view";  // 해당 view 페이지로 이동
	        	window.close();   // 창 닫기
	        	
		        
	        } else{
	        	
	        	alert("암호가 일치하지 않습니다.\n\n암호는 대/소문자까지 정확하게 입력해주시기 바랍니다.");
	        	form.passwd.focus();
	        }

	    },
	    error:function(error){
	    	console.log(error);
		}
	});	 
}

 

// title태그 수정
/* jQuery(document).ready(function() {
	$('title').html($('#wrap .title').text());
		window.resizeTo(500,370);
	}); */

	
</script>

<iframe src="" width="100%" height="0" frameborder="0" name="ok_frame" id="ok_frame"></iframe>


<div class="wrap" id="wrap">
	<div class="password_confirm container">
		<h1 class="title">패스워드 확인</h1>

<!-- 		<form name="edit_form" method="post" action="/bbs/checkPwProc" onsubmit="return edit_form_chk();" target="ok_frame"> -->
		<form name="edit_form" >
		<input type="hidden" name="seq" id="seq" value="${seq}"/>
		<fieldset>
			<legend class="blind">Password confirm form</legend>
			<div class="txt">
				<strong>본 게시글은 패스워드가 설정되어 있습니다.</strong><br/>
				<strong class="red">패스워드</strong>를 입력하세요.			
			</div>

			<div class="formbox">
				<label for="ipt_password">패스워드</label>
				<input type="password" name="passwd" id="passwd" class="ipt_password" />
			</div>

			<div class="btngroup">
				<input type="button" value="확인" class="ibtn" onclick="javascript:edit_form_chk()"/>
				 				
				<!-- <input type="submit" value="확인" class="ibtn"/> -->
				<input type="button" value="닫기" class="ibtn" onclick="javascript:window.close();"/>
			</div>
		</fieldset>
		</form>
	</div>
</div>

</body>
</html>