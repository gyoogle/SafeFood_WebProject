<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
<%-- ���� �ȿ� ����Ǿ��ִ��� ���� --%>
	<%
		session.setAttribute("id", null);
		response.sendRedirect("main.safefood");
	%>
</body>
</html>