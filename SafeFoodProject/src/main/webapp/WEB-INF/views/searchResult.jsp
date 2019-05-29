<%@page import="com.mvc.vo.Food"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	
<script type="text/javascript">

function eatchk(){
	return confirm("���� �Ͻðڽ��ϱ�?");
}

function savechk(){
	return confirm("�� �Ͻðڽ��ϱ�?");
}
</script>

<style type="text/css">
.navbar-brand {
	margin-top: -10px;
	margin-left: -10px;
}

.badge {
	padding: 1px 9px 2px;
	font-size: 12.025px;
	font-weight: bold;
	white-space: nowrap;
	color: #ffffff;
	background-color: #999999;
	-webkit-border-radius: 9px;
	-moz-border-radius: 9px;
	border-radius: 9px;
}

.badge:hover {
	color: #ffffff;
	text-decoration: none;
	cursor: pointer;
}

.badge-error {
	background-color: #b94a48;
}

.badge-error:hover {
	background-color: #953b39;
}

.badge-warning {
	background-color: #f89406;
}

.badge-warning:hover {
	background-color: #c67605;
}

.badge-success {
	background-color: blue;
}

.badge-success:hover {
	background-color: blue;
}

.badge-info {
	background-color: red;
}

.badge-info:hover {
	background-color: red;
}

.badge-inverse {
	background-color: #333333;
}

.badge-inverse:hover {
	background-color: #1a1a1a;
}

html, body {
	height: 100%;
}

header {
	height: 50px;
}

footer {
	left: 0px;
	bottom: 0px;
	height: 180px;
	width: 100%;
	background: white;
	text-align: center;
}

.eventbar {
	margin-top: 30px;
	margin-bottom: 30px;
}
</style>
</head>
<body>
	<!-- ��� -->
	<%@include file="template_up.jsp"%>
	<%
		List<Food> list = (List<Food>) request.getAttribute("list");
		int size = (Integer)request.getAttribute("size");
	%>
	<div class="container">

		<c:if test="${size != 0 }">
		<h1>
			"<%=request.getAttribute("search")%>" �� ���� �˻� ��� �Դϴ�
		</h1>
		<hr>
		</c:if>
		<c:if test="${size == 0}">
		<h1>
			"<%=request.getAttribute("search")%>" �� ���� �˻� ����� �����ϴ�.
		</h1>
		<br>
		
		<h4 style="color: blue"><%=(Integer)request.getAttribute("leng")%>���� ����˻� ����Դϴ�.</h4>
		</c:if>


		<hr>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>��ǰ��ȣ</th>
					<th>�̹���</th>
					<th>��ǰ��</th>
					<th>������</th>
					<th>Į�θ�</th>
					<th>�߰�</th>
				</tr>
			</thead>
			<%
				for (Food f : list) {
			%>
			<tr>
				<td><%=f.getId()%></td>
				<td><img src="resources/<%=f.getImg()%>" height="40px" alt="..."></td>
				<td><a href="read.safefood?f_id=<%=f.getId()%>"><%=f.getName()%></a>
				</td>
				<td><%=f.getMaker()%></td>
				<td><%=f.getCalory()%></td>
				<td>
					<a href="eat.safefood?id=${id }&fnum=<%=f.getId()%>" class="btn btn-primary" role="button" onclick="return eatchk();">����</a>
					<a href="save.safefood?id=${id }&fnum=<%=f.getId()%>" class="btn btn-warning" role="button" onclick="return savechk();">��</a>
				</td>
			</tr>
			<%
				}
			%>
		</table>
	</div>

	<!--     ���� �� -->
	<%@include file="template_down.jsp"%>
</body>
</html>