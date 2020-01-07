<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MovieAce</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="resources/img/icons/favicon.png" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/slick/slick.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="resources/css/util.css">
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<!--===============================================================================================-->
<style>
.starR1 {
	background: url('resources/img/ico_review.png') no-repeat -52px 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR2 {
	background: url('resources/img/ico_review.png') no-repeat right 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}
 
.starR1.on {
	background-position: 0 0;
}

.starR2.on {
	background-position: -15px 0;
}
.modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}

.modal {
	text-align: center;
}

#modal_right {
	margin-left: 5%;
	float: left;
	width: 60%;
}
#modal_right p{
	display: inline;
}

#modal_left {
	width: 30%;
	float: left;
}

@media screen and (min-width:1000px) {
	.modal:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
	#textarea {
		background-color: gray;
		border: solid black;
		width: inherit;
		opacity: 0.8;
	}
	textarea::placeholder {
		color: blue;
		font-weight: bold;
	}
}

</style>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
</head>
<body class="animsition">
	<jsp:include page="./include/header.jsp"></jsp:include>
	<!-- -----------------------------여기까지 상단 메뉴바!! (전부 통일 '~')------------------------------------- -->


	<section class="section-slide">
		<div class="wrap-slick1 rs2-slick1">
			<div class="slick1">
				<div class="item-slick1 bg-overlay1"
					style="background-image: url(http://image2.megabox.co.kr//mop/frontbanner/2019/2E/B6AB50-4770-4D47-8EC4-62F6A33A0E3F.jpg);"
					data-thumb="images/thumb-02.jpg);" data-thumb="images/thumb-01.jpg"
					data-caption="Women’s Wear">
					<div class="container h-full">
						<div class="flex-col-c-m h-full p-t-100 p-b-60 respon5">
							<div class="layer-slick1 animated visible-false"
								data-appear="fadeInDown" data-delay="0">
								<span class="ltext-202 txt-center cl0 respon2"> 겨울왕국2! </span>
							</div>

							<div class="layer-slick1 animated visible-false"
								data-appear="fadeInUp" data-delay="800">
								<h2 class="ltext-104 txt-center cl0 p-t-22 p-b-40 respon1">
									New arrivals</h2>
							</div>

							<div class="layer-slick1 animated visible-false"
								data-appear="zoomIn" data-delay="1600">
								<a href="search.do?searchKeyword=겨울왕국2"
									class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn2 p-lr-15 trans-04">
									자세히보기 </a>
							</div>
						</div>
					</div>
				</div>

				<div class="item-slick1 bg-overlay1"
					style="background-image: url(http://image2.megabox.co.kr//mop/frontbanner/2019/E7/7C7A7E-5511-460F-9644-0D6B2B0D0BD8.jpg);"
					data-thumb="images/thumb-02.jpg" data-caption="Men’s Wear">
					<div class="container h-full">
						<div class="flex-col-c-m h-full p-t-100 p-b-60 respon5">
							<div class="layer-slick1 animated visible-false"
								data-appear="rollIn" data-delay="0">
								<span class="ltext-202 txt-center cl0 respon2"> 라라랜드의 </span>
							</div>

							<div class="layer-slick1 animated visible-false"
								data-appear="lightSpeedIn" data-delay="800">
								<h2 class="ltext-104 txt-center cl0 p-t-22 p-b-40 respon1">
									라이언 고슬링</h2>
							</div>

							<div class="layer-slick1 animated visible-false"
								data-appear="slideInUp" data-delay="1600">
								<a href="search.do?searchKeyword=드라이브"
									class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn2 p-lr-15 trans-04">
									드라이브 보러가기 </a>
							</div>
						</div>
					</div>
				</div>

				<div class="item-slick1 bg-overlay1"
					style="background-image: url(http://image2.megabox.co.kr//mop/frontbanner/2019/61/3512AA-03B1-417A-9FEE-18BE0F448079.jpg);"
					data-thumb="images/thumb-03.jpg" data-caption="Men’s Wear">
					<div class="container h-full">
						<div class="flex-col-c-m h-full p-t-100 p-b-60 respon5">
							<div class="layer-slick1 animated visible-false"
								data-appear="rotateInDownLeft" data-delay="0">
								<span class="ltext-202 txt-center cl0 respon2"> 공유와 함께하는
								</span>
							</div>

							<div class="layer-slick1 animated visible-false"
								data-appear="rotateInUpRight" data-delay="800">
								<h2 class="ltext-104 txt-center cl0 p-t-22 p-b-40 respon1">
									부산행 토크</h2>
							</div>

							<div class="layer-slick1 animated visible-false"
								data-appear="rotateIn" data-delay="1600">
								<a href="search.do?searchKeyword=부산행"
									class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn2 p-lr-15 trans-04">
									신청하기 </a>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</section>

	<div class="boxoffice">
		<h1 id="box_title">Box Office</h1>
		<table class="box_table">
			<tr>
				<c:forEach var="movie" items="${box}" varStatus="status">
					<td class="table_data"><c:forTokens var="Poster_URL"
							items="${movie.poster}" delims="\|" begin="0" end="0">
							<img src="${Poster_URL}" alt="이미지 없음">
						</c:forTokens>
						<p></p>

						<p>
							<button type="button" class="btn btn-primary btn-lg modal_btn"
								id="modal_btn" data-target=".bd-example-modal-lg"
								data-toggle="modal" onclick="modal_detail(${movie.moviecd});">상세정보</button>
							<button type="button"
								class="btn btn-primary btn-lg btn-danger modal_btn"
								id="modal_btn2" onclick="add_wishlist(${movie.moviecd});">추가하기</button>
						</p></td>
					<c:if test="${status.count % 5 eq 0}">
			</tr>
			<tr>
				</c:if>
				</c:forEach>
			</tr>
		</table>

		<div class="modal fade bd-example-modal-lg modal_btn" tabindex="-1"
			id="myModal" role="dialog" aria-labelledby="myLargeModalLabel"
			aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<hr>
					<div class="modal-header">
						<div id="modal_left">
							<img id="movie_img" alt="사진 없음"
								style="width: 213px; height: 305px;">
						</div>
						<div id="modal_right">
							감독 : <p id="director" ></p><br><br>					
							배우:<p id="actor"></p><br><br>
							개봉일:<p id="opendt"></p><br><br>
							상영시간:<p id="runtime"></p><br><br>
							장르:<p id="genre"></p><br><br>
							누적관객수:<p id="audiacc"></p><br><br>
							<p hidden="false" id="moviecd"></p>
							<button type="button" class="btn btn-primary" id="addWish" onclick="add_modalWishList();">Add wishlist</button>
						</div>
					</div>
					<div class="modal-body">
						<h4>줄거리</h4>
						<br>
						<p id="plot"></p>
						<hr>
						<table style="width: 100%;">
							<th>별점</th>
							<tr>
								<div>
									<td style="width: 30%;">
										<div id="TestStar" class="starRev">
											<span class="starR1">0.5</span> <span class="starR2">1.0</span>
											<span class="starR1">1.5</span> <span class="starR2">2.0</span>
											<span class="starR1">2.5</span> <span class="starR2">3.0</span>
											<span class="starR1">3.5</span> <span class="starR2">4.0</span>
											<span class="starR1">4.5</span> <span class="starR2">5.0</span>
										</div>
									</td>
									<td align="left" style="padding-left: 8%;"><label
										id="rateResult"></label></td>
								</div>
							</tr>
						</table>
						<h4>한줄평</h4>
						<br>
						<sec:authorize access="isAnonymous()">
						<div class="textbox">
							<textarea id="textarea" title="한줄평" cols="60px" rows="5px"
								maxlength="80" placeholder="로그인이 필요한 서비스 입니다" readonly>
							</textarea>
						</div>
						</sec:authorize>
						
						<sec:authorize access="isAuthenticated()">
						<div class="textbox">
							<textarea id="textarea" title="한줄평" cols="60px" rows="5px"
								maxlength="80" placeholder="한줄평 쓰세요."></textarea>
							<sec:authorize access="isAuthenticated()">
								<button type="button" class="btn btn-primary"
									onclick="modal_detail_write(${userInfo.member_no});">등록</button>
							</sec:authorize>
								
						</div>
						</sec:authorize>
						<hr>
						<h4>댓글</h4>
						<br>
						<div>
							<table id="reply" class="table">
							</table>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">
							닫기</button>
					</div>

				</div>
			</div>
		</div>

	</div>
	<div class="movieInfo">
		<div class="movieInfo_title">
			<span>MovieAce의 추천 영화</span>
		</div>
		<div class="sm_mv_bg" id="mv_bg">

			<figure class="mv_view">
				<div class="mv_full">
					<video id="mv_video" controls="controls" width="100%;"
						height="100%;" poster="resources/img/poster/frozen2_mv.png"
						preload="none"
						src="http://mvod.megabox.co.kr/encodeFile/3550/2019/09/27/f30ddc5d606eb93e9dd836038e16e4d8_W.mp4"
						type="video/mp4">
					</video>
				</div>
			</figure>
		</div>
		<div class="poster">
			<img class="sm_mv_bg_img" alt="frozen2"
				src="resources/img/poster/frozen2.jpg"
				onclick="mv_click('http://mvod.megabox.co.kr/encodeFile/3550/2019/09/27/f30ddc5d606eb93e9dd836038e16e4d8_W.mp4','resources/img/poster/frozen2_mv.png');">
			<img class="sm_mv_bg_img" alt="ASHFALL"
				src="resources/img/poster/ASHFALL.jpg"
				onclick="mv_click('http://mvod.megabox.co.kr/encodeFile/3550/2019/12/06/dc5b4936174d011d417e04fb82c1133e_W.mp4','resources/img/poster/ashfall_mv.png');"><br>
			<img class="sm_mv_bg_img" alt="weathering with you"
				src="resources/img/poster/weathering.jpg"
				onclick="mv_click('http://m.mvod.megabox.co.kr/encodeFile/3550/2019/06/10/0c538a4992f6184e4327647ac76b8e9e_I.mp4','http://image2.megabox.co.kr//mop/frontbanner/2019/D7/C9AB75-C206-4EAC-B85A-8FA5D7E9A11B.jpg');">
			<img class="sm_mv_bg_img" alt="cats"
				src="resources/img/poster/cats.jpg"
				onclick="mv_click('http://mvod.megabox.co.kr/encodeFile/3550/2019/10/22/d62c53e27026121568c1d0a118789ccb_W.mp4','resources/img/poster/cats_mv.png');">
		</div>
	</div>
	<div class="temp"></div>
	<a href="#" onclick="window.scrollTo(0,0);return false;"><span
		class="toptop">젤위로 가자</span></a>
	<footer id="main_footer">
		<a href="#" class="logo2"> <img src="resources/img/logo.png"
			alt="IMG-LOGO"></a><br>
		<br> <span class="dev_list">개발자: 오민영, 박경남, 염승훈, 이아르미</span> <a
			href="javascript:popupOpen();" class="comecome">오시는길</a>
		<p class="copyright">
			"위 내용에 대한 저작권 및 법적 책임은 자료제공사 또는 글쓴이에 있으며 MovieAce의 입장과 다를 수 있습니다."<br>
			
		</p>
	</footer>




	<!--===============================================================================================-->
	<script src="resources/js/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources/vendor/bootstrap/js/popper.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources/vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
	<!--===============================================================================================-->
	<script src="resources/vendor/daterangepicker/moment.min.js"></script>
	<script src="resources/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="resources/vendor/slick/slick.min.js"></script>
	<script src="resources/vendor/slick/slick-custom.js"></script>
	<!-- 슬라이드 전용 -->
	<!--===============================================================================================-->
	<script src="resources/vendor/parallax100/parallax100.js"></script>
	<script>
        $('.parallax100').parallax100();
	</script>
	<!--===============================================================================================-->
	<script
		src="resources/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<script>
		$('.gallery-lb').each(function() { // the containers for all your galleries
			$(this).magnificPopup({
		        delegate: 'a', // the selector for gallery item
		        type: 'image',
		        gallery: {
		        	enabled:true
		        },
		        mainClass: 'mfp-fade'
		    });
		});
	</script>
	<!--===============================================================================================-->
	<script src="resources/vendor/isotope/isotope.pkgd.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources/vendor/sweetalert/sweetalert.min.js"></script>
	<script>
		$('.js-addwish-b2').on('click', function(e){
			e.preventDefault();
		});

		$('.js-addwish-b2').each(function(){
			var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-b2');
				$(this).off('click');
			});
		});

		$('.js-addwish-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-detail');
				$(this).off('click');
			});
		});

		/*---------------------------------------------*/

		$('.js-addcart-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to cart !", "success");
			});
		});
	</script>
	<!--===============================================================================================-->
	<script
		src="resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>

	<!-- --------------------============= 추천영화 부분 포스터랑 예고================================================== -->
	<script type="text/javascript">
		function mv_click(mv, poster) {
		$("#mv_video").attr("src", mv);			//예고
		$("#mv_video").attr("poster", poster);	//포스터
		}
	</script>
	<!--====================== 오시는 길 팝업창=======================================================================-->
	<script type="text/javascript">
	function popupOpen(){
        	var popUrl = "direction";
        	var popOption= "width=900, height=700, resizable=no";
        		window.open(popUrl,"",popOption);
        }
