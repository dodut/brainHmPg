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
		<div id="admin_login">
			<fieldset>
				<legend>
					<strong>관리자 로그인</strong>
					<em>웹 관리자모드 로그인하세요.</em>
				</legend>
				<p>
					<label for="userid">아이디</label>
					<span><input type="text" name="userid" id="userid" placeholder="아이디" value=""></span>
				</p>
				<p>
					<label for="password">비밀번호</label>
					<span><input type="password" name="password" id="password" placeholder="패스워드" value=""></span>
				</p>
				<nav>
					<button type="submit">로그인</button>
				</nav>
				<p style="text-align:center">
					<button type="button" onclick="location.href='sign_up'">회원가입 페이지</button>
				</p>
			</fieldset>
		</div>
	</form>
<script>
var LAN = "kr";
</script>
<script type="text/javascript" src="/js/admin.js"></script>
<script language='javascript'>
function login_form_chk(){
	var form = document.login_form;

	if(!form.userid.value)
	{
		alert("아이디를 입력하세요.");
		form.userId.focus();
		return false;
	}

	if(!form.password.value)
	{
		alert("비밀번호를 입력하세요.");
		form.password.focus();
		return false;
	}


	var default_action = '/login';
	
	form.action = default_action;
	return true;
	
}

setTimeout("create_iframe(0,'ok_frame');",100);
</script>


</body>
</html>
