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
	<!-- 배너 -->
	<%@include file="template_up.jsp"%>
	<div class="container">
		<h1>음식 등록</h1>
		<form action="main.safefood" method="get">
			<table class="table table-hover">
				<thead>
					<tr>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tr>
					<td>음식 ID</td>
					<td><input type="text" name="f_id"></td>
				</tr>
				<tr>
					<td>음식 이름</td>
					<td><input type="text" name="f_name"></td>
				</tr>
				<tr>
					<td>음식 성분</td>
					<td><select name="ingredient">
							<option value="음식 종류를 선택해 주세요" selected="selected">음식
								종류를 선택해 주세요
							<option value="한식">한식
							<option value="중식">중식
							<option value="양식">양식
					</select></td>
				</tr>
				<tr>
					<td>음식 영양소</td>
					<td><input type="radio" name="nutrient" value=탄수화물>탄수화물
						<input type="radio" name="nutrient" value=단백질>단백질
						<input type="radio" name="nutrient" value=지방>지방
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

	<!--     메인 끝 -->
	<%@include file="template_down.jsp"%>
</body>
</html>