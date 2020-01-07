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
	//5초 후 메인 페이지 이동
	//setTimeout("location.href='/'",5000);
	var time = 5;
	setInterval(function () {
		$(".Welcome_body").append('<br>'+time+'...')
		time--;
		if(time==0){
			location.href='/';
		}
	},1000);
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
		<div class="Welcome_header">회원 정보 수정이 완료되었습니다.</div>
		<div class="Welcome_body">
			<br> 5초 후 메인페이지로 이동합니다.
		</div>
		<div class="Welcome_aside">
			<img alt="" src="resources/img/welcome.png">
		</div>
	</div>

</body>
</html>