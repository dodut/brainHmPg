<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>(주)브레인컨설팅</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=yes">
<meta name="subject" content="(주)브레인컨설팅" />
<meta name="copyright" content="(주)브레인컨설팅" />
<meta name="title" content="(주)브레인컨설팅" />
<meta name="apple-mobile-web-app-title" content="(주)브레인컨설팅" />
<meta name="application-name" content="(주)브레인컨설팅" />
<meta name="theme-color" content="#ffffff" />
<link rel="canonical" href="http://www.brain21c.co.kr" />
<meta name="twitter:card"           content="summary">
<meta name="twitter:title"          content="(주)브레인컨설팅">
<meta name="twitter:site"           content="(주)브레인컨설팅">
<link rel="shortcut icon" href="/img_up/shop_pds/brin/etc/brin1520391827.ico" />
<script type="text/javascript" src="/img_up/_addon/jquery/1.11.3/jquery.min.js"></script>
<link rel="stylesheet" href="/css/head_basic.css" type="text/css" media="all" />
<link rel="stylesheet" href="/css/head_logout.css" type="text/css" media="all" />
<script type="text/javascript">var MOBILE_CONN_YN = false;var LAN = 'kr';</script>
<script type="text/javascript" src="/js/all_default.js?v=18"></script>
<script type="text/javascript">
var isKitkat = window.navigator.userAgent.search( "AnybuildApp Android 4.4") > -1 ? true : false;
</script>
<script type="text/javascript" src="/img_up/shop_pds/brin/etc/navi_category_all.js"></script>
<script type="text/javascript" src="/img_up/shop_pds/brin/etc/goods_category_all.js"></script>
<script type="text/javascript" src="/img_up/shop_pds/brin/etc/board_list.js"></script>
<script type="text/javascript" src="/js/all_default2.js"></script>
<script type="text/javascript" src="/js/google_map.js?ver=8"></script>
<script type="text/javascript" src="/js/load_frame.js"></script>
<script type="text/javascript" src="/js/head_logout.js"></script>
<script type="text/javascript" id='naver_map_js' ></script>
<script type="text/javascript" id='dynamic_js' ></script>

<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@1.0/nanumbarungothicsubset.css">

<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

<!--[if lt IE 9]>
 <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]--><link rel="stylesheet" type="text/css" href="/img_up/_addon/css/reset_1.2.css" />
<link rel="stylesheet" type="text/css" href="/img_up/shop_pds/brin/src_css/font.css" />
<script type="text/javascript" src="/img_up/shop_pds/brin/src_js/base.js"></script>
<link rel="stylesheet" type="text/css" href="/img_up/shop_pds/brin/src_css/base.css" />
<link rel="stylesheet" type="text/css" href="/img_up/shop_pds/brin/src_css/base_t.css" media="only all and (max-width:1216px)"/>
<link rel="stylesheet" type="text/css" href="/img_up/shop_pds/brin/src_css/base_m.css" media="only all and (max-width:1000px)"/>

<script type="text/javascript" id="ai_log_chk_script"></script>
<script type="text/javascript" id="ai_log_default_script" src="https://chk101.ai-log.biz/etc/connect_ai_set.js?ver=2"></script>
</head>

<body>
<jsp:include page="../views/comm/gnb.jsp"/>

<div id="main">
  <div class="visualWrap"><div class="visual"></div></div>

  <div class="inner">
<section class="notice">
  <h3>Notice</h3>
  
