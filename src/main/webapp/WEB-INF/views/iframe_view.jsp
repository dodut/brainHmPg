<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	iframe_view.jsp
ㅁㄴㅇㄹ
</body>
<script> 
 
	var result = '${result}';
	//alert(result);

	
	if(result != null && result == 1){
		alert("저장되었습니다.");
		parent.location.href="/bbs/sub3_2";
	}
 
</script>
</html>