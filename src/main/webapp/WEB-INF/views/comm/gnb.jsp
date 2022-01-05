<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<div id="header">
    <div class="lnb_bg"></div>
    <div class="mnb_bg"></div>
    <div class="inner">
    <h1><a href="/main"><img src="/img_up/shop_pds/brin/design/img/logo_t.png" alt="(주)브레인컨설팅"></a></h1>
    <nav>
      <h2 class="hidden">카테고리</h2>
      
<style>
#pm2-lnb {position:relative;z-index:10;}
#pm2-lnb * {box-sizing:border-box}
#pm2-lnb ul {margin:0;padding:0;list-style:none}
#pm2-lnb a {display:block;overflow:hidden;white-space:nowrap;text-overflow:ellipsis}
#pm2-lnb a > img {vertical-align:top}

#pm2-lnb .dep1 {position:relative}
#pm2-lnb .dep1:after {content:'';display:block;clear:both}
#pm2-lnb .dep1 > li {float:left}
#pm2-lnb .dep1 > li > a {padding:34px 50px 32px;font-size:17px; font-weight:bold;color:#393939}
#pm2-lnb .dep1 > li > a.bt_img {padding:0}
#pm2-lnb .dep1 > li.on > a,
#pm2-lnb .dep1 > li:hover > a {color:#1479c0;}
 #pm2-lnb .dep1 > li:hover > a {background:url('/img_up/shop_pds/brin/design/img/lnb_ov.png') no-repeat center bottom;}
#pm2-lnb .dep1 > li > div {display:none;overflow:hidden;position:absolute;text-align:left}
#pm2-lnb .dep1 > li:hover > div {display:block;background:red}

#pm2-lnb .dep2 {display:inline-block;padding:1px 20px 0;background:#1479c0;vertical-align:top;white-space:nowrap}
#pm2-lnb .dep2 > li {display:inline-block;font-size:0}
#pm2-lnb .dep2 > li > a {display:block;padding:10px 20px;font-size:14px;color:#fff;}
#pm2-lnb .dep2 > li > a.bt_img {padding:0}
#pm2-lnb .dep2 > li.on > a,
#pm2-lnb .dep2 > li:hover > a {color:#f6ff6a; font-weight:bold; text-decoration:underline}
</style>

<div id="pm2-lnb">
	<ul class="dep1">
		<li>
			<a href="/page/sub1_1">회사소개</a>
				<div>
					<ul class="dep2">
						<li><a href="/page/sub1_1">CEO인사말</a></li><li><a href="/myboard/sub1_2">연혁&실적</li><li><a href="/page/sub1_3">조직도</a></li><li><a href="/page/sub1_4">찾아오시는 길</a></li>
					</ul>
				</div>
		</li><li>
			<a href="/page/sub2_1">사업부문</a>
				<div>
					<ul class="dep2">
						<li><a href="/page/sub2_1">전자경매사업부</li><li><a href="/page/sub2_2">POS사업부</a></li><li><a href="/page/sub2_3">ICT사업부</a></li><li><a href="/page/sub2_6">시너지유통사업팀</a></li><li><a href="/page/sub2_4">SI사업부</a></li>
					</ul>
				</div>
		</li><li>
			<a href="/bbs/sub3_1">고객지원</a>
				<div>
					<ul class="dep2">
						<li><a href="/bbs/sub3_1">공지사항	</a></li><li><a href="/myboard/sub3_3">담당자안내</li><li><a href="/bbs/sub3_2">문의게시판</a></li>
					</ul>
				</div>
		</li><li>
			<a href="/page/sub4_1">인재채용</a>
				<div>
					<ul class="dep2">
						<li><a href="/page/sub4_1">채용절차</a></li><li><a href="/page/sub4_2">복리후생</a></li>
					</ul>
				</div>
		</li>
	</ul>
</div>

<script>
var navigationHorizon = new NavigationHorizon($('#pm2-lnb'));

function NavigationHorizon($this){
	var
		$dep1 = $this.find('.dep1')
		,$lis1 = $dep1.children('li')
		,dep1right = $dep1.offset().left + $dep1.outerWidth()
	;
	$lis1.each(function(){
		var
			$dep2div = $(this).children('div')
		;
		$(this).on('mouseenter',function(){
			var
				dep2right = $(this).offset().left + $dep2div.outerWidth()
			;
             $('#header .lnb_bg').show();
			if(dep2right > dep1right){
				$dep2div.css('right','0');
			}
		});
		$(this).on('mouseleave',function(){
			$dep2div.removeAttr('style');
             $('#header .lnb_bg').hide();
		});
	});
}
</script>
<div class="mnb">
        
<style>
#pm2-mnb { z-index:10}
#pm2-mnb * {box-sizing:border-box}
#pm2-mnb ul {margin:0;padding:0;list-style:none}
#pm2-mnb a {display:block;overflow:hidden;white-space:nowrap;text-overflow:ellipsis}
#pm2-mnb a > img {vertical-align:top}

/* toggle button 
#pm2-mnb .toggle {margin-bottom:5px}
#pm2-mnb .toggle span {display:block;padding:12px 5px;background:#e2e4e7;font-family:'Helvetica';font-size:14px;color:#333;cursor:pointer;text-align:center}
#pm2-mnb .toggle.on span {background:#94989b;color:#fff}*/

/* slideNav */
#pm2-mnb .slideNav {position:fixed; top:0; left:-80%; width:80%; height:100%; background:#fff; overflow-x:scroll; z-index:99;  }
#pm2-mnb .slideNav.on {left:0;}
 
