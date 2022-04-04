<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${dto.title}</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=yes">
<meta name="subject" content="${dto.title}" />
<meta name="copyright" content="(주)브레인컨설팅" />
<meta name="title" content="${dto.title}" />
<meta name="apple-mobile-web-app-title" content="(주)브레인컨설팅" />
<meta name="application-name" content="(주)브레인컨설팅" />
<meta name="theme-color" content="#ffffff" />
<link rel="canonical" href="http://www.brain21c.co.kr/bbs/sub3_2/8014" />
<meta property="og:type"            content="website"/>
<meta property="og:title"           content="${dto.title}"/>
<meta property="og:site_name"       content="(주)브레인컨설팅"/>
<meta property="og:url"             content="http://www.brain21c.co.kr/bbs/sub3_2/8014"/>
<meta property="og:image"           content="http://www.brain21c.co.kr/thum_img/brin/og_img/kakao_da-un-ro-deu1644548037.jpg"/>
<meta property="og:image:width" content="1575"/>
<meta property="og:image:height" content="827"/>

<link rel="shortcut icon" href="/img_up/shop_pds/brin/etc/brin1520391827.ico" />
<!-- (본 주석은 관리자로 로그인 되어있을때만  출력 됩니다) : 여기서 부터 load 우선순위가 -10 이하인 경우 출력 시작 or <load target='/jquery.min.js'>와 같이 load 방식으로 jquery를 불러오는경우에도 출력 된다.-->
<script type="text/javascript" src="/img_up/_addon/jquery/1.11.3/jquery.min.js"></script>
<!-- (본 주석은 관리자로 로그인 되어있을때만  출력 됩니다) : 여기까지 load 우선순위가 -10 이하인 경우 출력 끝 -->

<link rel="stylesheet" href="/css/head_basic.css" type="text/css" media="all" />
<link rel="stylesheet" href="/css/head_logout.css" type="text/css" media="all" />
<script type="text/javascript">var MOBILE_CONN_YN = false;var LAN = 'kr';</script>
<script type="text/javascript" src="/js/all_default.js?v=19"></script>
<script type="text/javascript">
var ios_yn = false;
var APP_CONN_YN = false;
var app_version_code = 0;

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
<!-- (본 주석은 관리자로 로그인 되어있을때만  출력 됩니다) : 여기서 부터 load 우선순위가 (-9) ~ (-1)  경우 출력 시작 -->

<!-- (본 주석은 관리자로 로그인 되어있을때만  출력 됩니다) : 여기까지 load 우선순위가 (-9) ~ (-1) 이하인 경우 출력 끝 -->

<!-- (본 주석은 관리자로 로그인 되어있을때만  출력 됩니다) : 전체화면구성 head 소스 출력 시작 -->

<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@1.0/nanumbarungothicsubset.css">
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

<!--[if lt IE 9]>
 <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<!-- (본 주석은 관리자로 로그인 되어있을때만  출력 됩니다) : 전체화면구성 head 소스 출력 끝 -->

<!-- (본 주석은 관리자로 로그인 되어있을때만  출력 됩니다) : 여기서 부터 load 우선순위가 0 이상인 경우 출력 시작 -->
<link rel="stylesheet" type="text/css" href="/img_up/_addon/css/reset_1.2.css" />
<link rel="stylesheet" type="text/css" href="/img_up/shop_pds/brin/src_css/font.css" />
<script type="text/javascript" src="/img_up/shop_pds/brin/src_js/base.js"></script>
<link rel="stylesheet" type="text/css" href="/img_up/shop_pds/brin/src_css/base.css" />
<link rel="stylesheet" type="text/css" href="/img_up/shop_pds/brin/src_css/base_t.css" media="only all and (max-width:1216px)"/>
<link rel="stylesheet" type="text/css" href="/img_up/shop_pds/brin/src_css/base_m.css" media="only all and (max-width:1000px)"/>
<!--  (본 주석은 관리자로 로그인 되어있을때만  출력 됩니다) : 여기까지 load 우선순위가 0 이상인 경우 출력 끝 -->

<link rel="stylesheet" type="text/css" href="/img_up/tmp_img/service/board_tpl/8/pc/css/default_mobile.css" media="all">
<link rel="stylesheet" type="text/css" href="/img_up/tmp_img/service/board_tpl/8/pc/css/default_tablet.css" media="only all and (min-width:768px)">
<link rel="stylesheet" type="text/css" href="/img_up/tmp_img/service/board_tpl/8/pc/css/co-basic-simple.css" media="screen">
<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="/img_up/tmp_img/service/board_tpl/8/pc/css/default_tablet.css" media="all"><![endif]-->
<!--[if IE]><link rel="stylesheet" type="text/css" href="/img_up/tmp_img/service/board_tpl/8/pc/css/ie.css" media="all"><![endif]-->
<!--[if lt IE 8]><link rel="stylesheet" type="text/css" href="/img_up/tmp_img/service/board_tpl/8/pc/css/ie7.css" media="all"><![endif]-->
</head>

<body>
	<jsp:include page="../views/comm/gnb.jsp"/>

