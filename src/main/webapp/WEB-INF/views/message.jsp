<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript">
		top.alert("${data.message}");
		top.location.href = '${data.href}';
	</script>
</head>
</html>