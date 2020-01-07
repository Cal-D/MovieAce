<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!--  상단메뉴바 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
<!-- <link rel="stylesheet" href="resources/css/site.css"> -->
<!-- <link rel="stylesheet" href="resources/vendor/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="resources/vendor/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="resources/vendor/bootstrap/js/bootstrap.js"></script> -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>

<script>
/*[ Fixed Header ]*/
var headerDesktop = $('.container-menu-desktop');
var wrapMenu = $('.wrap-menu-desktop');
$(headerDesktop).addClass('fix-menu-desktop');
$(window).on('scroll',function(){
    if(true) {
        $(headerDesktop).addClass('fix-menu-desktop');
        $(wrapMenu).css('top',0); 
    } 
});

	$(document).ready(function() {
		$(".Rbtnmargin").click(function() {
			location.href = "${path}/write";				
			
		});
	});
	function list(page) {
		location.href = "${path}/Movieboard?curPage=" + page
				+ "&searchOption-${map.searchOption}"
				+ "&keyword=${map.keyword}";
	}
	
	$(document).ready(function() {
        $("#lout").click(function(){
  			location.href='myinfo';
  		});
      	
    	  $("#logOutBnt").click(function(){
    			if(confirm("로그아웃 하시겠습니까?")){
    				location.href='logout';
    			}
    		});
      });
</script>
<style>
body {
  height: 900px;
  background-color: #D6E6F5;
}

.board_logo {
  text-align: center;
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  align-items: center;
  height: 65%;
  margin-right: 55px;
}

.board_logo img {
  text-align: center;
  max-width: 120px;
  max-height: 120px;
}

.container {
  margin-top: 70px;
  padding-top: 10px;
}

.Rbtnmargin {
  float: right;
}

.boardTable {
  margin-top: 10px; border : 5px ridge #FAED7D;
  background-color: #FDFCF0;
  border: 5px ridge #FAED7D;
}

.boardTable>thead {
  background-color: aqua;
  max-height: 20px;
}

.boardTable>tbody{
  cursor: pointer;
  max-height: 20px;
  height: 30px;
}

.main_title {
  font-size: 40px;
}

.boardTable a:link {
  color: red;
  text-decoration: none;
}

.boardTable a:visited {
  color: black;
  text-decoration: none;
}

.boardTable a:hover {
  color: black;
  text-decoration: underline;
}
tbody tr{
  max-height: 20px;
  height: 30px;
}

#title {
  text-align: center;
}

#board_notice {
  background-color: #CEFBC9;
  height: 45px;
  font-size: 16px;
  font-weight: bolder;
}

#like, #hit, #report {
  text-align: center;
}
.formcon{
  height: 500px;
}
.formcon_sel {
  width: 200px;
  float: left;
  margin-left: 240px;
}

.formcon_key {
  width: 300px;
  float: left;
}

.formcon_sub {
  float: left;
}

#main_footer {
  clear: both;
  width: 100%;
  height: 150px;
  background-color: #FDFCF0;
  margin: 0 auto;
}

.copyright {
  overflow: hidden;
  position: relative;
  text-align: center;
  vertical-align: baseline;
  margin: 80px 0px 0px 0px;
}