<div id="sub">
	<div class="sub_visual"></div>
	<div class="inner">
		<jsp:include page="../views/comm/snb.jsp"/>
		
		<div class="cont">
			<h3>문의게시판</h3>
			<p class="navi">
			홈 &gt; 고객지원 &gt; 문의게시판      
			</p>

			<div id="scbd" class="scbd co-basic-simple">
				<!-- category and board list -->
				<!-- // category and board list -->

				<div id="lay_hd" class="lay_hd">
					<div class="hgroup">
						<h1><a href="javascript:goList()">문의게시판</a></h1>
						<ul>
							<li>
								<a href="#" id="btnToggleSearch">검색<i class="ui-ico search"></i></a>
							</li>
							<li>
								<a href="javascript:writeArticle()">글쓰기<i class="ui-ico write"></i></a>
							</li>			
						</ul>
					</div>
					<div id="toggleSearch" class="toggleSearch">
						<fieldset>
							<legend class="blind">게시글 검색</legend>
							<div>
								<input type="text" name="search_key" id="search_key" maxlength="30" value="" placeholder="검색어">
								<button class="ui-ico">검색</button>
							</div>
						</fieldset>
					</div>
				</div>

				<div class="det">
					<!-- Head -->
					<div class="hgroup">
						<div class="title">
							<strong>${dto.title}</strong>
						</div>
						<dl>
							<dt>
								<span>${dto.rgwriter}</span>
								<span>조회수:${dto.hits}</span>
								<span>220.81.181.97</span> <!-- IP -->
							</dt>
							<dd><span><fmt:formatDate value="${dto.rgdtm}" pattern="yyyy-MM-dd" /></span></dd>
						</dl>
					</div>
					<!-- // Head -->

					<!-- url copy -->
					<div class="copyurl">
						<a href="/bbs/sub3_2_view?seq=${dto.seq}" target="_blank">http://www.brain21c.co.kr/bbs/sub3_2_view?seq=${dto.seq}</a>
						<a href="javascript:clip('http://www.brain21c.co.kr/bbs/sub3_2_view?seq=${dto.seq}')" class="btn" title="URL COPY">URL COPY</a>
					</div>
					<!-- // url copy -->

					<!-- bgm -->
					<!-- // bgm -->

					
					<!-- -질문영역 / view_code: Q -->
					<c:if test="${view_code eq 'Q' }">
					<!-- contents body -->
					<div id="conbody" class="conbody">
						${dto.cntn}	
					</div>
					<!-- // contents body -->
					</c:if>
					
					
					<!-- 답변영역 (Q & A)/ view_code: A -->
					<c:if test="${view_code eq 'A' }">
					<!-- question and answer body -->
					<div class="qnabox">
						<div class="box question">
							<strong>Q. 질문</strong>
							<div class="conbody">
								${ref_dto.cntn}
							</div>
						</div>
						<div class="box answer">
							<strong>A. 답변</strong>
							<div class="conbody">
								${dto.cntn}
							</div>
						</div>
					</div>
					<!-- // question and answer body -->
					</c:if>
					 
					
					<div class="mid_design">
					</div>

					<div class="clr">
						<div class="sbtns">
							<a href="javascript:replyArticle()">답글</a>
							<a href="javascript:editArticle()">수정</a>
							<a href="javascript:deleteArticle()">삭제</a>	
							<a href="javascript:moveArticle()">이동</a>
							<a href="javascript:goConfirm_no()">숨기기</a>
							<a href="javascript:board_view_print()">출력</a>
						</div>
					</div>

					<!-- SNS share -->
					<div class="snsShare">
						<strong>SNS 공유</strong>
						<a href="javascript:scrap_twitter_pop(8014)" class="ui-ico twitter">Twitter</a>
						<a href="javascript:scrap_facebook_pop(8014)" class="ui-ico facebook">Facebook</a>
						<a href="javascript:scrap_cyworld_pop(8014)" class="ui-ico cyworld">Cyworld</a>
						<a href="javascript:scrap_mypage_pop(8014)" class="ui-ico mypage">Mypage</a>
					</div>		
					<!-- // SNS share -->

					<!-- buttons -->
					<div class="btngroup">
						<a href="javascript:goList()" class="ui-btn btn-co1">목록</a>
					</div>		
					<!-- // buttons -->
				</div>
			</div>

			<div id="scbd" class="scbd co-basic-simple">
				<!-- List(reply) -->
				<div class="ui-toggle list_reply">
					<div class="hd">
						<h1>답변글 목록</h1>
						<p>
							<span class="open">열기<i class="ui-ico"></i></span>
							<span class="close">닫기<i class="ui-ico"></i></span>
						</p>
					</div>
					
					<!-- view_code : Q -->
					<c:if test="${view_code eq 'Q' }">
					<div class="bd">
						<ul class="lst-board lst-body">
							<li class="clr">	<!-- 질문 글 -->
								<div class="td col_subject">
									<div style="padding-left:0px;">
										<a href="Javascript:readArticle('${dto.seq}')">
											<span><strong> ${dto.title}</strong></span>
											<img src="/img_up/tmp_img/service/board_tpl/8/pc/img/ico_secret.png" height="12" alt="secret">								
											<img src="/img_up/tmp_img/service/board_tpl/8/pc/img/ico_image.gif" height="12" alt="image">
										</a>
									</div>
									
									<div class="td inf col_name">${dto.rgwriter}</div>
									<div class="td inf col_date"><fmt:formatDate value="${dto.rgdtm}" pattern="yyyy-MM-dd" /></div>
									<div class="td inf col_hit"><span class="txt">조회수:</span>${dto.hits}</div>
								</div>
							</li>
							
							
							<c:if test="${ref_dto.title != null}"> 
							<li class="clr">	<!-- 답변 글 -->
								<div class="td col_subject">
									<div style="padding-left:15px;">
										<a href="Javascript:readArticle('${ref_dto.seq}')">
											<i class="ui-ico reply">reply</i>
											<span>${ref_dto.title}</span>
											<img src="/img_up/tmp_img/service/board_tpl/8/pc/img/ico_secret.png" height="12" alt="secret">																																	
										</a>
									</div>
									
									<div class="td inf col_name">${ref_dto.rgwriter}</div>
									<div class="td inf col_date"><fmt:formatDate value="${ref_dto.rgdtm}" pattern="yyyy-MM-dd" /></div>
									<div class="td inf col_hit"><span class="txt">조회수:</span>${ref_dto.hits}</div>
								</div>
							</li>
							</c:if>
							
							
							
						</ul>
					</div>
					</c:if>
					
					<c:if test="${view_code eq 'A' }">
					<!-- view_code : A -->
					<div class="bd">
						<ul class="lst-board lst-body">
							<li class="clr">	<!-- 질문 글 -->
								<div class="td col_subject">
									<div style="padding-left:0px;">
										<a href="Javascript:readArticle('${ref_dto.seq}')">
											<span><strong> ${ref_dto.title}</strong></span>
											<img src="/img_up/tmp_img/service/board_tpl/8/pc/img/ico_secret.png" height="12" alt="secret">								
											<img src="/img_up/tmp_img/service/board_tpl/8/pc/img/ico_image.gif" height="12" alt="image">
										</a>
									</div>
									
									<div class="td inf col_name">${ref_dto.rgwriter}</div>
									<div class="td inf col_date"><fmt:formatDate value="${ref_dto.rgdtm}" pattern="yyyy-MM-dd" /></div>
									<div class="td inf col_hit"><span class="txt">조회수:</span>${ref_dto.hits}</div>
								</div>
							</li>
							<li class="clr">	<!-- 답변 글 -->
								<div class="td col_subject">
									<div style="padding-left:15px;">
										<a href="Javascript:readArticle('${dto.seq}')">
											<i class="ui-ico reply">reply</i>
											<span>${dto.title}</span>
											<img src="/img_up/tmp_img/service/board_tpl/8/pc/img/ico_secret.png" height="12" alt="secret">																																	
										</a>
									</div>
									
									<div class="td inf col_name">${dto.rgwriter}</div>
									<div class="td inf col_date"><fmt:formatDate value="${dto.rgdtm}" pattern="yyyy-MM-dd" /></div>
									<div class="td inf col_hit"><span class="txt">조회수:</span>${dto.hits}</div>
								</div>
							</li>
						</ul>
					</div>
					</c:if>
				</div>
				<!-- // List(reply) -->
			</div>

		</div> <!-- //cont -->
	</div> <!-- //inner -->
</div><!-- //sub -->

