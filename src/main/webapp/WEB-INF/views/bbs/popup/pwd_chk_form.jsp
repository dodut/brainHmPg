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
}

// title태그 수정
jQuery(document).ready(function() {
	$('title').html($('#wrap .title').text());
				window.resizeTo(500,370);
	});


</script>

<iframe src="" width="100%" height="0" frameborder="0" name="ok_frame" id="ok_frame"></iframe>


<div class="wrap" id="wrap">
	<div class="password_confirm container">
		<h1 class="title">패스워드 확인</h1>

		<form name="edit_form" method="post" action="pwd_chk_exec.php" onsubmit="return edit_form_chk()" target="ok_frame">
		<input type="hidden" name="idx" value="8014"/>
		<input type="hidden" name="board_idx" value=""/>
		<input type="hidden" name="list_mode" value="board"/>
		<input type="hidden" name="board_code" value="sub3_2"/>
		<input type="hidden" name="keyfield" value=""/>
		<input type="hidden" name="key" value=""/>
		<input type="hidden" name="page" value="1"/>
		<input type="hidden" name="id_list" value=""/>
		<input type="hidden" name="me_popup" value="0"/>
		<input type="hidden" name="auto_frame" value=""/>
		<input type="hidden" name="pwd_mode" value="board_secret"/>
		<fieldset>
			<legend class="blind">Password confirm form</legend>
			<div class="txt">
				<strong>본 게시글은 패스워드가 설정되어 있습니다.</strong><br/>
				<strong class="red">패스워드</strong>를 입력하세요.			
			</div>

			<div class="formbox">
				<label for="ipt_password">패스워드</label>
				<input type="password" name="passwd" class="ipt_password" id="ipt_password"/>
			</div>

			<div class="btngroup">
				<input type="submit" value="확인" class="ibtn"/>
				<input type="button" value="닫기" class="ibtn" onclick="javascript:window.close();"/>
			</div>
		</fieldset>
		</form>
	</div>
</div>

</body>
</html>