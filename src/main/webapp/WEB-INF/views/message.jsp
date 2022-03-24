<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<c:if test="${not empty data.message}">
		<script type="text/javascript">
			top.alert("${data.message}");
		</script>
	</c:if>
	<script type="text/javascript">
		top.location.href = '${data.href}';
	</script>
</head>
</html>