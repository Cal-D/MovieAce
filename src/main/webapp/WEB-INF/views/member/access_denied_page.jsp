  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css">
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<title>Access Denied</title>
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
</head>
<%
	String referer = request.getHeader("REFERER");
	pageContext.setAttribute("referer", referer);
%>
<body>
      <br><br><br><br><br>
      <div class="container text-center">
          <h1>Access Denied</h1><br>
      </div>
      <br><br>
      <div class="container text-center">
          <h6 class="font-italic text-danger">권한이 없어 접근이 불가합니다.<br>관리자에게 문의하세요.</h6>
      </div>
      <br><br>
      <div class="container text-center">
        <p id="link" class="text-dark"><i class="fas fa-undo"></i><p>
      </div>

<script>
	$("#link").click(function () {
		var prevPage = "${pageScope.referer}";
		if(prevPage == ''){
			location.href="/";
		}else{
			location.href=prevPage;
		}
	})
</script>     
</body>
</html>