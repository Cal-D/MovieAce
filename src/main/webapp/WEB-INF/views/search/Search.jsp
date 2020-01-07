<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</script>
<style>
	.searchText {
		font-size: 24px;
		border-line: none;
		width: 30%;
		border-bottom: 5px solid black;
		background-color: transparent;
		display: inline;
		text-align:center;
		margin-left:35%;
	}	
	
	.searchBtn{
		display: inline;
		white-space: nowrap; 
		width: 90px;
		height: 45px;
		border-radius: 3px;
		text-align:center;
	}
	.searchBtn:hover{
		background-color: transparent;
	}

</style>
</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<h1 style="text-align: center;">
		<b>통합검색 </b>
	</h1>
	<form action="search.do" method="get">
		<br> <br> <br> <br> <br> 
	<span>
		<input name="searchKeyword" class="searchText" type="text"	placeholder="영화명or감독명" onsubmit="return goSearch()">
		<button class="searchBtn" >검색go</button>
	</span>
	</form>


</body>
</html>