<jsp:include page="../views/comm/bottom.jsp"/>

<script type="text/javascript">
var tmp_chk2=0;
var search_key = '${search_key}';
var currentPageNo = '${currentPageNo}';

function div2_move_chk(){
	if(!tmp_chk2){
		tmp_div2.style.top = tmp_div2.offsetTop-230;
		tmp_chk2 = 1;
	}
}

function no_blog(){
	alert("블러그형은 로그인해야 볼수 있습니다.");
}

function writeArticle(){
	location.href="/bbs/sub3_2_form";
	//location.href="/bbs_shop/write_form.htm?me_popup=0&auto_frame=&cate_sub_idx=0&search_first_subject=&list_mode=board&mode=write&board_code=sub3_2";
}
function readArticle(seq){
	 
	location.href="/bbs/sub3_2_view?page="+currentPageNo+"&search_key="+search_key+"&seq="+seq;
}
function reply_readArticle(idx){
			location.href="/bbs_shop/read.htm?me_popup=0&auto_frame=&cate_sub_idx=0&search_first_subject=&list_mode=board&board_code=sub3_2&search_key=&key=&page=1&idx="+idx;
	}

function delNotice(idx){
	if(confirm("공지에서 빼시겠습니까?")){
		var iframe_name = create_iframe();
		document.getElementById(iframe_name).src="/bbs_shop/notice_del.php?me_popup=0&auto_frame=&cate_sub_idx=0&search_first_subject=&list_mode=board&board_code=sub3_2&search_key=&key=&page=1&idx="+idx;
	}
}
function no_write(){
	alert("본 게시판은 회원 전용 게시판입니다.\n\n로그인하신후 다시 이용하시기 바랍니다.");
}

function no_blog(){
	alert("블러그형은 로그인해야 볼수 있습니다.");
}

//게시글 출력에 필요한 함수
function ToggleAll1(){

	var i =0;
	while(i < document.board_form.elements.length){
		if(document.board_form.elements[i].name=='idx_chk[]'){
			if(document.board_form.elements[i].checked == true){
				document.board_form.elements[i].checked = false;
			}else{
				document.board_form.elements[i].checked = true;
			}
		}
		i++;
	}
}

function mem_secret_no_read(){
						alert("본 게시글은 로그인을 해야만 볼수 있습니다.");
			}

function secret_no_read2(idx){
	secret_read2(idx);
	//alert("본 게시글은 [회원 전용 비밀글]로 설정되어 있습니다.\n\n [회원 전용 비밀글]은 관리자 또는 작성자만 볼수 있습니다.");
}

function secret_read2(idx){
			var secret_read2_win = window.open('/bbs_shop/popup/pwd_chk_form.htm?pwd_mode=board_secret&me_popup=0&auto_frame=&cate_sub_idx=0&search_first_subject=&list_mode=board&board_code=sub3_2&search_key=&key=&page=1&idx='+idx,'secret_read2_win','top=150,left=300,width=330,height=200,scrollbars=no');
		secret_read2_win.focus();
	}

function tmp_div2_close(){
	tmp_div2.style.display = 'none';
}
</script>

<div id='tmp_div2' style='position:absolute;display:none;'>
	<iframe src='' width=360 height=213 style='border:0' title='게시판 체크 프레임' name='tmp_frame2' id='tmp_frame2' scrolling=no allowtransparency="true"></iframe>
</div>

<script type="text/javascript" src='/bbs_shop/js/board.js'></script>
<script type="text/javascript" src='/bbs_shop/js/sub_menu.js'></script>
<script type="text/javascript">
function scrap_cyworld_pop(idx){
	var w = 450;
	var h = 410;
	var window_left = (screen.width-w)/2;
	var window_top = (screen.height-h)/2;
	var cyopenscrap = window.open('http://api.cyworld.com/openscrap/post/v1/?xu=http%3A%2F%2Fwww.brain21c.co.kr%2Fbbs_shop%2Fscrap_cyworld.php%3Fboard_code%3Dsub3_2%26idx%3D'+idx+'&sid=y7NSneU4hjAxwDnNpa3QtP89ptHNy4TL','cyopenscrap','top='+window_top+',left='+window_left+',width='+w+',height='+h+',toolbar=no,scrollbars=yes,resizable=yes,status=yes,menubar=no,location=no');
	
	cyopenscrap.focus();
}

function scrap_twitter_pop(idx){
	window.open('/bbs_shop/scrap_twitter.php?board_code=sub3_2&idx='+idx);
}

function scrap_me2day_pop(idx){
	window.open('/bbs_shop/scrap_me2day.php?board_code=sub3_2&idx='+idx);
}

function scrap_facebook_pop(idx){
	window.open('/bbs_shop/scrap_facebook.php?board_code=sub3_2&idx='+idx);
}

function link_board_code_ch(tar){
	location.href='/bbs_shop/list.htm?me_popup=0&auto_frame=&board_code='+tar.value
}

function link_cate_sub_ch(tar){
	location.href='/bbs_shop/list.htm?me_popup=0&auto_frame=&cate_sub_idx='+tar.value+'&list_mode=board&board_code=sub3_2';
}


function scrap_mypage_pop(idx){
	alert('스크랩은 로그인 후 이용가능합니다.');
}
</script>



<script type="text/javascript">
//parent.scrollTo(0, 0);
var search_key = '${search_key}';
var currentPageNo = '${currentPageNo}';

var tmp_chk=0;

function div_move_chk(){
	if(!tmp_chk){
		tmp_div.style.top = tmp_div.offsetTop-230;
		tmp_chk = 1;
	}
}

function goList(){
	location.href="/bbs/sub3_2?page="+currentPageNo+"&board_code=sub3_2&search_key="+search_key;
}
function editArticle(){
	location.href="/bbs_shop/edit_form.htm?me_popup=0&auto_frame=&cate_sub_idx=0&search_first_subject=&list_mode=board&board_code=sub3_2&keyfield=&key=&page=1&idx=8014";
}
function replyArticle(){
			location.href="/bbs_shop/reply_form.htm?me_popup=0&auto_frame=&cate_sub_idx=0&search_first_subject=&list_mode=board&board_code=sub3_2&keyfield=&key=&page=1&idx=8014";
	}
function deleteArticle(){
	if(confirm("게시글을 삭제하시겠습니까?")){
		var iframe_name = create_iframe();
		document.getElementById(iframe_name).src="/bbs_shop/del_exec.php?me_popup=0&auto_frame=&cate_sub_idx=0&search_first_subject=&list_mode=board&idx=8014&board_code=sub3_2&keyfield=&key=&page=1";
	}
}
function moveArticle(){
			var move_win = window.open('/bbs_shop/popup/move_form.htm?me_popup=0&auto_frame=&cate_sub_idx=0&search_first_subject=&list_mode=board&idx=8014&board_code=sub3_2&keyfield=&key=&page=1','move_win','top=150,left=300,width=330,height=450,scrollbars=no');
		move_win.focus();
	}

