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
	
	function list(page) {
		var url = document.location.href.split("?");
		console.log(url);
		location.href = "${path}/AdminPage?curPage=" + page + "&" + url[1];
	}
	function memberList(page){
		var url = document.location.href.split("?");
		console.log(url);
		location.href = "${path}/AdminPage?memPage=" + page + "&" + url[1];
		
	}
	function blackMemberList(page){
		var url = document.location.href.split("?");
		console.log(url);
		location.href = "${path}/AdminPage?blmPage=" + page + "&" + url[1];
		
	}
	
	
</script>
<style type="text/css">
.notice{
  margin-top: 70px;
  text-align: center;
  font-size: 50px;
  font-weight: bold;
}
.noticereport{
 text-align: center;
  font-size: 30px;
  font-weight: bold;
  margin-bottom: -50px;
}
.memberinfo{
  text-align: center;
  font-size: 30px;
  font-weight: bold;
}
</style>
</head>
<body>
	<div class="notice">관리자 전용</div><br>
	<div class="noticereport">신고글 관리</div>
	<div class="container">
		<a href="#" class="board_logo"><img src="resources/img/movieboard.png" alt="IMG-LOGO"></a>
		<table class="table table-hover boardTable-report">
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
					<td width="500"><a href=""> 자유롭게 이야기를 나누는 곳입니다. 욕설은 하지마세요 </a></td>
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
					<tr>
						<td align="left" >${row.mboard_no}</td>
						<td align="left" >${row.mboard_header}</td>
						<td width="500" ><a href="${path}/view?mboard_no=${row.mboard_no}"> ${row.mboard_title} 
								<c:if test="${row.mboard_reply_cnt >0 }">
									<span style="color: red;">(${row.mboard_reply_cnt}) </span>
								</c:if>
						</a></td>
						<td align="left" width="150" >${row.member_id}</td>
						<td align="left" width="170" >
							<!--  원하는 날짜 형식으로 출력하기 위해 fmt태그 사용 --> 
							<fmt:formatDate value="${row.mboard_reg_date}" pattern="yyyy-MM-dd HH:mm:ss" />
						</td>
						<td width="80" align="center">${row.mboard_like_cnt}</td>
						<td width="80" align="center" >${row.mboard_hit_cnt}</td>
						<td width="80" align="center" >${row.mboard_report_cnt}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="text-center">
			<button class="btn btn-primary Rbtnmargin" type="button">글쓰기</button>
			<ul class="pagination justify-content-center">
				<li class="page-item">
					<%-- <c:if test="${map.boardPager.curBlock > 1 }"> 처음으로 가는 코드 --%>
					<a class="page-link" href="javascript:list('1')" aria-label="previous"> <span aria-hidden="true">&laquo;</span> <span class="sr-only">previous</span>
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
	</div>
	<div class="container">
		<a href="#" class="board_logo"><img src="resources/img/freeboard.png" alt="IMG-LOGO"></a>
		<table class="table table-hover boardTable-report">
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
					<td width="500"><a href=""> 자유롭게 이야기를 나누는 곳입니다. 욕설은 하지마세요 </a></td>
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
					<tr>
						<td align="left" >${row.mboard_no}</td>
						<td align="left" >${row.mboard_header}</td>
						<td width="500" ><a href="${path}/view?mboard_no=${row.mboard_no}"> ${row.mboard_title} <c:if test="${row.mboard_reply_cnt >0 }">
									<span style="color: red;">(${row.mboard_reply_cnt}) </span>
								</c:if>
						</a></td>
						<td align="left" width="150" >${row.member_id}</td>
						<td align="left" width="170" >
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
			<button class="btn btn-primary Rbtnmargin" type="button">글쓰기</button>
			<ul class="pagination justify-content-center">
				<li class="page-item">
					<%-- <c:if test="${map.boardPager.curBlock > 1 }"> 처음으로 가는 코드 --%> 
					<a class="page-link" href="javascript:list('1')" aria-label="previous"> <span aria-hidden="true">&laquo;</span> <span class="sr-only">previous</span>
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
	</div>
	<hr>
	<div class="memberinfo">
		회원 정보 관리
	</div>
		<table class="table table-hover boardTable-report">
			<thead>
				<tr>
					<th>회원번호</th>
					<th>아이디</th>
					<th>이메일</th>
					<th>이름</th>
					<th>생일</th>
					<th>선호장르</th>
					<th>우편번호</th>
					<th>주소</th>
					<th>상세주소</th>
					<th>참고주소</th>
					<th>최근 로그인</th>
					<th>최근 로그아웃</th>
					<th>가입일</th>
					<th>권한</th>
					<th>차단여부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="member" items="${memberMap.memberList}">
					<%-- <c:if test="${member.enabled == 1}"> --%>
					<tr>
						<td align="left" >${member.member_no}</td>
						<td align="left" >${member.member_id}</td>
						<td align="left" >${member.member_email}</td>
						<td align="left" >${member.member_name}</td>
						<td align="left" >${member.member_birth}</td>
						<td align="left" >${member.genres}</td>
						<td align="left" >${member.postcode}</td>
						<td align="left" >${member.address}</td>
						<td align="left" >${member.detailAddress}</td>
						<td align="left" >${member.extraAddress}</td>
						<td align="left" >${member.member_recent_login}</td>
						<td align="left" >${member.member_recent_logout}</td>
						<td align="left" >${member.reg_date}</td>
						<td align="left" >
							<c:if test="${member.authority eq 'ROLE_ADMIN'}">
								<c:out value="관리자"/>
							</c:if>
							<c:if test="${member.authority eq 'ROLE_MEMBER'}">
								<c:out value="회원"/>
							</c:if>
						</td>
						<td align="left" >
							<c:if test="${member.enabled == 1}">
								<c:out value="X"/>
							</c:if>
							<c:if test="${member.enabled == 0}">
								<c:out value="O"/>
							</c:if>
						</td>
						<td align="left" >
							<input type="button" name="${member.member_no}" class="btn btn-danger" value="차단"/>
						</td>
					</tr>
					<%-- </c:if> --%>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="text-center">
			<ul class="pagination justify-content-center">
				<li class="page-item">
					<%-- <c:if test="${map.boardPager.curBlock > 1 }"> 처음으로 가는 코드 --%> 
					<a class="page-link" href="javascript:memberList('1')" aria-label="previous"> <span aria-hidden="true">&laquo;</span> <span class="sr-only">previous</span>
				</a>
				</li>
				<c:forEach var="num" begin="${memberMap.memberPager.blockBegin}" end="${memberMap.memberPager.blockEnd}">
					<c:choose>
						<c:when test="${num == memberMap.memberPager.curPage}">
							<li class="page-item"><a class="page-link" style="color: red">${num}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="javascript:memberList('${num}')">${num}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<li class="page-item"><c:if test="${memberMap.memberPager.curBlock <= memberMap.memberPager.totBlock}">
						<a class="page-link" href="javascript:memberList('${memberMap.memberPager.nextPage}')" aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
						</a>
					</c:if></li>
				<li class="page-item"><c:if test="${memberMap.memberPager.curPage <= memberMap.memberPager.totPage}">
						<a class="page-link" href="javascript:memberList('${memberMap.memberPager.totPage}')" aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
						</a>
					</c:if></li>
			</ul>
		</div>
		
		<hr>
	<div class="memberinfo">
		차단된 회원 정보 관리
	</div>
		<table class="table table-hover boardTable-report">
			<thead>
				<tr>
					<th>회원번호</th>
					<th>아이디</th>
					<th>이메일</th>
					<th>이름</th>
					<th>생일</th>
					<th>선호장르</th>
					<th>우편번호</th>
					<th>주소</th>
					<th>상세주소</th>
					<th>참고주소</th>
					<th>최근 로그인</th>
					<th>최근 로그아웃</th>
					<th>가입일</th>
					<th>권한</th>
					<th>차단여부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="member" items="${blackMemberMap.blackMemberList}">
					<%-- <c:if test="${member.enabled == 0}"> --%>
					<tr>
						<td align="left" >${member.member_no}</td>
						<td align="left" >${member.member_id}</td>
						<td align="left" >${member.member_email}</td>
						<td align="left" >${member.member_name}</td>
						<td align="left" >${member.member_birth}</td>
						<td align="left" >${member.genres}</td>
						<td align="left" >${member.postcode}</td>
						<td align="left" >${member.address}</td>
						<td align="left" >${member.detailAddress}</td>
						<td align="left" >${member.extraAddress}</td>
						<td align="left" >${member.member_recent_login}</td>
						<td align="left" >${member.member_recent_logout}</td>
						<td align="left" >${member.reg_date}</td>
						<td align="left" >
							<c:if test="${member.authority eq 'ROLE_ADMIN'}">
								<c:out value="관리자"/>
							</c:if>
							<c:if test="${member.authority eq 'ROLE_MEMBER'}">
								<c:out value="회원"/>
							</c:if>
						</td>
						<td align="left" >
							<c:if test="${member.enabled == 1}">
								<c:out value="X"/>
							</c:if>
							<c:if test="${member.enabled == 0}">
								<c:out value="O"/>
							</c:if>
						</td>
						<td align="left" >
							<input type="button" name="${member.member_no}" class="btn btn-success" value="해제"/>
						</td>
					</tr>
					<%-- </c:if> --%>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="text-center">
			<ul class="pagination justify-content-center">
				<li class="page-item">
					<%-- <c:if test="${map.boardPager.curBlock > 1 }"> 처음으로 가는 코드 --%> 
					<a class="page-link" href="javascript:blackMemberList('1')" aria-label="previous"> <span aria-hidden="true">&laquo;</span> <span class="sr-only">previous</span>
				</a>
				</li>
				<c:forEach var="num" begin="${blackMemberMap.blackMemberPager.blockBegin}" end="${blackMemberMap.blackMemberPager.blockEnd}">
					<c:choose>
						<c:when test="${num == blackMemberMap.blackMemberPager.curPage}">
							<li class="page-item"><a class="page-link" style="color: red">${num}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="javascript:blackMemberList('${num}')">${num}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<li class="page-item"><c:if test="${blackMemberMap.blackMemberPager.curBlock <= memberMap.blackMemberPager.totBlock}">
						<a class="page-link" href="javascript:blackMemberList('${blackMemberMap.blackMemberPager.nextPage}')" aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
						</a>
					</c:if></li>
				<li class="page-item"><c:if test="${blackMemberMap.blackMemberPager.curPage <= blackMemberMap.blackMemberPager.totPage}">
						<a class="page-link" href="javascript:blackMemberList('${blackMemberMap.blackMemberPager.totPage}')" aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
						</a>
					</c:if></li>
			</ul>
		</div>
		
		
		
	<footer id="main_footer">
		<p class="copyright">
			"위 내용에 대한 저작권 및 법적 책임은 자료제공사 또는 글쓴이에 있으며 MovieAce의 입장과 다를 수 있습니다."<br> "Copyright (c)" <a href="home">www.MoiveAce.com</a> " All right reserved."
		</p>
	</footer>
	