</style>
</head>
<body>


	<div class="container">
		<a href="#" class="board_logo"><img src="resources/img/movieboard.png" alt="IMG-LOGO"></a>
		<table class="table table-hover boardTable">
			<thead>
				<tr >
					<th width="100">번호</th>
					<th width="100">구분</th>
					<th id="title" width="500" align="center">제목</th>
					<th id="writer" width="150">작성자</th>
					<th width="170">작성일</th>
					<th id="like" width="80">추천</th>
					<th id="hit" width="80">조회수</th>
					<th id="report" width="80">신고!!</th>
				</tr>
			</thead>
			<tbody>
				<!-- 공지넣을곳 -->
				<c:forEach var="row" items="${map.noticelist}">
				 	<tr id="board_notice" height="50">
						<td align="left" >##${row.mboard_no}</td>
						<td align="left" >${row.mboard_header}</td>
						<td width="500" ><a href="${path}/view?mboard_no=${row.mboard_no}"> ${row.mboard_title} <c:if test="${row.mboard_reply_cnt >0 }">
									<span style="color: red;">(${row.mboard_reply_cnt}) </span>
								</c:if>
						</a></td>
						<td align="left" width="150" >${row.member_id}</td>
						<td align="left" width="190" >
							<!--  원하는 날짜 형식으로 출력하기 위해 fmt태그 사용 --> <fmt:formatDate value="${row.mboard_reg_date}" pattern="yyyy-MM-dd HH:mm:ss" />
						</td>
						<td width="80" align="center">${row.mboard_like_cnt}</td>
						<td width="80" align="center" >${row.mboard_hit_cnt}</td>
						<td width="80" align="center" >${row.mboard_report_cnt}</td>
					</tr>
				</c:forEach>
				<c:forEach var="row" items="${map.list}">
					<tr>
						<td align="left" >${row.mboard_no}</td>
						<td align="left" >${row.mboard_header}</td>
						<td width="500" ><a href="${path}/view?mboard_no=${row.mboard_no}"> ${row.mboard_title} <c:if test="${row.mboard_reply_cnt >0 }">
									<span style="color: red;">(${row.mboard_reply_cnt}) </span>
								</c:if>
						</a></td>
						<td align="left" width="150" >${row.member_id}</td>
						<td align="left" width="190" >
							<!--  원하는 날짜 형식으로 출력하기 위해 fmt태그 사용 --> <fmt:formatDate value="${row.mboard_reg_date}" pattern="yyyy-MM-dd HH:mm:ss" />
						</td>
						<td width="80" align="center">${row.mboard_like_cnt}</td>
						<td width="80" align="center" >${row.mboard_hit_cnt}</td>
						<td width="80" align="center" >${row.mboard_report_cnt}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="text-center">
			<c:if test="${userInfo.member_no != null}">
			<button class="btn btn-primary Rbtnmargin" type="button">글쓰기</button>
			</c:if>
			<ul class="pagination justify-content-center">
				<li class="page-item">
					<%-- <c:if test="${map.boardPager.curBlock > 1 }"> 처음으로 가는 코드 --%> <a class="page-link" href="javascript:list('1')" aria-label="previous"> <span aria-hidden="true">&laquo;</span> <span class="sr-only">previous</span>
				</a>
				</li>
				<c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
					<c:choose>
						<c:when test="${num ==map.boardPager.curPage}">
							<li class="page-item"><a class="page-link" style="color: red">${num}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="javascript:list('${num}')">${num}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<li class="page-item"><c:if test="${map.boardPager.curBlock <=map.boardPager.totBlock}">
						<a class="page-link" href="javascript:list('${map.boardPager.nextPage}')" aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
						</a>
					</c:if></li>
				<li class="page-item"><c:if test="${map.boardPager.curPage <=map.boardPager.totPage}">
						<a class="page-link" href="javascript:list('${map.boardPager.totPage}')" aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
						</a>
					</c:if></li>
			</ul>
		</div>
		<div class="formcon">
			<form name="form" method="post" action="${path}/Movieboard">
				<select class="form-control formcon_sel" name="searchOption" style="height: 35px;">
					<option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"/>>제목+이름+내용</option>
					<option value="member_id" <c:out value="${map.searchOption == 'member_id'?'selected':''}"/>>이름</option>
					<option value="mboard_content" <c:out value ="${map.searchOption == 'mboard_content'?'selected':''}"/>>내용</option>
					<option value="mboard_title" <c:out value="${map.searchOption == 'mboard_title'?'selected':''}"/>>제목</option>
				</select>
				<input name="keyword" class="form-control formcon_key" value="${map.keyword}"/>
				<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}" /> 
				<input type="submit" class="btn btn-primary formcon_sub" value="조회">
			</form>
		</div>
	</div>
	<footer id="main_footer">
		<p class="copyright">
			"위 내용에 대한 저작권 및 법적 책임은 자료제공사 또는 글쓴이에 있으며 MovieAce의 입장과 다를 수 있습니다."<br> "Copyright (c)" <a href="home">www.MoiveAce.com</a> " All right reserved."
		</p>
	</footer>
</body>
</html>