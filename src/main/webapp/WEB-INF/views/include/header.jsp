<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page import="org.springframework.security.core.Authentication"%>
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
</head>

<body class="animsition">
	<!-- Header -->
	<header class="header-v3">
		<!-- Header desktop -->
		<div class="container-menu-desktop trans-03">
			<div class="wrap-menu-desktop">
				<nav class="limiter-menu-desktop p-l-45">

					<!-- Logo desktop -->
					<a href="/" class="logo"> <img src="resources/img/logo.png"
						alt="IMG-LOGO">
					</a>

					<!-- Menu desktop -->
					<div class="menu-desktop">
						<ul class="main-menu">
							<li><a href="/">Home</a></li>

							<li><a href="search">영화찾기</a></li>

							<li class="label1" data-label1="hot"><a href="/WishList">위시리스트</a></li>

							<li><a href="blog.html"></a></li>

							<li><a href="Movieboard">게시판</a>
								<ul class="sub-menu">
									<li><a href="Movieboard">영화 게시판</a></li>
									<li><a href="Freeboard">자유 게시판</a></li>
									<li><a href="QnAboard">문의 게시판</a></li>
								</ul></li>

							<li><a href="AdminPage">관리자</a></li>
						</ul>
					</div>

					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m h-full">
						<!--  검색 아이콘 -->
						<form name="searchForm" action="search.do" method="get"
							onsubmit="return goSearch()">
							<div class="flex-c-m h-full p-r-24">
								<!-- 검색 텍스트 -->
								<div>

									<input name="searchKeyword" class="searchKeyword" type="text"
										style="border-line: none; width: 300px; background-color: transparent; border-bottom: 3px solid white; color: white;"
										placeholder="영화명or감독명">

								</div>
								<!--  검색 아이콘 -->
								<div class="icon-header-item cl2 hov-cl1 trans-04 p-lr-11">
									<button class="zmdi zmdi-search"></button>
								</div>
							</div>
						</form>
						<div class="flex-c-m h-full p-r-25 bor6">
							<!-- 로그인 아이콘 -->
							<div
								class="icon-header-item cl0 hov-cl1 trans-04 p-lr-11 icon-header-noti js-show-cart"
								data-notify="0">
								<a href="#" class="zmdi"><img
									src="resources/img/Member30x30.png" alt="IMG-Login" /> <img
									src="resources/img/MemberLogin30x30.png" alt="IMG-Login" /></a>
							</div>
						</div>

						<!-- <div class="flex-c-m h-full p-lr-19">
							메뉴바 아이콘
							<div
								class="icon-header-item cl0 hov-cl1 trans-04 p-lr-11 js-show-sidebar">
								<i class="zmdi zmdi-menu"></i>
							</div>
						</div> -->
					</div>
				</nav>
			</div>
		</div>

		<!-- Header Mobile -->
		<div class="wrap-header-mobile">
			<!-- Logo moblie -->
			<div class="logo-mobile">
				<a href="/"><img src="resources/img/logo.png" alt="IMG-LOGO"></a>
			</div>

			<!-- Icon header -->
			<div class="wrap-icon-header flex-w flex-r-m h-full m-r-15">
				<div class="flex-c-m h-full p-r-5">
					<div
						class="icon-header-item cl2 hov-cl1 trans-04 p-lr-11 icon-header-noti js-show-cart"
						data-notify="0">
						<a href="#" class="zmdi"><img
							src="resources/img/Member30x30.png" alt="IMG-Login" /> <img
							src="resources/img/MemberLogin30x30.png" alt="IMG-Login" /></a>
					</div>
				</div>
			</div>

			<!-- Button show menu -->
			<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box"> <span class="hamburger-inner"></span>
				</span>
			</div>
		</div>


		<!-- Menu Mobile -->
		<div class="menu-mobile">
			<ul class="main-menu-m">
				<li><a href="/">Home</a></li>
				<li><a href="search">영화찾기</a></li>
				<li class="label1" data-label1="hot"><a href="WishList">위시리스트</a></li>
				<li><a href="Movieboard">게시판</a>
					<ul class="sub-menu-m">
						<li><a href="Movieboard">영화 게시판</a></li>
						<li><a href="Freeboard">자유 게시판</a></li>
						<li><a href="QnAboard">문의 게시판</a></li>
					</ul> <span class="arrow-main-menu-m"> <i
						class="fa fa-angle-right" aria-hidden="true"></i>
				</span></li>

				<li><a href="AdminPage">관리자</a></li>
			</ul>
		</div>
	</header>


	<!-- Sidebar -->
	<aside class="wrap-sidebar js-sidebar">
		<div class="s-full js-hide-sidebar"></div>

		<div class="sidebar flex-col-l p-t-22 p-b-25">
			<div class="flex-r w-full p-b-30 p-r-27">
				<div
					class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-sidebar">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>

			<div class="sidebar-content flex-w w-full p-lr-65 js-pscroll">
				<ul class="sidebar-link w-full">
					<li class="p-b-13"><a href="/"
						class="stext-102 cl2 hov-cl1 trans-04"> Home </a></li>

					<li class="p-b-13"><a href="#"
						class="stext-102 cl2 hov-cl1 trans-04"> My Wishlist </a></li>

					<li class="p-b-13"><a href="#"
						class="stext-102 cl2 hov-cl1 trans-04"> My Account </a></li>

					<li class="p-b-13"><a href="#"
						class="stext-102 cl2 hov-cl1 trans-04"> Track Oder </a></li>

					<li class="p-b-13"><a href="#"
						class="stext-102 cl2 hov-cl1 trans-04"> Refunds </a></li>

					<li class="p-b-13"><a href="#"
						class="stext-102 cl2 hov-cl1 trans-04"> Help & FAQs </a></li>
				</ul>

				<div class="sidebar-gallery w-full p-tb-30">
					<span class="mtext-101 cl5"> @ 급하신분 </span>
				</div>

				<div class="sidebar-gallery w-full">
					<span class="mtext-101 cl5"> About Us </span>

					<p class="stext-108 cl6 p-t-27">
						Captain 이아르미, <br> Boss &nbsp;&nbsp;&nbsp;&nbsp; 오민영,<br>
						Assistant 염승훈, <br>President 박경남
					</p>
				</div>
			</div>
		</div>
	</aside>

	<!-- MY Info -->
	<div class="wrap-header-cart js-panel-cart">
		<div class="s-full js-hide-cart"></div>

		<div class="header-cart flex-col-l p-l-65 p-r-25">
			<div class="header-cart-title flex-w flex-sb-m p-b-8">
				<sec:authorize access="isAuthenticated()">
					<span class="mtext-103 cl2"> ${userInfo.member_id } </span>
				</sec:authorize>
				<sec:authorize access="isAnonymous()">
					<span class="mtext-103 cl2"> Guest </span>
				</sec:authorize>
				<div
					class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>

			<div class="header-cart-content flex-w js-pscroll">


				<div class="w-full">
					<sec:authorize access="isAuthenticated()">
						<div class="header-cart-buttons flex-w w-full">
							<a href="/modifyMyinfo"
								class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
								내정보수정 </a>
							<form action="/logout" method="POST">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<button type="submit"
									class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">로그아웃</button>
							</form>
						</div>
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
						<div class="header-cart-buttons flex-w w-full">
							<a href="loginModalPage" data-target="#modal-testNew"
								role="button" data-toggle="modal" data-bmdWidth="640"
								data-bmdHeight="480"
								class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
								로그인 </a>
							<!-- <a href="/loginPage" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10"> 로그인 </a> -->
							<a href="/signUp"
								class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
								회원가입 </a>
						</div>
					</sec:authorize>
				</div>
			</div>
		</div>
	</div>

	<div id="modal-testNew" class="modal fade" tabindex="-1" role="dialog"
		style="margin-top: 50px;">
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>
	<!-- 노란선이지만 여기에있어야 잘 작동됨 -->
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<!--===============================================================================================-->
	<script src="resources/js/jquery-3.2.1.min.js"></script>
	<!-- 제이쿼리 입니다 꼭 필요 -->
	<!--===============================================================================================-->
	<script src="resources/vendor/animsition/js/animsition.min.js"></script>
	<!-- 상단 메뉴 애니메이션 관련 중요! -->
	<!--===============================================================================================-->
	<script src="resources/vendor/bootstrap/js/popper.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources/js/main.js"></script>
	<script src="resources/js/header_js.js"></script>
	<!-- -----------------------------여기까지 상단 메뉴바!! (전부 통일 '~')------------------------------------- -->


</body>
</html>