function secret_read(idx){
	var move_win = window.open('/bbs_shop/popup/pwd_chk_form.htm?pwd_mode=board_secret&me_popup=0&auto_frame=&cate_sub_idx=0&search_first_subject=&list_mode=board&board_code=sub3_2&keyfield=&key=&page=1&idx='+idx,'move_win','top=150,left=300,width=330,height=450,scrollbars=no');
	move_win.focus();
}

function secret_no_read(idx){
	//alert("본 게시글은 [회원 전용 비밀글]로 설정되어 있습니다.\n\n [회원 전용 비밀글]은 관리자 또는 작성자만 볼수 있습니다.");
	secret_read(idx);
}

function tmp_div_close(){
	tmp_div.style.display = 'none';
}

function resizeImage(num,stop){

	if(!stop) stop=0;
	if(stop > 6) return;

	var obj = document.getElementById("userImg" + num);
	if(obj){
		if (obj.width > 600) obj.width = 600;
	}
}


function goConfirm(){
	if(confirm("정상등록 하시겠습니까?")){
		var iframe_name = create_iframe();
		document.getElementById(iframe_name).src="/bbs_shop/confirm_ok.php?me_popup=0&auto_frame=&cate_sub_idx=0&search_first_subject=&list_mode=board&idx=8014&board_code=sub3_2&keyfield=&key=&page=1";
	}
}

function goConfirm_no(){
	if(confirm("게시글을 안보이도록 설정 하시겠습니까?")){
		var iframe_name = create_iframe();
		document.getElementById(iframe_name).src="/bbs_shop/confirm_no.php?me_popup=0&auto_frame=&cate_sub_idx=0&search_first_subject=&list_mode=board&idx=8014&board_code=sub3_2&keyfield=&key=&page=1";
	}
}

function board_view_print(){
	var w = 700;
	var h = 600;
	var window_left = (screen.width-w)/2;
	var window_top = (screen.height-h)/2;
	var board_view_print_win = window.open('/bbs_shop/read.htm?print_yn=1&board_code=sub3_2&idx=8014','board_view_print_win','top='+window_top+',left='+window_left+',width='+w+',height='+h+',toolbar=no,scrollbars=yes,resizable=yes,status=yes,menubar=no,location=no');
	board_view_print_win.focus();
}

function file_download(sel_no,file_name){
	var file_name_arr = new Array();
	var iframe_name = create_iframe();
	document.getElementById(iframe_name).src = "/bbs_shop/file_download.php?board_code=sub3_2&board_idx=8014&sel_no="+sel_no;
}

</script>

<div id='tmp_div' style='position:absolute;display:none;'>
	<iframe src='' width=360 height=213 style='border:0' title='게시판 체크 프레임' name='tmp_frame' id='tmp_frame' scrolling=no allowtransparency="true"></iframe>
</div>

<script type="text/javascript">

// 아래 함수 사용 금지..
function vicious_chk(){
	var w = 400;
	var h = 350;
	var window_left = (screen.width-w)/2;
	var window_top = (screen.height-h)/2;
	var vicious_chk_win = window.open('/bbs_shop/popup/vicious_form.htm?mode=board&idx=8014','vicious_chk','top='+window_top+',left='+window_left+',width='+w+',height='+h+',toolbar=no,scrollbars=yes,resizable=yes,status=yes,menubar=no,location=no');
	vicious_chk_win.focus();
}

// 아래 함수 사용 할것.
function read_vicious_chk(){
	var w = 400;
	var h = 350;
	var window_left = (screen.width-w)/2;
	var window_top = (screen.height-h)/2;
	var vicious_chk_win = window.open('/bbs_shop/popup/vicious_form.htm?mode=board&idx=8014','vicious_chk','top='+window_top+',left='+window_left+',width='+w+',height='+h+',toolbar=no,scrollbars=yes,resizable=yes,status=yes,menubar=no,location=no');
	vicious_chk_win.focus();
}

function board_chu_ok(){
	if(confirm("추천 하시겠습니까?")){
		var iframe_name = create_iframe();
		document.getElementById(iframe_name).src="/bbs_shop/read_chu_ok.php?board_code=sub3_2&idx=8014";
	}
}

function board_oppose_ok(){
	if(confirm("반대 하시겠습니까?")){
		var iframe_name = create_iframe();
		document.getElementById(iframe_name).src="/bbs_shop/read_oppose_ok.php?board_code=sub3_2&idx=8014";
	}
}

function view_Poll(){
	location.href="/bbs_shop/read.htm?board_code=sub3_2&idx=8014&poll_view=1";
}

function vote_Poll(){
	var form = document.frmPoll;
	var poll_sel = 0;
	for(var i=0; i<document.getElementsByName("poll_chk_no").length; i++){
		if(document.getElementsByName("poll_chk_no")[i].checked == true){
			poll_sel = document.getElementsByName("poll_chk_no")[i].value;
			break;
		}
	}

	if(!poll_sel){
		alert("하나 이상 투표해주셔야 합니다.");
	}else{
		location.replace("/bbs_shop/read.htm?board_code=sub3_2&idx=8014&poll_idx=0&poll_sel="+poll_sel)
	}
}

</script>
<script type="text/javascript" src="/img_up/tmp_img/service/board_tpl/8/pc/js/default.js"></script>

<script type="text/javascript">
	setTimeout("create_iframe(0,'ok_frame');",100);
	setTimeout("create_iframe(0,'ok_frame2');",100);
</script>

</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${dto.title}</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=yes">
<meta name="subject" content="${dto.title}" />
<meta name="copyright" content="(주)브레인컨설팅" />
<meta name="title" content="${dto.title}" />
<meta name="apple-mobile-web-app-title" content="(주)브레인컨설팅" />
<meta name="application-name" content="(주)브레인컨설팅" />
<meta name="theme-color" content="#ffffff" />
<meta name="description" content="${dto.cntn}" />
<link rel="canonical" href="http://www.brain21c.co.kr/bbs/sub3_2/8014" />
<meta property="og:type"            content="website"/>
<meta property="og:title"           content="${dto.title}"/>
<meta property="og:site_name"       content="(주)브레인컨설팅"/>
<meta property="og:url"             content="http://www.brain21c.co.kr/bbs/sub3_2/8014"/>
<meta property="og:image"           content="http://www.brain21c.co.kr/thum_img/brin/og_img/kakao_da-un-ro-deu1644548037.jpg"/>
<meta property="og:image:width" content="1575"/>
<meta property="og:image:height" content="827"/>
<meta property="og:description"     content="${dto.cntn}"/>
<meta name="twitter:card"           content="summary">
<meta name="twitter:title"          content="${dto.title}">
<meta name="twitter:site"           content="(주)브레인컨설팅">
<meta name="twitter:creator"        content="${dto.rgwriter}">
<meta name="twitter:image"          content="http://www.brain21c.co.kr/thum_img/brin/og_img/kakao_da-un-ro-deu1644548037.jpg">
<meta name="twitter:description"    content="${dto.cntn}">
<link rel="shortcut icon" href="/img_up/shop_pds/brin/etc/brin1520391827.ico" />
<!-- (본 주석은 관리자로 로그인 되어있을때만  출력 됩니다) : 여기서 부터 load 우선순위가 -10 이하인 경우 출력 시작 or <load target='/jquery.min.js'>와 같이 load 방식으로 jquery를 불러오는경우에도 출력 된다.-->
<script type="text/javascript" src="/img_up/_addon/jquery/1.11.3/jquery.min.js"></script>
<!-- (본 주석은 관리자로 로그인 되어있을때만  출력 됩니다) : 여기까지 load 우선순위가 -10 이하인 경우 출력 끝 -->

