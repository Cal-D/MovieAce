<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상단바 테스뚜</title>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="resources/js/jquery.raty.js"></script>
<link href="http://vjs.zencdn.net/c/video-js.css" rel="stylesheet" />
<script src="http://vjs.zencdn.net/c/video.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<style>
body {
  margin: 0px;
  padding: 0px;
  background-color: #FDFCF0;
}

div#wapper {
  width: 100%;
  text-align: center;
  margin: 0 auto;
}

.jbTitle {
  text-align: center;
}

.jbMenu {
  z-index: 4;
  text-align: center;
  background-color: #EBE9DC;
  padding: 10px 0px;
  width: 100%;
  font-size: 25px;
  word-spacing: 15px;
  cursor: pointer;
  min-width: 1400px;
}

.jbMenu p {
  text-align: right;
}

.jbMenu a {
  float: left;
  margin-left: 50px;
  margin-top: 18px;
}

.jbFixed {
  position: fixed;
  top: 0px;
}

.nav_slide {
  margin: 0 auto;
  width: 100%;
  height: 600px;
  margin-top: -15px;
  cursor: pointer;
}

.img_slide dd {
  height: 600px;
  width: 100%;
  position: absolute;
  float: left;
}

.prenext {
  z-index: 3;
  position: absolute;
  top: 50%;
  left: 0;
  width: 100%;
}

.prev {
  width: 66px;
  height: 66px;
  color: #198591;
  text-decoration: none;
  position: absolute;
  display: block;
  background-image:
    url("http://image2.megabox.co.kr/mop/home/main/arrow.png");
  background-repeat: no-repeat;
  background-position: 0px;
}

.next {
  right: 30px;
  width: 66px;
  height: 66px;
  color: #198591;
  overflow: hidden;
  position: absolute;
  text-decoration: none;
  text-indext: -999px;
  display: block;
  background-image:
    url("http://image2.megabox.co.kr/mop/home/main/arrow.png");
  background-repeat: no-repeat;
  background-position-x: right;
  background-position-y: 0;
}

.Main_section {
  height: 1000px;
  width: 1200px;
  margin: 0 auto;
  background-color: teal;
}

.Main_article1 {
  width: 970px;
  height: 500px;
  float: left;
  background-color: fuchsia;
  display: block;
}

.Main_article2 {
  width: 970px;
  height: 500px;
  float: left;
  background-color: olive;
  display: block;
}

/* .Main_aside {
  width: 230px;
  height: 1000px;
  float: left;
  background-color: navy;
} */
.footer {
  width: 100%;
  height: 200px;
  margin: 0 auto;
  clear: both;
  overflow: hidden;
  background-color: gray;
}

.formcon {
  margin-top: 20px;
}

.formcon_sel {
  width: 250px;
  float: left;
}

.formcon_key {
  width: 20%;
  float: left;
  margin-left: 10%;
}

.formcon_sub {
  float: left;
}
</style>
<script>
	$(document).ready(function() {
		var jbOffset = $('.jbMenu').offset();
		$(window).scroll(function() {
			if ($(document).scrollTop() > jbOffset.top) {
				$('.jbMenu').addClass('jbFixed');
			} else {
				$('.jbMenu').removeClass('jbFixed');
			}
		});
	});

	$(function() {
		$(".img_slide dd:eq(0)").show();

		$(".prenext .prev")
				.click(
						function() {
							//기본설정
							var ddnum = [];
							var dtnum = [];
							var num = '';
							for (var i = 0; i < $(".img_slide dd").size(); i++) {
								if ($(".img_slide dd:eq(" + i + ")").css(
										"display") == "block") {
									num = i;
								}
								ddnum.push($(".img_slide dd:eq(" + i + ")"));
							}
							//초기설정
							$(".img_slide dd").fadeOut("normal");
							var allnum = $(".img_slide dd").size() - 1;
							for (var i = 0; i < allnum; i++) {
								if (num == i + 1) {
									ddnum[i].fadeIn("normal");
								} else if (num == 0) {
									ddnum[6].fadeIn("normal");
								}
							}

						});

		//다음버튼클릭시
		$(".prenext .next")
				.click(
						function() {
							//기본설정
							var ddnum = [];
							var dtnum = [];
							var num = '';
							for (var i = 0; i < $(".img_slide dd").size(); i++) {
								if ($(".img_slide dd:eq(" + i + ")").css(
										"display") == "block") {
									num = i;
								}
								ddnum.push($(".img_slide dd:eq(" + i + ")"));//dd 배열
							}
							//초기설정
							$(".img_slide dd").fadeOut("normal");//dd가림처리
							var allnum = $(".img_slide dd").size() - 1;
							for (var i = 0; i < allnum; i++) {
								if (num == i) {
									ddnum[i + 1].fadeIn("normal");
								} else if (num == allnum) {
									ddnum[0].fadeIn("normal");
								}
							}
						});

		$(".nav_slide").hover(function() {
			$(".prenext").fadeIn("fast");
		}, function() {
			$(".prenext").fadeOut("fast");
		});
	})
