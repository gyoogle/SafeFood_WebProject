<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
<%-- 세션 안에 저장되어있던값 삭제 --%>
	<%
		session.setAttribute("id", null);
		response.sendRedirect("main.safefood");
	%>
</body>
</html>