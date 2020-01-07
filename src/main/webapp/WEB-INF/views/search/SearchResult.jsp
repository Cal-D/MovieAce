<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MovieAce</title>
<!--======================상단 메뉴 바 검은색으로 고정 ===========================  -->
<script>
	var headerDesktop = $('.container-menu-desktop');
	var wrapMenu = $('.wrap-menu-desktop');
	$(headerDesktop).addClass('fix-menu-desktop');
	$(window).on('scroll', function() {
		if (true) {
			$(headerDesktop).addClass('fix-menu-desktop');
			$(wrapMenu).css('top', 0);
		}

	});
	function clicke(thumnail, plot, movieNm, dirNm, genres, actors, type,
			runtime, opendt, movieCd) {

		$("#thumnail").attr("src", thumnail);
		$("#mName").text(movieNm);
		$("#mPlot").text(plot);
		$("#mDir").text(dirNm);
		$("#mGenre").text(genres);
		$("#mActor").text(actors);
		console.log(actors);
		$("#mRuntime").text(runtime);
		$("#mOpen").text(opendt);
		$("#mCode").text(movieCd);

		showReply(movieCd);

	}
	
	function add_modalWishList(){
		var mdir = $('#mDir').text();
		var mname = $("#mName").text();
		var mactor = $("#mActor").text();
		var mopendt = $("#mOpen").text();
		var mruntime = $("#mRuntime").text();
		var mgenre = $("#mGenre").text();
		var mplot = $("#mPlot").text();
		var mposter = $("#thumnail").attr("src");
		var mcode = $('#mCode').text();
		var memberno = '${userInfo.member_no}';
		var audi = 0;
		
		var alldata = {
				"member_no":memberno,
				"moviecd":mcode,
				"title" : mname,
				"director":mdir,
				"actor":mactor,
				"opendt":mopendt,
				"runtime":mruntime,
				"genre":mgenre,
				"plot":mplot,
				"poster":mposter,
				"audiacc":'0'
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
	/* 스프링시큐리티 보안에 관한 토큰 */
	var csrfHeaderName ="${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";

	function showReply(movieCd) {

		var moviecd = movieCd;

		$.ajax({
			type : "post",
			beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			url : "/rate/getReply",
			data : {
				"moviecd" : moviecd
			},
			success : function updateReplys(reply) {
				//테이블에 붙이기
				//#reply 에 붙여야 한다.
				$('#reply').empty();
				var str = '<tr>';
				$.each(reply, function(i) {
					if (i != 0) {
						str += '<tr>';
					}
					str += '<td>아이디:' + reply[i].member_id + '</td><td>평점:'
							+ reply[i].movie_rate + '</td><td>댓글내용: '
							+ reply[i].movie_reply + '</td>';
					str += '</tr>'
				})
				$("#reply").append(str);

			},
			error : function() {
				alert("DB안에 한줄평이 이미 들어간 상태 입니다.");
			}
		});
	}

	function writeReply() {
		var member_no = "${userInfo.member_no}"; //회원번호
		var mRate = $('#rateResult').text();
		var mdir = $('#mDir').text();
		var mname = $("#mName").text();
		var mactor = $("#mActor").text();
		var mopendt = $("#mOpen").text();
		var mruntime = $("#mRuntime").text();
		var mgenre = $("#mGenre").text();
		var mplot = $("#mPlot").text();
		var mposter = $("#thumnail").attr("src");
		var mcode = $('#mCode').text();
		var comment = $('#inputComment').val();
		console.log("영화코드: " + mcode + "코멘트: " + comment);

		/* 		var alldata ={"member_no":member_num,"movie_reply":comment,"moviecd":mcode}; */
		var alldata = {
			"member_no" : member_no,
			"director" : mdir,
			"movieNm" : mname,
			"genres" : mgenre,
			"thumnailURL" : mposter,
			"actors" : mactor,
			"plot" : mplot,
			"runtime" : mruntime,
			"openDate" : mopendt,
			"movie_reply" : comment,
			"moviecd" : mcode,
			"movie_rate" : mRate
		};
		console.log(alldata);
		//		var alldata={"movieNm":mname,"movie_reply":comment, "moviecd":mcode};

		$.ajax({
			type : "post",
			beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			url : "/rate/setReply",
			data : alldata,
			success : function() {
				$("#inputComment").val("");

				//글쓰고 나면 다시 댓글창 새로고침
				showReply(mcode);

			},
			error : function() {
				alert("DB안에 한줄평이 이미 들어간 상태 입니다.");
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
<!-- <script src="resources/js/modal_js.js"></script> -->
<style>
.modal {
	top: 13%;
	margin-top: -50px;
}
.starR1{
    background: url('resources/img/ico_review.png') no-repeat -52px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR2{
    background: url('resources/img/ico_review.png') no-repeat right 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR1.on{background-position:0 0;}
.starR2.on{background-position:-15px 0;}


#modal_right {
	margin-left: 5%;
	float: left;
	width: 60%;
}

#modal_left {
	width: 30%;
	float: left;
}

.table {
	border-collapse: collapse;
	border-top: 3px solid #168;
}

#inputComment {
		background-color: white;
		border: solid black;
		width: inherit;
		opacity: 0.8;
}
p { display: inline }
</style>
</head>
<body>

	<!-- Modal -->
	<div id="myModal" class="modal fade bd-example-modal-lg" tabindex="-1"
		role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
			<!--===============================================================================  -->
					<hr>
					<div class="modal-header">
						<div id="modal_left">
							<img src=""	id="thumnail" style="width: 213px; height: 305px;">
						</div>
						<div id="modal_right">
						
								<h3 id="mName"></h3><br>																
								감독 : <p id="mDir" ></p><br><br>					
								배우:<p id="mActor"></p><br><br>
								개봉일:<p id="mOpen"></p><br><br>
								상영시간:<p id="mRuntime"></p><br><br>
								장르:<p id="mGenre"></p><br><br>
								<p hidden="false" id="mCode"></p>
								<button type="button" class="btn btn-primary" id="addWish" onclick="add_modalWishList();">Add wishlist</button>						
						</div>
						
					</div>
					<div class="modal-body">
						<h4>줄거리</h4>
						<br>
						<p id="mPlot"></p>
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
							<textarea id="inputComment" title="한줄평" cols="60px" rows="5px"
								maxlength="80" placeholder="로그인이 필요한 서비스 입니다." readonly></textarea>
						</div>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
						<div class="textbox">
							<textarea id="inputComment" title="한줄평" cols="60px" rows="5px"
								maxlength="80" placeholder="한줄평 쓰세요."></textarea>
							<button type="button" class="btn btn-primary"
								onclick="writeReply();">등록</button>
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
			<!--===============================================================================  -->

				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<h1 style="text-align: center;">
		<b>통합검색 </b>
	</h1>
	<h3>검색한 단어는 : ${keyword }</h3>
	<%-- <h4> 영화명 검색 결과:${MovieSearchResult }</h4> --%>
	<%-- <h4>감독명 검색 결과:${DirectorSearchResult }</h4> --%>

	<table id="example-table-1" border="1">
		<th>연출작 검색결과:</th>
		<th>${fn:length(DirectorSearchResult)}건</th>
		<c:if test="${not empty DirectorSearchResult }">
			<c:forEach var="dir" items="${DirectorSearchResult }">
				<tr>
					<td rowspan="4"><c:if test="${dir.thumnailURL ne null}">
							<a data-toggle="modal" data-target=".bd-example-modal-lg"
								onclick="clicke('${dir.thumnailURL }','${dir.plot }','${dir.movieNm }','${dir.director }','${dir.genres }','${dir.actors }','${dir.typeNm }','${dir.runtime }','${dir.openDate }','${dir.movieCd }');">
								<img src="${dir.thumnailURL }">
							</a>
						</c:if> <c:if test="${dir.thumnailURL eq null}">
							<c:set var="url" value="/resources/img/basicposter.png" />
							<a data-toggle="modal" data-target=".bd-example-modal-lg"
								onclick="clicke('${url }','${dir.plot }','${dir.movieNm }','${dir.director }','${dir.genres }','${dir.actors }','${dir.typeNm }','${dir.runtime }','${dir.openDate }','${dir.movieCd }');">
								<img
								src="${pageContext.request.contextPath}/resources/img/basicposter.png">
							</a>
						</c:if></td>

					<td>영화명: <c:if test="${dir.thumnailURL ne null}">
							<a data-toggle="modal" data-target=".bd-example-modal-lg"
								onclick="clicke('${dir.thumnailURL }','${dir.plot }','${dir.movieNm }','${dir.director }','${dir.genres }','${dir.actors }','${dir.typeNm }','${dir.runtime }','${dir.openDate }','${dir.movieCd }');">
								${dir.movieNm }</a>
						</c:if> <c:if test="${dir.thumnailURL eq null}">
							<c:set var="url" value="/resources/img/basicposter.png" />
							<a data-toggle="modal" data-target=".bd-example-modal-lg"
								onclick="clicke('${url }','${dir.plot }','${dir.movieNm }','${dir.director }','${dir.genres }','${dir.actors }','${dir.typeNm }','${dir.runtime }','${dir.openDate }','${dir.movieCd }');">
								${dir.movieNm } </a>
						</c:if>
					</td>
				</tr>
				<tr>
					<td>감독명: ${dir.director }</td>
				</tr>
				<tr>
					<td>장르 : ${dir.genres }</td>
				</tr>
				<tr>
					<td>배우 : ${dir.actors }</td>
				</tr>

				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty DirectorSearchResult }">
			<tr>
				<td></td>
				<td>검색결과가 없습니다</td>
			</tr>
		</c:if>

		<th>영화명 검색결과:</th>
		<th>${fn:length(MovieSearchResult)}건</th>
		<c:if test="${not empty MovieSearchResult }">
			<c:forEach var="m" items="${MovieSearchResult }">
				<tr>
					<td rowspan="4"><c:if test="${m.thumnailURL ne null}">
							<a data-toggle="modal" data-target=".bd-example-modal-lg"
								onclick="clicke('${m.thumnailURL }','${m.plot }','${m.movieNm }','${m.director }','${m.genres }','${m.actors }','${m.typeNm }','${m.runtime }','${m.openDate }','${m.movieCd }');">
								<img src="${m.thumnailURL }" onclick="">
							</a>
						</c:if> <c:if test="${m.thumnailURL eq null}">
							<c:set var="url" value="/resources/img/basicposter.png" />
							<a data-toggle="modal" data-target=".bd-example-modal-lg"
								onclick="clicke('${url }','${m.plot }','${m.movieNm }','${m.director }','${m.genres }','${m.actors }','${m.typeNm }','${m.runtime }','${m.openDate }','${m.movieCd }');">
								<img src="/resources/img/basicposter.png">
							</a>
						</c:if></td>

					<td><c:if test="${m.thumnailURL ne null}">
							<a data-toggle="modal" data-target=".bd-example-modal-lg"
								onclick="clicke('${m.thumnailURL }','${m.plot }','${m.movieNm }','${m.director }','${m.genres }','${m.actors }','${m.typeNm }','${m.runtime }','${m.openDate }','${m.movieCd }');">
								영화명: ${m.movieNm }</a>
						</c:if> <c:if test="${m.thumnailURL eq null}">
							<c:set var="url" value="/resources/img/basicposter.png" />
							<a data-toggle="modal" data-target=".bd-example-modal-lg"
								onclick="clicke('${url }','${m.plot }','${m.movieNm }','${m.director }','${m.genres }','${m.actors }','${m.typeNm }','${m.runtime }','${m.openDate }','${m.movieCd }');">
								영화명: ${m.movieNm }</a>
						</c:if></td>
				</tr>
				<tr>
					<td>감독명: ${m.director }</td>
				</tr>
				<tr>
					<td>장르 : ${m.genres }</td>
				</tr>
				<tr>
					<td>배우 : ${m.actors }</td>
				</tr>

				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty MovieSearchResult }">
			<tr>
				<td></td>
				<td>검색결과가 없습니다</td>
			</tr>
		</c:if>
	</table>

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</body>
</html>