<link rel="stylesheet" href="/css/head_basic.css" type="text/css" media="all" />
<link rel="stylesheet" href="/css/head_logout.css" type="text/css" media="all" />
<script type="text/javascript">var MOBILE_CONN_YN = false;var LAN = 'kr';</script>
<script type="text/javascript" src="/js/all_default.js?v=19"></script>
<script type="text/javascript">
var ios_yn = false;
var APP_CONN_YN = false;
var app_version_code = 0;

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
<!-- (본 주석은 관리자로 로그인 되어있을때만  출력 됩니다) : 여기서 부터 load 우선순위가 (-9) ~ (-1)  경우 출력 시작 -->

<!-- (본 주석은 관리자로 로그인 되어있을때만  출력 됩니다) : 여기까지 load 우선순위가 (-9) ~ (-1) 이하인 경우 출력 끝 -->

<!-- (본 주석은 관리자로 로그인 되어있을때만  출력 됩니다) : 전체화면구성 head 소스 출력 시작 -->

<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@1.0/nanumbarungothicsubset.css">
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

<!--[if lt IE 9]>
 <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<!-- (본 주석은 관리자로 로그인 되어있을때만  출력 됩니다) : 전체화면구성 head 소스 출력 끝 -->

<!-- (본 주석은 관리자로 로그인 되어있을때만  출력 됩니다) : 여기서 부터 load 우선순위가 0 이상인 경우 출력 시작 -->
<link rel="stylesheet" type="text/css" href="/img_up/_addon/css/reset_1.2.css" />
<link rel="stylesheet" type="text/css" href="/img_up/shop_pds/brin/src_css/font.css" />
<script type="text/javascript" src="/img_up/shop_pds/brin/src_js/base.js"></script>
<link rel="stylesheet" type="text/css" href="/img_up/shop_pds/brin/src_css/base.css" />
<link rel="stylesheet" type="text/css" href="/img_up/shop_pds/brin/src_css/base_t.css" media="only all and (max-width:1216px)"/>
<link rel="stylesheet" type="text/css" href="/img_up/shop_pds/brin/src_css/base_m.css" media="only all and (max-width:1000px)"/>
<!--  (본 주석은 관리자로 로그인 되어있을때만  출력 됩니다) : 여기까지 load 우선순위가 0 이상인 경우 출력 끝 -->

<link rel="stylesheet" type="text/css" href="/img_up/tmp_img/service/board_tpl/8/pc/css/default_mobile.css" media="all">
<link rel="stylesheet" type="text/css" href="/img_up/tmp_img/service/board_tpl/8/pc/css/default_tablet.css" media="only all and (min-width:768px)">
<link rel="stylesheet" type="text/css" href="/img_up/tmp_img/service/board_tpl/8/pc/css/co-basic-simple.css" media="screen">
<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="/img_up/tmp_img/service/board_tpl/8/pc/css/default_tablet.css" media="all"><![endif]-->
<!--[if IE]><link rel="stylesheet" type="text/css" href="/img_up/tmp_img/service/board_tpl/8/pc/css/ie.css" media="all"><![endif]-->
<!--[if lt IE 8]><link rel="stylesheet" type="text/css" href="/img_up/tmp_img/service/board_tpl/8/pc/css/ie7.css" media="all"><![endif]-->
<script type="text/javascript">
	
	var ssl_host = "ssl.anybuild.com";
	var mall_id = "brin";
	var ssl_possible = 'on';
	var category = "";
	function start_page_set(){
		advertise_tmp.style.behavior='url(#default#HomePage)';
		advertise_tmp.setHomePage('http://www.brain21c.co.kr');
	}
	function bookmark(){
		window.external.AddFavorite('http://www.brain21c.co.kr', "") ;
	}
	var page_title = "락카 전면부 디스 플레이";
</script>
<script>
	// AI-LOG 기본 스크립트
	var ai_log_user_key = "";  // 최초접속자 설정 키값 (default:null)
	var ai_log_account_id = "brin"; // AI-LOG 계정 아이디
	var ai_log_mem_id = ""; // 고객 아이디
	var ai_log_mobile_web_yn = "0"; // 모바일웹 이라면 1, 데스크탑 홈페이지라면 0
	var ai_log_app_conn_yn = "0"; // 하이브리드 앱이라면 1, 아닌경우 0
	var ai_log_page_title = "락카 전면부 디스 플레이"; // 페이지 제목
	var ai_log_page_url = "/bbs/sub3_2/8014"; // 페이지 url, 빈값 입력시 브라우져 url 자동 입력 입니다.
	var ai_log_event_mode = ""; // board_reg:게시글 작성, mem_reg:회원가입, sale:매출발생  (default:빈칸)
	var ai_log_event_sale_price = ""; // ai_log_event_mode가 sale 일때  매출 금액
</script>
<script type="text/javascript" id="ai_log_chk_script"></script>
<script type="text/javascript" id="ai_log_default_script" src="https://chk101.ai-log.biz/etc/connect_ai_set.js?ver=2"></script>
</head>

<body >
	<jsp:include page="../views/comm/gnb.jsp"/>