<script>	
	//시큐리티 보안 토큰
	var csrfHeaderName ="${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	//멤버 차단 기능
	$('.btn-danger:button').click(function () {
		var member_no = $(this).attr('name');
		//alert(member_no);
		
		$.ajax({
			url:"${pageContext.request.contextPath }/blockMember",
			type: 'POST',
			beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			dataType: "json",
			data: {
				mno : member_no
			},
			success:function(data){
				//alert(data);
				if(data == 1){
					alert("차단 완료");
					location.reload();
				}else{
					alert("오류 발생 <br>다시 확인 해주세요")
				}
			},
			error:function(request, status, error){
				console.log("error: "+error);
			}
		})
	})
	
	//멤버 차단해제 기능
	$('.btn-success:button').click(function () {
		var member_no = $(this).attr('name');
		//alert(member_no);
		
		$.ajax({
			url:"${pageContext.request.contextPath }/unlockMember",
			type: 'POST',
			beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			dataType: "json",
			data: {
				mno : member_no
			},
			success:function(data){
				//alert(data);
				if(data == 1){
					alert("해제 완료")
					location.reload();
				}else{
					alert("오류 발생 <br>다시 확인 해주세요")
				}
			},
			error:function(request, status, error){
				console.log("error: "+error);
			}
		})
	})
	
</script>
	

</body>
</html>