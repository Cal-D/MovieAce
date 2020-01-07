<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" type="text/css" href="resources/css/wishlist.css"> -->

<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	/*[ Fixed Header ] 항시 검정색 유지  */
	var headerDesktop = $('.container-menu-desktop');
	var wrapMenu = $('.wrap-menu-desktop');
	$(headerDesktop).addClass('fix-menu-desktop');
	$(window).on('scroll', function() {
		if (true) {
			$(headerDesktop).addClass('fix-menu-desktop');
			$(wrapMenu).css('top', 0);

		}
	});



$(document).ready(function() {
$('#deleteCheckModal').on('show.bs.modal', function (event) {
var button = $(event.relatedTarget);
var deleteUrl = button.data('title');
var modal = $(this);
})



});

var csrfHeaderName ="${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";

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
			$("#opendt").text("개봉일 : " + movie.opendt);
			$("#director").text("감독 : " + movie.director);
			$("#actor").text("출연 배우 : " + movie.actor);
			$("#runtime").text("상영시간 : " + movie.runtime + "분");
			$("#genre").text("장르 : " + movie.genre);
			$("#plot").text(movie.plot);
			$("#audiacc").text("누적 관객수 : " + movie.audiacc + "명");
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
			alert("등록평을 이미 남기셨습니다.");
		}
	});	
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
<style type="text/css">

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
.container {
	margin-top: 70px;
	padding-top: 10px;
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

.table {
	border-collapse: collapse;
	border-top: 3px solid #168;
}

.table th, .table td {
	padding: 10px;
	border: 1px solid #ddd;
}

.table th:first-child, .table td:first-child {
	border-left: 0;
}

.table th:last-child, .table td:last-child {
	border-right: 0;
}

.table caption {
	caption-side: bottom;
	display: none;
}
</style>
</head>
<body>

	<div class="container">
		<c:if test="${empty wishlist}">
			<h1>현재 위시리스트에 등록된 영화가 없습니다.</h1>
		</c:if>
		<c:if test="${not empty wishlist}">
			<table class="table">
				<tr>
					<c:forEach var="movie" items="${wishlist}" varStatus="status">
						<td class="table_data"><c:forTokens var="Poster_URL"
								items="${movie.poster}" delims="\|" begin="0" end="0">
								<img src="${Poster_URL}" alt="이미지 없음">
							</c:forTokens>
							<p id="movie_title">${movie.title}</p>
							<p>개봉일: ${movie.opendt}</p>
							<p>장르 : ${movie.genre}</p>
							<p>상영시간 :${movie.runtime}분</p>
							<P hidden="true">멤버 넘버: ${movie.member_no}</P>

							<p>
								<button type="button" class="btn btn-primary btn-lg modal_btn"
									id="modal_btn" data-target=".bd-example-modal-lg"
									data-toggle="modal" onclick="modal_detail(${movie.moviecd});">자세히</button>
								<button type="button"
									class="btn btn-primary btn-lg btn-danger modal_btn"
									id="modal_btn2"
									onclick="location.href='/MovieDel?moviecd=${movie.moviecd}&member_no=${movie.member_no}'">삭제</button>
							</p></td>
						<c:if test="${status.count % 4 eq 0}">
				</tr>
				<tr>
					</c:if>
					</c:forEach>
				</tr>
			</table>
		</c:if>
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
							<h3 id="title"></h3>
							<p id="director"></p>
							<p id="actor"></p>
							<p id="opendt"></p>
							<p id="runtime"></p>
							<p id="genre"></p>
							<p id="audiacc"></p>
							<p hidden="false" id="moviecd"></p>
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
						<div class="textbox">
							<textarea id="textarea" title="한줄평" cols="60px" rows="5px"
								maxlength="80" placeholder="한줄평 쓰세요."></textarea>
							<button type="button" class="btn btn-primary"
								onclick="modal_detail_write(${userInfo.member_no});">등록</button>
						</div>
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
</body>
</html>