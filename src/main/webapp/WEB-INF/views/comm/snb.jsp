<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="snb">
	<style>
		#pm2-snb {position:relative;z-index:10}
		#pm2-snb * {box-sizing:border-box}
		#pm2-snb ul {margin:0;padding:0;list-style:none}
		#pm2-snb a {display:block;overflow:hidden;white-space:normal;text-overflow:ellipsis}
		#pm2-snb a > img {vertical-align:top}
	
		#pm2-snb .dep2 {position:relative; border:1px solid #c6c6c6; border-bottom:0;}
		#pm2-snb .dep2 > li {border-bottom:1px solid #c6c6c6;}
		#pm2-snb .dep2 > li:first-child {border-top:none}
		#pm2-snb .dep2 > li > a {padding:27px 20px; font-size:15px;color:#3f3f3f;}
		#pm2-snb .dep2 > li > a.bt_img {padding:0}
		#pm2-snb .dep2 > li.on > a,
		#pm2-snb .dep2 > li:hover > a {background:#f0f0f0; font-weight:bold; color:#1e3d75; }
	
		#pm2-snb .dep3 {padding:0px 0;background:#f8f8f8; border-top:1px solid #c6c6c6; }
		#pm2-snb .dep3 > li > a {padding:10px 20px;font-size:14px;color:#333; border-top:1px dashed #c6c6c6}
	  	#pm2-snb .dep3 > li:first-child >a {border-top:0;}
		#pm2-snb .dep3 > li > a.bt_img {padding:0}
		#pm2-snb .dep3 > li.on > a,
		#pm2-snb .dep3 > li:hover > a {font-weight:bold;color:#1479c1}
		
	  	#pm2-snb h3 {height:80px; line-height:80px; background:#1479c0; color:#fff; font-size:20px; text-align:center;}
	</style>

	<div id="pm2-snb">	<!-- left menu -->
	  <h3>고객지원</h3>
		<ul class="dep2">
			<li <c:if test ="${board_code eq 'sub3_1'}">class="on"</c:if> ><a href="/bbs/sub3_1">공지사항</a></li>
			<li <c:if test ="${board_code eq 'sub3_3'}">class="on"</c:if> ><a href="/myboard/sub3_3">담당자안내</a></li>					
			<li <c:if test ="${board_code eq 'sub3_2'}">class="on"</c:if> ><a href="/bbs/sub3_2">문의게시판</a></li>			
		</ul>
	</div>    
</div>
<!-- snb end -->