<div id="sub">
	<div class="sub_visual"></div>
	<div class="inner">
		<jsp:include page="../views/comm/snb.jsp"/>
		
		<div class="cont">
			<h3>문의게시판</h3>
			<p class="navi">
			홈 &gt; 고객지원 &gt; 문의게시판      
			</p>

			<div id="scbd" class="scbd co-basic-simple">
				<!-- category and board list -->
				<!-- // category and board list -->

				<div id="lay_hd" class="lay_hd">
					<div class="hgroup">
						<h1><a href="javascript:goList()">문의게시판</a></h1>
						<ul>
							<li>
								<a href="#" id="btnToggleSearch">검색<i class="ui-ico search"></i></a>
							</li>
							<li>
								<a href="javascript:writeArticle()">글쓰기<i class="ui-ico write"></i></a>
							</li>			
						</ul>
					</div>
					<div id="toggleSearch" class="toggleSearch">
						<fieldset>
							<legend class="blind">게시글 검색</legend>
							<div>
								<input type="text" name="search_key" id="search_key" maxlength="30" value="" placeholder="검색어">
								<button class="ui-ico">검색</button>
							</div>
						</fieldset>
					</div>
				</div>

				<div class="det">
					<!-- Head -->
					<div class="hgroup">
						<div class="title">
							<strong>${dto.title}</strong>
						</div>
						<dl>
							<dt>
								<span>${dto.rgwriter}</span>
								<span>조회수:${dto.hits}</span>
								<span>220.81.181.97</span> <!-- IP -->
							</dt>
							<dd><span><fmt:formatDate value="${dto.rgdtm}" pattern="yyyy-MM-dd" /></span></dd>
						</dl>
					</div>
					<!-- // Head -->

					<!-- url copy -->
					<div class="copyurl">
						<a href="/bbs/sub3_2_view?seq=${dto.seq}" target="_blank">http://www.brain21c.co.kr/bbs/sub3_2_view?seq=${dto.seq}</a>
						<a href="javascript:clip('http://www.brain21c.co.kr/bbs/sub3_2_view?seq=${dto.seq}')" class="btn" title="URL COPY">URL COPY</a>
					</div>
					<!-- // url copy -->

					<!-- bgm -->
					<!-- // bgm -->

					
					<!-- -질문영역 / view_code: Q -->
					<c:if test="${view_code eq 'Q' }">
					<!-- contents body -->
					<div id="conbody" class="conbody">
						${dto.cntn}	
					</div>
					<!-- // contents body -->
					</c:if>
					
					
					<!-- 답변영역 (Q & A)/ view_code: A -->
					<c:if test="${view_code eq 'A' }">
					<!-- question and answer body -->
					<div class="qnabox">
						<div class="box question">
							<strong>Q. 질문</strong>
							<div class="conbody">
								${ref_dto.cntn}
							</div>
						</div>
						<div class="box answer">
							<strong>A. 답변</strong>
							<div class="conbody">
								${dto.cntn}
							</div>
						</div>
					</div>
					<!-- // question and answer body -->
					</c:if>
					 
					
					<div class="mid_design">
					</div>

					<div class="clr">
						<div class="sbtns">
							<a href="javascript:replyArticle()">답글</a>
							<a href="javascript:editArticle()">수정</a>
							<a href="javascript:deleteArticle()">삭제</a>	
							<a href="javascript:moveArticle()">이동</a>
							<a href="javascript:goConfirm_no()">숨기기</a>
							<a href="javascript:board_view_print()">출력</a>
						</div>
					</div>

					<!-- SNS share -->
					<div class="snsShare">
						<strong>SNS 공유</strong>
						<a href="javascript:scrap_twitter_pop(8014)" class="ui-ico twitter">Twitter</a>
						<a href="javascript:scrap_facebook_pop(8014)" class="ui-ico facebook">Facebook</a>
						<a href="javascript:scrap_cyworld_pop(8014)" class="ui-ico cyworld">Cyworld</a>
						<a href="javascript:scrap_mypage_pop(8014)" class="ui-ico mypage">Mypage</a>
					</div>		
					<!-- // SNS share -->

					<!-- buttons -->
					<div class="btngroup">
						<a href="javascript:goList()" class="ui-btn btn-co1">목록</a>
					</div>		
					<!-- // buttons -->
				</div>
			</div>

			<div id="scbd" class="scbd co-basic-simple">
				<!-- List(reply) -->
				<div class="ui-toggle list_reply">
					<div class="hd">
						<h1>답변글 목록</h1>
						<p>
							<span class="open">열기<i class="ui-ico"></i></span>
							<span class="close">닫기<i class="ui-ico"></i></span>
						</p>
					</div>
					
					<!-- view_code : Q -->
					<c:if test="${view_code eq 'Q' }">
					<div class="bd">
						<ul class="lst-board lst-body">
							<li class="clr">	<!-- 질문 글 -->
								<div class="td col_subject">
									<div style="padding-left:0px;">
										<a href="Javascript:readArticle('${dto.seq}')">
											<span><strong> ${dto.title}</strong></span>
											<img src="/img_up/tmp_img/service/board_tpl/8/pc/img/ico_secret.png" height="12" alt="secret">								
											<img src="/img_up/tmp_img/service/board_tpl/8/pc/img/ico_image.gif" height="12" alt="image">
										</a>
									</div>
									
									<div class="td inf col_name">${dto.rgwriter}</div>
									<div class="td inf col_date"><fmt:formatDate value="${dto.rgdtm}" pattern="yyyy-MM-dd" /></div>
									<div class="td inf col_hit"><span class="txt">조회수:</span>${dto.hits}</div>
								</div>
							</li>
							
							
							<c:if test="${ref_dto.title != null}"> 
							<li class="clr">	<!-- 답변 글 -->
								<div class="td col_subject">
									<div style="padding-left:15px;">
										<a href="Javascript:readArticle('${ref_dto.seq}')">
											<i class="ui-ico reply">reply</i>
											<span>${ref_dto.title}</span>
											<img src="/img_up/tmp_img/service/board_tpl/8/pc/img/ico_secret.png" height="12" alt="secret">																																	
										</a>
									</div>
									
									<div class="td inf col_name">${ref_dto.rgwriter}</div>
									<div class="td inf col_date"><fmt:formatDate value="${ref_dto.rgdtm}" pattern="yyyy-MM-dd" /></div>
									<div class="td inf col_hit"><span class="txt">조회수:</span>${ref_dto.hits}</div>
								</div>
							</li>
							</c:if>
							
							
							
						</ul>
					</div>
					</c:if>
					
					<c:if test="${view_code eq 'A' }">
					<!-- view_code : A -->
					<div class="bd">
						<ul class="lst-board lst-body">
							<li class="clr">	<!-- 질문 글 -->
								<div class="td col_subject">
									<div style="padding-left:0px;">
										<a href="Javascript:readArticle('${ref_dto.seq}')">
											<span><strong> ${ref_dto.title}</strong></span>
											<img src="/img_up/tmp_img/service/board_tpl/8/pc/img/ico_secret.png" height="12" alt="secret">								
											<img src="/img_up/tmp_img/service/board_tpl/8/pc/img/ico_image.gif" height="12" alt="image">
										</a>
									</div>
									
									<div class="td inf col_name">${ref_dto.rgwriter}</div>
									<div class="td inf col_date"><fmt:formatDate value="${ref_dto.rgdtm}" pattern="yyyy-MM-dd" /></div>
									<div class="td inf col_hit"><span class="txt">조회수:</span>${ref_dto.hits}</div>
								</div>
							</li>
							<li class="clr">	<!-- 답변 글 -->
								<div class="td col_subject">
									<div style="padding-left:15px;">
										<a href="Javascript:readArticle('${dto.seq}')">
											<i class="ui-ico reply">reply</i>
											<span>${dto.title}</span>
											<img src="/img_up/tmp_img/service/board_tpl/8/pc/img/ico_secret.png" height="12" alt="secret">																																	
										</a>
									</div>
									
									<div class="td inf col_name">${dto.rgwriter}</div>
									<div class="td inf col_date"><fmt:formatDate value="${dto.rgdtm}" pattern="yyyy-MM-dd" /></div>
									<div class="td inf col_hit"><span class="txt">조회수:</span>${dto.hits}</div>
								</div>
							</li>
						</ul>
					</div>
					</c:if>
				</div>
				<!-- // List(reply) -->
			</div>

		</div> <!-- //cont -->
	</div> <!-- //inner -->
