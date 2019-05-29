<%@page import="com.mvc.vo.Food"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


<link href="https://fonts.googleapis.com/css?family=Gothic+A1"
	rel="stylesheet">
<% Food f = (Food) request.getAttribute("f"); %>
<!-- chart.js -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

<script type="text/javascript">
	window.onload = function() {

		new Chart(document.getElementById("chart"), {
			type : 'bar',
			data : {
				labels : [ "일일제공량", "칼로리", "탄수화물", "단백질", "지방" ],
				datasets : [ {
					label : "성분",
					backgroundColor : [ '#ff6384', '#36a2eb', '#cc65fe',
							'#ffce56', '#99d8c9'],
					data : [ <%=f.getSupportpereat() %>, <%=f.getCalory() %>, <%=f.getCarbo() %>, <%=f.getProtein() %>, <%=f.getFat() %>]
				} ]
			},
			options : {
				title : {
					display : true,
					text : '<%=f.getName() %>'
				}
			}
		});

	}
</script>


<style type="text/css">
.navbar-brand{
 margin-top: -10px;
 margin-left: -10px;
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
    <!-- 배너 -->
	<%@include file="template_up.jsp" %>
	
	<div style="text-align: center;"><h1>상세 페이지</h1><br><hr></div>

	<div class="container">
		<div class="row">
			<div class="col-sm-3 col-md-5 ">
				<a style="margin-left: 70px; width:100%; height: 100%"> <img src="resources/<%=f.getImg() %>"
					alt="...">
				</a>
			</div>
			<div class="col-sm-3 col-md-7">
				<br>
				<br>
				<br>
				<br>
				<table class="table">
					<tr>
						<td>제품명</td>
						<td><%=f.getName() %></td>
					</tr>
					<tr>
						<td>제조사</td>
						<td><%=f.getMaker() %></td>
					</tr>
					<tr>
						<td>원재료</td>
						<td>
							<p>
								<button class="btn btn-primary" type="button"
									data-toggle="collapse" data-target="#collapseExample"
									aria-expanded="false" aria-controls="collapseExample">
									원재료 보기</button>
							</p>
						</td>
					</tr>
				</table>
				<div class="collapse" id="collapseExample">
					<div class="card card-body">
<%-- 						<%=f.getIngredient() %> --%>
							<p style="color: red">알러지 성분은 빨간색으로 표시됩니다</p>
							<%= request.getAttribute("detail") %>
					</div>
				</div>
			</div>
		</div>


	</div>

	<div class="container">
		<br>
		<div class='col-sm-6 col-md-5'>
		<br>
		<br>
			<canvas id="chart"></canvas>
		</div>
		
		<div class='col-sm-6 col-md-5'>
				<h3> 영양 정보 </h3>
				<br>
				<br>
				<br>
				<table class="table">
					<tr>
						<td>일일제공량</td>
						<td><%=f.getSupportpereat() %></td>
					</tr>
					<tr>
						<td>칼로리</td>
						<td><%=f.getCalory() %></td>
					</tr>
					<tr>
						<td>탄수화물</td>
						<td><%=f.getCarbo() %></td>
					</tr>
					<tr>
						<td>단백질</td>
						<td><%=f.getProtein() %></td>
					</tr>
					<tr>
						<td>지방</td>
						<td><%=f.getFat() %></td>
					</tr>
				</table>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	    
<!--     메인 끝 -->
	<%@include file="template_down.jsp" %>
</body>


</html>