</script>
	<!--===============================================================================================-->
	<script src="resources/js/main.js"></script>
	<!-- 박경남 스크립트 -->
	<script>
	var csrfHeaderName ="${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
		function modal_replys(moviecode){
			var moviecd = moviecode;
			
			$.ajax({
				type:"post",
				beforeSend: function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				url:"${path}/detail/getReplys",
				data: {"moviecd":moviecd},
				success:function updateReplys(reply){
					//테이블에 붙이기
					//#reply 에 붙여야 한다.
					$('#reply').empty();
					var str = '<tr>';
					$.each(reply , function(i){
						if(i != 0){
							str += '<tr>';
						}
						str += '<td>아이디:' + reply[i].member_id + '</td><td>평점:'+reply[i].movie_rate +'</td><td>' +reply[i].movie_reply + '</td>';
						str += '</tr>'
					})
					$("#reply").append(str);
					
				} 
			});
		}


		function modal_detail(moviecode){
			$("#textarea").val('');
			  var moviecd = moviecode;
			  var param = "&moviecd=" + moviecd;
			  
			  
			  $.ajax({
				type: "get",
				url: "${path}/detail/modal?moviecd=" + moviecode,
				success: function check(movie){
					var poster = movie.poster.split("|");
					$("#movie_img").attr("src",poster[0]);
					$("#title").text(movie.title);
					$("#opendt").text(movie.opendt);
					$("#director").text(movie.director);
					$("#actor").text(movie.actor);
					$("#runtime").text(movie.runtime);
					$("#genre").text(movie.genre);
					$("#plot").text(movie.plot);
					$("#audiacc").text(movie.audiacc);
					$("#moviecd").text(movie.moviecd);
					
					//댓글 가져오는 함수
					modal_replys(movie.moviecd);
					$('.starRev span').parent().children('span').removeClass('on');
					$("#rateResult").text('');
					
					
				}
			  });
		}


		function modal_detail_write(memberno){
			var input_text = $('#textarea').val();
			var movie_code = $('#moviecd').text();
			var member_num = memberno;
			var rate = $("#rateResult").text();
			
			var alldata ={"member_no":member_num,"movie_reply":input_text,"moviecd":movie_code,"movie_rate":rate};
		    
			
			
			if(member_num != undefined){
			$.ajax({
				type: "post",
				beforeSend: function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				url: "${path}/detail/write",
				data: alldata,
				success: function(){
				 $("#textarea").val('');
				 
				 //글쓰고 나면 다시 댓글창 새로고침
				 modal_replys(movie_code);
				 
				},
				error: function(){
					alert("DB안에 한줄평이 이미 들어간 상태 입니다.");
				}
			});	
			}
			else{
				alert("로그인 혹은 회원가입을 해주세요.")
			}
		}
		
		function add_wishlist(moviecd){
			// var memberno = member_num;
			var moviecode = moviecd;
			var memberno = '${userInfo.member_no}';
			if(memberno == ''){
				alert("로그인 해주세요");
			}
			else{
			$.ajax({
				type: "get",
				url: "${path}/MovieInsert?moviecd=" + moviecode+"&member_no=" + memberno,
				success: function check(num){
					if(num == 0){
						alert("위시리스트에 등록 완료");
					}
					else{
						alert("이미 위시리스트에 있습니다.");
					}
				},
				error: function(m) {
					alert("실패" + m);
				}
			  });
			
			}
		}