</div><!-- //sub -->

<jsp:include page="../views/comm/bottom.jsp"/>

<script type="text/javascript">
var tmp_chk2=0;
var search_key = '${search_key}';
var currentPageNo = '${currentPageNo}';

function div2_move_chk(){
	if(!tmp_chk2){
		tmp_div2.style.top = tmp_div2.offsetTop-230;
		tmp_chk2 = 1;
	}
}

function no_blog(){
	alert("블러그형은 로그인해야 볼수 있습니다.");
}

function writeArticle(){
	location.href="/bbs/sub3_2_form";
	//location.href="/bbs_shop/write_form.htm?me_popup=0&auto_frame=&cate_sub_idx=0&search_first_subject=&list_mode=board&mode=write&board_code=sub3_2";
}
function readArticle(seq){
	 
	location.href="/bbs/sub3_2_view?page="+currentPageNo+"&search_key="+search_key+"&seq="+seq;
}
function reply_readArticle(idx){
			location.href="/bbs_shop/read.htm?me_popup=0&auto_frame=&cate_sub_idx=0&search_first_subject=&list_mode=board&board_code=sub3_2&search_key=&key=&page=1&idx="+idx;
	}

function delNotice(idx){
	if(confirm("공지에서 빼시겠습니까?")){
		var iframe_name = create_iframe();
		document.getElementById(iframe_name).src="/bbs_shop/notice_del.php?me_popup=0&auto_frame=&cate_sub_idx=0&search_first_subject=&list_mode=board&board_code=sub3_2&search_key=&key=&page=1&idx="+idx;
	}
}
function no_write(){
	alert("본 게시판은 회원 전용 게시판입니다.\n\n로그인하신후 다시 이용하시기 바랍니다.");
}

function no_blog(){
	alert("블러그형은 로그인해야 볼수 있습니다.");
}

//게시글 출력에 필요한 함수
function ToggleAll1(){

	var i =0;
	while(i < document.board_form.elements.length){
		if(document.board_form.elements[i].name=='idx_chk[]'){
			if(document.board_form.elements[i].checked == true){
				document.board_form.elements[i].checked = false;
			}else{
				document.board_form.elements[i].checked = true;
			}
		}
		i++;
	}
}

function mem_secret_no_read(){
						alert("본 게시글은 로그인을 해야만 볼수 있습니다.");
			}

function secret_no_read2(idx){
	secret_read2(idx);
	//alert("본 게시글은 [회원 전용 비밀글]로 설정되어 있습니다.\n\n [회원 전용 비밀글]은 관리자 또는 작성자만 볼수 있습니다.");
}

function secret_read2(idx){
			var secret_read2_win = window.open('/bbs_shop/popup/pwd_chk_form.htm?pwd_mode=board_secret&me_popup=0&auto_frame=&cate_sub_idx=0&search_first_subject=&list_mode=board&board_code=sub3_2&search_key=&key=&page=1&idx='+idx,'secret_read2_win','top=150,left=300,width=330,height=200,scrollbars=no');
		secret_read2_win.focus();
	}

function tmp_div2_close(){
	tmp_div2.style.display = 'none';
}
</script>

<div id='tmp_div2' style='position:absolute;display:none;'>
	<iframe src='' width=360 height=213 style='border:0' title='게시판 체크 프레임' name='tmp_frame2' id='tmp_frame2' scrolling=no allowtransparency="true"></iframe>
</div>

<script type="text/javascript" src='/bbs_shop/js/board.js'></script>
<script type="text/javascript" src='/bbs_shop/js/sub_menu.js'></script>
<script type="text/javascript">
function scrap_cyworld_pop(idx){
	var w = 450;
	var h = 410;
	var window_left = (screen.width-w)/2;
	var window_top = (screen.height-h)/2;
	var cyopenscrap = window.open('http://api.cyworld.com/openscrap/post/v1/?xu=http%3A%2F%2Fwww.brain21c.co.kr%2Fbbs_shop%2Fscrap_cyworld.php%3Fboard_code%3Dsub3_2%26idx%3D'+idx+'&sid=y7NSneU4hjAxwDnNpa3QtP89ptHNy4TL','cyopenscrap','top='+window_top+',left='+window_left+',width='+w+',height='+h+',toolbar=no,scrollbars=yes,resizable=yes,status=yes,menubar=no,location=no');
	
	cyopenscrap.focus();
}

function scrap_twitter_pop(idx){
	window.open('/bbs_shop/scrap_twitter.php?board_code=sub3_2&idx='+idx);
}

function scrap_me2day_pop(idx){
	window.open('/bbs_shop/scrap_me2day.php?board_code=sub3_2&idx='+idx);
}

function scrap_facebook_pop(idx){
	window.open('/bbs_shop/scrap_facebook.php?board_code=sub3_2&idx='+idx);
}

function link_board_code_ch(tar){
	location.href='/bbs_shop/list.htm?me_popup=0&auto_frame=&board_code='+tar.value
}

function link_cate_sub_ch(tar){
	location.href='/bbs_shop/list.htm?me_popup=0&auto_frame=&cate_sub_idx='+tar.value+'&list_mode=board&board_code=sub3_2';
}


function scrap_mypage_pop(idx){
	alert('스크랩은 로그인 후 이용가능합니다.');
}
</script>



<script type="text/javascript">
//parent.scrollTo(0, 0);
var search_key = '${search_key}';
var currentPageNo = '${currentPageNo}';

var tmp_chk=0;

function div_move_chk(){
	if(!tmp_chk){
		tmp_div.style.top = tmp_div.offsetTop-230;
		tmp_chk = 1;
	}
}

