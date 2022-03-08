<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=yes"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>ADMIN LOGIN</title>

<link rel="stylesheet" type="text/css" href="/css/login.css" />

	</head>
	<body>
	<form name='login_form' method='post' onSubmit='return login_form_chk()' autocomplete='on' style='margin:0'>
						<input type='hidden' name='referer'>
						<input type='hidden' name='login_type'>
						<input type='hidden' name='mode'>
						<input type='hidden' name='login_lan'>
						<input type='hidden' name='login_admin_mode'>
						<input type='hidden' name='first_url'>
						<input type='hidden' name='smart_design_yn'>
						<input type='hidden' name='smart_design_mode'>
						<input type='hidden' name='this_domain'>
						<input type='hidden' name='post_action'>
						<input type='hidden' name='form_sess_id' value='6iqfbkvlfqnhjqa4itv0fvkl44'>
	<div id="admin_login">
<fieldset>
	<legend>
		<strong>관리자 로그인</strong>
		<em>웹 관리자모드 로그인하세요.</em>
	</legend>
	<p>
		<label for="id">아이디</label>
		<span><input type="text" name="id" id="id" placeholder="아이디" value=""></span>
	</p>
	<p>
		<label for="pwd">비밀번호</label>
		<span><input type="password" name="pwd" id="pwd" placeholder="패스워드" value=""></span>
	</p>
	<nav>
		<button type="submit">로그인</button>
	</nav>
</fieldset>
</div>
</form>
<script>
var LAN = "kr";
</script>
<script type="text/javascript" src="/js/admin.js"></script>
<script language='javascript'>
function trans_lan(lan){
	var iframe_name = create_iframe();
	document.getElementById(iframe_name).src="/admin/sub_main/admin_lan_change_exec.php?demo_id=&sel_lan="+lan;
}

function trans_admin_mode(mode){
	var iframe_name = create_iframe();
	document.getElementById(iframe_name).src="/admin/sub_main/admin_mode_change_exec.php?demo_id=&no_location=1&sel_mode="+mode;
	document.login_form.login_admin_mode.value = mode;
}

function login_form_chk(){
	var form = document.login_form;

	if(!form.id.value)
	{
		alert("아이디를 입력하세요.");
		form.id.focus();
		return false;
	}

	if(!form.pwd.value)
	{
		alert("비밀번호를 입력하세요.");
		form.pwd.focus();
		return false;
	}


	var default_action = '/admin/sub_login/login_ok.php';

	if(!document.getElementsByName('post_action').length || !document.getElementsByName('this_domain').length){
		form.target=create_iframe();
		form.action = default_action;
				console.log('action:' + form.action);
		return true;

	}else{

		form.target=create_iframe();
		form.post_action.value = default_action;
		form.action = "https://www.anybuild.com/ssl/post_all_reg.php";
		form.this_domain.value = "www.brain21c.co.kr";
				console.log('action:' + form.action);
		return true;
	}

	
}


var SESS_ADMIN_MODE ='0';

function home_go(){
	top.location.href="/";
}

document.login_form.id.focus();
document.login_form.referer.value = "";

if(document.getElementsByName('first_url').length) document.login_form.first_url.value = "";
if(document.getElementsByName('login_lan').length) document.login_form.login_lan.value = "kr";

if(document.getElementsByName('login_admin_mode').length) document.login_form.login_admin_mode.value = "normal";

if(document.getElementsByName('smart_design_yn').length) document.login_form.smart_design_yn.value = "";
if(document.getElementsByName('smart_design_mode').length) document.login_form.smart_design_mode.value = "";


setTimeout("create_iframe(0,'ok_frame');",100);
</script>


</body>
</html>