function add_modalWishList(){		
			
			var moviecode = $("#moviecd").text();
			var wtitle =$("#title").text();
			var wdirector=$("#director").text();
			var wactor=$("#actor").text();
			var wopendt=$("#opendt").text();
			var wruntime=$("#runtime").text();
			var wgenre=$("#genre").text();
			var wplot=$("#plot").text();
			var wposter=$("#movie_img").attr("src");
			var waudiacc=$("#audiacc").text();
			var memberno = '${userInfo.member_no}';
			
			var alldata = {
					"member_no":memberno,
					"moviecd":moviecode,
					"title" : wtitle,
					"director":wdirector,
					"actor":wactor,
					"opendt":wopendt,
					"runtime":wruntime,
					"genre":wgenre,
					"plot":wplot,
					"poster":wposter,
					"audiacc":waudiacc
				};						

			 if(memberno == ''){
				alert("로그인 해주세요");
			}
			else{
			$.ajax({
				type: "get",
				url: "${path}/MovieInsert",
				data : alldata,
				success: function check(num){
					if(num == 0){
						alert("위시리스트에 등록 완료");
					}
					else{
						alert("이미 위시리스트에 있습니다.");
					}
				},
				error: function(m) {
					alert("실패" + m);
				}
			  });
			
			}
		}
		$(document).ready(function(){
				var rate=0.0;
				$('.starRev span').hover(function(){
			   		 $(this).parent().children('span').removeClass('on');
			   		 $(this).addClass('on').prevAll('span').addClass('on');
			   		 rate=$(this).text();
			   		 $("#rateResult").text(rate);
			  	  return false;
				});		
			});
		
	</script>
</body>
</html>