<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>test페이지</h2>
	
	<%
		Enumeration ses = session.getAttributeNames();
		int i=0;
		String s_name;
		String s_value;
		while(ses.hasMoreElements()){
			i++;
			s_name=ses.nextElement().toString();
			s_value=session.getAttribute(s_name).toString();
			out.print("<HR>세션 이름["+i+"]: "+s_name);
			out.print("<br/>세션 값["+i+"]: "+s_value);
		}
	%>
	<%
		
	%>
</body>
</html>