</script>
</head>
<body>
	<div id="wapper">
		<header>
			<!-- <div class="jbTitle">
        <h1>영화 영화</h1>
      </div> -->
			<div class="jbMenu">
				<a>영화 영화</a>
				<div class="formcon">
					<form name="form" method="post" action="${path}/Mainboard">
						<%-- <select class="form-control formcon_sel" name="searchOption">
              <option value="all"
                <c:out value="${map.searchOption == 'all'?'selected':''}"/>>제목+저자+내용+역자</option>
              <option value="writer"
                <c:out value="${map.searchOption == 'writer'?'selected':''}"/>>저자</option>
              <option value="content"
                <c:out value ="${map.searchOption == 'content'?'selected':''}"/>>내용</option>
              <option value="title"
                <c:out value="${map.searchOption == 'title'?'selected':''}"/>>제목
              </option>
            </select>  --%>
						<!-- 셀렉트부분은 아직 안쓸듯? -->
						<input name="keyword" class="form-control formcon_key" value="${map.keyword}"> <input type="submit" class="btn btn-primary formcon_sub" value="검색">
					</form>
				</div>
				<p>박스오피스 | 추천영화 | 이달의 영화 | 게시판 | 내정보</p>
			</div>
		</header>
		<nav class="nav_slide">
			<div class="prenext" style="display: none;">
				<a class="prev" href="javascript:void(0);" title="이전 메인비주얼보기"></a> <a class="next" href="javascript:void(0);" title="다음 메인비주얼보기"></a>
			</div>
			<dl class="img_slide">
				<dd style="display: block;">
					<img class="Main_img" alt="" src="http://image2.megabox.co.kr//mop/frontbanner/2019/D1/8FE2D1-1795-4801-95FB-F1303E0991EB.jpg">
				</dd>
				<dd style="display: block;">
					<img class="Main_img" alt="" src="http://image2.megabox.co.kr//mop/frontbanner/2019/D7/C9AB75-C206-4EAC-B85A-8FA5D7E9A11B.jpg">
				</dd>
				<dd style="display: block;">
					<img class="Main_img" alt="" src="http://image2.megabox.co.kr//mop/frontbanner/2019/54/8604D9-8CC6-4DCA-80EC-B3989E68007A.jpg">
				</dd>
				<dd style="display: block;">
					<img class="Main_img" alt="" src="http://image2.megabox.co.kr//mop/frontbanner/2019/9C/356F89-AD69-43D5-9985-249ABF1B1495.jpg">
				</dd>
				<dd style="display: block;">
					<img class="Main_img" alt="" src="http://image2.megabox.co.kr//mop/frontbanner/2019/1D/D227CA-4D33-4306-BC43-BC7E5E9CC42B.jpg">
				</dd>
				<dd style="display: block;">
					<img class="Main_img" alt="" src="http://image2.megabox.co.kr//mop/frontbanner/2019/DD/D95A67-F12B-4C4F-8D07-03AF3A4ED72E.jpg">
				</dd>
				<dd style="display: block;">
					<img class="Main_img" alt="" src="http://image2.megabox.co.kr//mop/frontbanner/2019/E7/7C7A7E-5511-460F-9644-0D6B2B0D0BD8.jpg">
				</dd>
			</dl>
		</nav>
		<section class="Main_section">
			<article class="Main_article1">아티클 1</article>
			<article class="Main_article2">아티클 2</article>
			<aside class="Main_aside">어사이드</aside>
		</section>
		<footer class="footer"> 푸터 </footer>
	</div>
</body>
</html>