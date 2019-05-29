<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- ��� -->
	<%@include file="template_up.jsp"%>
	<div class="container">
		<h1>���� ���</h1>
		<form action="main.safefood" method="get">
			<table class="table table-hover">
				<thead>
					<tr>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tr>
					<td>���� ID</td>
					<td><input type="text" name="f_id"></td>
				</tr>
				<tr>
					<td>���� �̸�</td>
					<td><input type="text" name="f_name"></td>
				</tr>
				<tr>
					<td>���� ����</td>
					<td><select name="ingredient">
							<option value="���� ������ ������ �ּ���" selected="selected">����
								������ ������ �ּ���
							<option value="�ѽ�">�ѽ�
							<option value="�߽�">�߽�
							<option value="���">���
					</select></td>
				</tr>
				<tr>
					<td>���� �����</td>
					<td><input type="radio" name="nutrient" value=ź��ȭ��>ź��ȭ��
						<input type="radio" name="nutrient" value=�ܹ���>�ܹ���
						<input type="radio" name="nutrient" value=����>����
					</td>
				</tr>
			</table>


			<hr>
			<input type=submit name="code" value="submit"><input
				type=reset value="reset">
			<hr>
			<a href="list.safefood">back</a>
		</form>
	</div>

	<!--     ���� �� -->
	<%@include file="template_down.jsp"%>
</body>
</html>