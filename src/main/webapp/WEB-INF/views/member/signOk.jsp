<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
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
</script>
<style type="text/css">
.Welcome{
 margin: 0 auto;
  width: 60%;
  margin-top: 100px;
}
.Welcome_header{
  border: 1px solid;
  font-size: 30px;
  text-align: center;
}
.Welcome_body{
  float: left;
  font-size: 15px;
  width: 400px;
  font-family: 'Source Sans Pro', 'Helvetica Neue', Helvetica, Arial, sans-serif;
  text-align: center;
}
.Welcome_aside img{
  float: right;
  width: 500px;
  height: 300px;
}
.Welcome_footer{
  margin-top: 250px;
  margin-left: 30px;
  width: 400px;
  height: 100px;
}
</style>
</head>
<body>
	<div class="Welcome">
		<div class="Welcome_header">가입을 환영합니다</div>
		<div class="Welcome_body">
			<br> "인생은 모두가 함께하는 여행이다.<br> 매일매일 사는 동안 우리가 할 수 있는건<br> 최선을 다해 이 멋진 여행을 만끽하는 것이다"<br> 영화 '어바웃타임'中
			<hr>
			<br> MovieAce의 여행에 함께 해주셔서 감사합니다.<br>
			<br> 이제부턴 MovieAce의 모든 서비스를 이용하실 수 있습니다.
		</div>
		<div class="Welcome_aside">
			<img alt="" src="resources/img/welcome.png">
		</div>
		<div class="Welcome_footer">
			<a href="loginModalPage" data-target="#modal-testNew" role="button" data-toggle="modal" data-bmdWidth="640" data-bmdHeight="480" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10"> 로그인 </a>
		</div>
	</div>

</body>
</html>