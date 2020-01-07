<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
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
<style type="text/css">
.loginpage{
  margin-top: 70px;
}
</style>

<title>Login</title>
</head>

<body>
   <div class="modal-content">
	<div class="modal-header">
	<div class="container text-center loginpage">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">×</button>
		<h1>Welcome To Movie Ace</h1>
		<br>
	</div>
	</div>
	
	<div class="modal-body">
	<div class="container col-md-4">
		<form class="px-4 py-3" action="/login" method="post">
			<div class="form-group">
				<label for="exampleDropdownFormEmail1">ID</label> 
				<input type="text"
					class="form-control" name="id" placeholder="아이디">
			</div>
			<div class="form-group">
				<label for="exampleDropdownFormPassword1">Password</label> 
				<input type="password" class="form-control" name="password" placeholder="비밀번호">
					
				<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
					<font color="red">
						<p>
							${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
						</p>
						<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
					</font>
				</c:if>
			</div>
			<div class="form-check">
				<label class="form-check-label"> 
					<input type="checkbox" class="form-check-input"> Remember me
				</label>
			</div>
			<input name="${_csrf.parameterName}" type="hidden"
				value="${_csrf.token}" />
			<button type="submit" class="btn btn-primary">Sign in</button>
		</form>
		<div class="dropdown-divider"></div>
		<a class="dropdown-item" href="/signUp">New around here? Sign up</a><br/>
		<a class="dropdown-item" href="#">Forgot password?</a>
	</div>
	</div>
	<div class="modal-footer">
	</div>
	</div>

</body>
</html>