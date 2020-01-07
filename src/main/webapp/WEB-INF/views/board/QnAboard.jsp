<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!--  상단메뉴바 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/board.css">
<script type="text/javascript">
	/*[ Fixed Header ]*/
	var headerDesktop = $('.container-menu-desktop');
	var wrapMenu = $('.wrap-menu-desktop');
	$(headerDesktop).addClass('fix-menu-desktop');
	$(window).on('scroll', function() {
		if (true) {
			$(headerDesktop).addClass('fix-menu-desktop');
			$(wrapMenu).css('top', 0);
		}
	});
</script>
<style>

</style>
</head>
<body>


	<div class="container">
		<a href="#" class="board_logo"><img src="resources/img/qna.png" alt="IMG-LOGO"></a>
		<table class="table table-hover boardTable">
			<thead>
				<tr>
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
				<!-- 공지넣을곳? -->
				<tr height="63" id="board_notice">
					<td align="left">#459234</td>
					<td align="left">공지</td>
					<td width="500"><a href=""> 문의에 대한 답변은 다소 시간이 소요될 수 있습니다. </a></td>
					<td align="left" width="150">관리자</td>
					<td align="left" width="170">2019-11-11 11:11:11 <!--  원하는 날짜 형식으로 출력하기 위해 fmt태그 사용 --> <%-- <fmt:formatDate
                value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
            </td> --%>
					<td width="80" align="center">4523</td>
					<td width="80" align="center">54231</td>
					<td width="80" align="center">0</td>
				</tr>

				<!--  게시글 -->
				<c:if test="${map.count ==0}">
					<tr align="center" bgcolor="#FFFFFF" height="30">
						<td colspan="6">등록된 글이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="row" items="${map.list}">
					<tr height="63">
						<td align="left">${row.bno}</td>
						<td align="left">${row.viewcnt}</td>
						<td width="500"><a href="${path}/view?bno=${row.bno}"> ${row.title} <c:if test="${row.recnt >0 }">
									<span style="color: red;">(${row.recnt}) </span>
								</c:if>
						</a></td>
						<td align="left" width="150">${row.userId}</td>
						<td align="left" width="170">
							<!--  원하는 날짜 형식으로 출력하기 위해 fmt태그 사용 --> <fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
						</td>
						<td width="80" align="center">${row.viewcnt}</td>
						<td width="80" align="center">${row.viewcnt}</td>
						<td width="80" align="center">${row.viewcnt}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="text-center">
			<button class="btn btn-primary Rbtnmargin" type="button">글쓰기</button>
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
			<form name="form" method="post" action="${path}/Mainboard">
				<select class="form-control formcon_sel" name="searchOption">
					<option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"/>>제목+이름+내용</option>
					<option value="writer" <c:out value="${map.searchOption == 'writer'?'selected':''}"/>>이름</option>
					<option value="content" <c:out value ="${map.searchOption == 'content'?'selected':''}"/>>내용</option>
					<option value="title" <c:out value="${map.searchOption == 'title'?'selected':''}"/>>제목</option>
				</select> <input name="keyword" class="form-control formcon_key" value="${map.keyword}"> <input type="submit" class="btn btn-primary formcon_sub" value="조회">
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