<style>
.pm-board_list_notice ul {overflow:hidden; margin:0;padding:0;list-style:none}
.pm-board_list_notice li {float:left; width:285px; height:290px; font-size:13px;line-height:1.6em;margin-left:20px;}
.pm-board_list_notice li:first-child {margin-left:0; }
.pm-board_list_notice a {display:block; height:100%; border:1px solid #c6c6c6; box-sizing:border-box; color:#333;padding:30px 20px;}
 .pm-board_list_notice a:hover, .pm-board_list_notice a:focus {border-color:#1479c0; }
.pm-board_list_notice dl {position:relative;margin:0;}
.pm-board_list_notice dl dt {overflow:hidden; text-align:center;}
 .pm-board_list_notice dl dt .num {display:inline-block; border-bottom:1px solid #9d9d9d; color:#9d9d9d; font-size:15px; font-weight:bold; margin-bottom:30px;}
 .pm-board_list_notice dl dt b {overflow:hidden; display:block; text-align:left; text-overflow:ellipsis;white-space:nowrap; font-size:15px; margin-bottom:20px;}
 .pm-board_list_notice dl dt p {height:100px; color:#666; font-size:13px; line-height:24px; text-align:left; margin-bottom:20px;}
.pm-board_list_notice dl dd {margin:0;font-size:12px;color:#9f9f9f; text-align:left; }
.pm-board_list_notice .comment {font-weight:normal;color:#888}
.pm-board_list_notice .empty {padding:100px 8px;font-size:13px;color:#666;text-align:center}
</style>

<div class="pm-board_list_notice">
	<ul>
		<c:forEach items="${ntList}" var="ntItem">
			<li>
				<a href="/bbs_shop/read.htm?board_code=sub3_1&idx=7953&cate_sub_idx=0">
					<dl>
						<dt>
							<span class="num">${ntItem.num}</span>
							<b>${ntItem.title}</b>
							<p>${ntItem.cntn}</p>
						</dt>
						<dd>${ntItem.subDate}</dd>
					</dl>
				</a>
			</li>
		</c:forEach>
	</ul>
</div>  <a href="/bbs/sub3_1" class="more">More</a>
</section>
</div>
<section class="business2">
  <h3>Business</h3>
  <style>
 .mbtn ul { display:flex; flex-flow:row wrap; }
 .mbtn ul li { float:left; width:20%; padding:15px; box-sizing:border-box; position:relative;}
 .mbtn ul li a { display:block; text-align:center; height:100%; } 
 .mbtn ul li a p { font-size:20px; font-weight:bold; margin-top:10px; transition:.3s; }
 .mbtn ul li a:hover p { color:#1479c1; }  
 .mbtn ul li:after { display:block; content:''; width:1px; height:30px; background:#ccc; position:absolute; right:0; top:50%; transform:translateY(-50%); }
 .mbtn ul li:last-child:after { display:none; }
 
 @media all and ( max-width:768px ) {
   .mbtn ul li a p { font-size:14px;  }
 }
</style>
<div class="mbtn">
  <ul>
    <li><a href="/page/sub2_1"><img src="/img_up/shop_pds/brin/design/img/main_ico1.jpg"><p>전자경매사업부</p></a></li>
    <li><a href="/page/sub2_2"><img src="/img_up/shop_pds/brin/design/img/main_ico2.jpg"><p>POS사업부</p></a></li>
    <li><a href="/page/sub2_3"><img src="/img_up/shop_pds/brin/design/img/main_ico3.jpg"><p>ICT사업부</p></a></li>
    <li><a href="/page/sub2_6"><img src="/img_up/shop_pds/brin/design/img/main_ico6.jpg"><p>시너지유통사업팀</p></a></li>
    <li><a href="/page/sub2_4"><img src="/img_up/shop_pds/brin/design/img/main_ico5.jpg"><p>SI사업부</p></a></li>
    <!--<li><a href="/page/sub2_5"><img src="/img_up/shop_pds/brin/design/img/main_ico4.jpg"><p>솔루션사업부</p></a></li>-->
  </ul>
</div></section>
<section class="online">
  <h3>문의하기</h3>
  <a href="tel:02-801-1900" class="tel">대표번호 : 02-801-1900</a>
  <p>대표메일 : brain@brain21c.co.kr</p>
  <span>(주)브레인컨설팅에 궁금하신 점은 하단 버튼을 클릭하여 문의바랍니다.</span>
  <a href="/bbs/sub3_2" class="write">Write</a>
</section></div>



<jsp:include page="../views/comm/bottom.jsp"/>
</body>
</html>