/* navigation index */
#pm2-mnb .dep1 {position:relative; width:78%; margin:25px auto 46px; }
#pm2-mnb .dep1 > li {margin-top:35px;}
#pm2-mnb .dep1 > li:first-child {margin-top:0;}
#pm2-mnb .dep1 > li > a { font-size:1.25rem; color:#222; border-bottom:2px solid #767676; line-height:2.5rem;}
#pm2-mnb .dep1 > li > a.bt_img {padding:0}
#pm2-mnb .dep1 > li.on > a,
#pm2-mnb .dep1 > li:hover > a {}

#pm2-mnb .dep2 {}
#pm2-mnb .dep2 > li {margin:30px 0;}
#pm2-mnb .dep2 > li > a {font-size:1rem;color:#666; letter-spacing:-0.4px; height:27px; line-height:27px; }
#pm2-mnb .dep2 > li > a.bt_img {padding:0}
#pm2-mnb .dep2 > li.on > a,
#pm2-mnb .dep2 > li:hover > a {color:#0086e4; text-decoration:underline; }

/* two columns sub menu */
#pm2-mnb .col2 .dep2:after {content:'';display:block;clear:both}
#pm2-mnb .col2 .dep2 > li {float:left;width:50%}
#pm2-mnb .col2 .dep2 > li > a {overflow:hidden;white-space:nowrap;text-overflow:ellipsis}

/* layer navigation */
#pm2-mnb .layer .dep1 {position:absolute;right:0;left:0}
 
/* toggle button */
#pm2-mnb .toggle {display:block; position:absolute; left:5%; top:52%; width:38px; cursor:pointer; z-index:100;  transition:all 0.35s cubic-bezier(0.645,0.045,0.355,1);}
#pm2-mnb .toggle .menu .line {width:100%; height:2px; background:#393939; display:block; margin:12px auto;
   -webkit-transition: all 0.5s ease-in-out;  -o-transition: all 0.5s ease-in-out;  transition: all 0.5s ease-in-out;}
 
 #pm2-mnb .toggle.on {left:83%;}
 #pm2-mnb .toggle.on .menu .line {background:#fff;}
 #pm2-mnb .toggle.on .menu span:first-child {webkit-transform: translateY(14px) rotate(45deg);  -ms-transform: translateY(14px) rotate(45deg);  -o-transform: translateY(14px) rotate(45deg);  transform: translateY(14px) rotate(45deg);}
 #pm2-mnb .toggle.on .menu span.second {opacity:0;}
 #pm2-mnb .toggle.on .menu span.last {-webkit-transform: translateY(-14px) rotate(-45deg);   -ms-transform: translateY(-14px) rotate(-45deg);  -o-transform: translateY(-14px) rotate(-45deg);  transform: translateY(-14px) rotate(-45deg)}
 
 
</style>

<div id="pm2-mnb">
	<div class="toggle">
      <div class="menu">
        <span class="line"></span>
        <span class="line second"></span>
        <span class="line last"></span>
      </div>
	</div>
	<div class="index col1 basic slideNav">
		<ul class="dep1">
			<li>
				<a href="/page/sub1_1">회사소개</a>
					<div>
						<ul class="dep2">
							<li><a href="/page/sub1_1">CEO인사말</li><li><a href="/myboard/sub1_2">연혁&실적</li><li><a href="/page/sub1_3">조직도</li><li><a href="/page/sub1_4">찾아오시는 길</li>
						</ul>
					</div>
			</li><li>
				<a href="/page/sub2_1">사업부문</a>
					<div>
						<ul class="dep2">
							<li><a href="/page/sub2_1">전자경매사업부</li><li><a href="/page/sub2_2">POS사업부</li><li><a href="/page/sub2_3">ICT사업부</li><li><a href="/page/sub2_6">시너지유통사업팀</li><li><a href="/page/sub2_4">SI사업부</a></li>
						</ul>
					</div>
			</li><li>
				<a href="/bbs/sub3_1">고객지원</a>
					<div>
						<ul class="dep2">
							<li><a href="/bbs/sub3_1">공지사항	</li><li><a href="/myboard/sub3_3">담당자안내</li><li><a href="/bbs/sub3_2">문의게시판</a></li>
						</ul>
					</div>
			</li><li>
				<a href="/page/sub4_1">인재채용</a>
					<div>
						<ul class="dep2">
							<li><a href="/page/sub4_1">채용절차</li><li><a href="/page/sub4_2">복리후생</li>
						</ul>
					</div>
			</li>
		</ul>
	</div>
</div>

<script>
var toggleNavigation = new ToggleNavigation($('#pm2-mnb'));

function ToggleNavigation($this){
	var
		$button = $this.find('.toggle')
		,$nav = $this.find('.slideNav')
	;

	$button.on('click', function(){
		$(this).toggleClass('on');
		$nav.toggleClass('on');
           $('#header .mnb_bg').toggleClass('on');
         $('#header_s .mnb_bg').toggleClass('on');
         $('body').toggleClass('on');

		return false;
	});
}
</script>      
</div>
</nav>
</div>
<div class="gnb">
  <ul>
    <li><a href="/main">Home</a></li>
    <!-- <li class="health"><a href="/page/health"><span>브레인헬스케어</span></a></li> -->
    <li><a href="javascript:popup_window('/shop_info/privacy',600,600)">개인정보취급방침</a></li>
  </ul>
</div>
</div>