function goList(){
	location.href="/bbs/sub3_2?page="+currentPageNo+"&board_code=sub3_2&search_key="+search_key;
}
function editArticle(){
	location.href="/bbs_shop/edit_form.htm?me_popup=0&auto_frame=&cate_sub_idx=0&search_first_subject=&list_mode=board&board_code=sub3_2&keyfield=&key=&page=1&idx=8014";
}
function replyArticle(){
			location.href="/bbs_shop/reply_form.htm?me_popup=0&auto_frame=&cate_sub_idx=0&search_first_subject=&list_mode=board&board_code=sub3_2&keyfield=&key=&page=1&idx=8014";
	}
function deleteArticle(){
	if(confirm("게시글을 삭제하시겠습니까?")){
		var iframe_name = create_iframe();
		document.getElementById(iframe_name).src="/bbs_shop/del_exec.php?me_popup=0&auto_frame=&cate_sub_idx=0&search_first_subject=&list_mode=board&idx=8014&board_code=sub3_2&keyfield=&key=&page=1";
	}
}
function moveArticle(){
			var move_win = window.open('/bbs_shop/popup/move_form.htm?me_popup=0&auto_frame=&cate_sub_idx=0&search_first_subject=&list_mode=board&idx=8014&board_code=sub3_2&keyfield=&key=&page=1','move_win','top=150,left=300,width=330,height=450,scrollbars=no');
		move_win.focus();
	}

function secret_read(idx){
	var move_win = window.open('/bbs_shop/popup/pwd_chk_form.htm?pwd_mode=board_secret&me_popup=0&auto_frame=&cate_sub_idx=0&search_first_subject=&list_mode=board&board_code=sub3_2&keyfield=&key=&page=1&idx='+idx,'move_win','top=150,left=300,width=330,height=450,scrollbars=no');
	move_win.focus();
}

function secret_no_read(idx){
	//alert("본 게시글은 [회원 전용 비밀글]로 설정되어 있습니다.\n\n [회원 전용 비밀글]은 관리자 또는 작성자만 볼수 있습니다.");
	secret_read(idx);
}

function tmp_div_close(){
	tmp_div.style.display = 'none';
}

function resizeImage(num,stop){

	if(!stop) stop=0;
	if(stop > 6) return;

	var obj = document.getElementById("userImg" + num);
	if(obj){
		if (obj.width > 600) obj.width = 600;
	}
}


function goConfirm(){
	if(confirm("정상등록 하시겠습니까?")){
		var iframe_name = create_iframe();
		document.getElementById(iframe_name).src="/bbs_shop/confirm_ok.php?me_popup=0&auto_frame=&cate_sub_idx=0&search_first_subject=&list_mode=board&idx=8014&board_code=sub3_2&keyfield=&key=&page=1";
	}
}

function goConfirm_no(){
	if(confirm("게시글을 안보이도록 설정 하시겠습니까?")){
		var iframe_name = create_iframe();
		document.getElementById(iframe_name).src="/bbs_shop/confirm_no.php?me_popup=0&auto_frame=&cate_sub_idx=0&search_first_subject=&list_mode=board&idx=8014&board_code=sub3_2&keyfield=&key=&page=1";
	}
}

function board_view_print(){
	var w = 700;
	var h = 600;
	var window_left = (screen.width-w)/2;
	var window_top = (screen.height-h)/2;
	var board_view_print_win = window.open('/bbs_shop/read.htm?print_yn=1&board_code=sub3_2&idx=8014','board_view_print_win','top='+window_top+',left='+window_left+',width='+w+',height='+h+',toolbar=no,scrollbars=yes,resizable=yes,status=yes,menubar=no,location=no');
	board_view_print_win.focus();
}

function file_download(sel_no,file_name){
	var file_name_arr = new Array();
	var iframe_name = create_iframe();
	document.getElementById(iframe_name).src = "/bbs_shop/file_download.php?board_code=sub3_2&board_idx=8014&sel_no="+sel_no;
}

</script>

<div id='tmp_div' style='position:absolute;display:none;'>
	<iframe src='' width=360 height=213 style='border:0' title='게시판 체크 프레임' name='tmp_frame' id='tmp_frame' scrolling=no allowtransparency="true"></iframe>
</div>

<script type="text/javascript">

// 아래 함수 사용 금지..
function vicious_chk(){
	var w = 400;
	var h = 350;
	var window_left = (screen.width-w)/2;
	var window_top = (screen.height-h)/2;
	var vicious_chk_win = window.open('/bbs_shop/popup/vicious_form.htm?mode=board&idx=8014','vicious_chk','top='+window_top+',left='+window_left+',width='+w+',height='+h+',toolbar=no,scrollbars=yes,resizable=yes,status=yes,menubar=no,location=no');
	vicious_chk_win.focus();
}

// 아래 함수 사용 할것.
function read_vicious_chk(){
	var w = 400;
	var h = 350;
	var window_left = (screen.width-w)/2;
	var window_top = (screen.height-h)/2;
	var vicious_chk_win = window.open('/bbs_shop/popup/vicious_form.htm?mode=board&idx=8014','vicious_chk','top='+window_top+',left='+window_left+',width='+w+',height='+h+',toolbar=no,scrollbars=yes,resizable=yes,status=yes,menubar=no,location=no');
	vicious_chk_win.focus();
}

function board_chu_ok(){
	if(confirm("추천 하시겠습니까?")){
		var iframe_name = create_iframe();
		document.getElementById(iframe_name).src="/bbs_shop/read_chu_ok.php?board_code=sub3_2&idx=8014";
	}
}

function board_oppose_ok(){
	if(confirm("반대 하시겠습니까?")){
		var iframe_name = create_iframe();
		document.getElementById(iframe_name).src="/bbs_shop/read_oppose_ok.php?board_code=sub3_2&idx=8014";
	}
}

function view_Poll(){
	location.href="/bbs_shop/read.htm?board_code=sub3_2&idx=8014&poll_view=1";
}

function vote_Poll(){
	var form = document.frmPoll;
	var poll_sel = 0;
	for(var i=0; i<document.getElementsByName("poll_chk_no").length; i++){
		if(document.getElementsByName("poll_chk_no")[i].checked == true){
			poll_sel = document.getElementsByName("poll_chk_no")[i].value;
			break;
		}
	}

	if(!poll_sel){
		alert("하나 이상 투표해주셔야 합니다.");
	}else{
		location.replace("/bbs_shop/read.htm?board_code=sub3_2&idx=8014&poll_idx=0&poll_sel="+poll_sel)
	}
}

</script>
<script type="text/javascript" src="/img_up/tmp_img/service/board_tpl/8/pc/js/default.js"></script>

<script type="text/javascript">
	setTimeout("create_iframe(0,'ok_frame');",100);
	setTimeout("create_iframe(0,'ok_frame2');",100);
</script>

</body>
>>>>>>> branch 'master' of https://github.com/dodut/brainHmpg.git
</html>