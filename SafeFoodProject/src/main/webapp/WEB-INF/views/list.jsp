<%@page import="java.util.ArrayList"%>
<%@page import="com.mvc.vo.Food"%>
<%@page import="java.util.List"%>
<%@page import="com.mvc.dao.FoodDAO"%>
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
	return confirm("섭취 하시겠습니까?");
}

function savechk(){
	return confirm("찜 하시겠습니까?");
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

.caption {
	height: 200px;
}

div p {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
</style>


</head>
<body>
    	<!-- 배너 -->
	<%@include file="template_up.jsp" %>
	
<%-- 	<% ArrayList<Food> list = (ArrayList<Food>)request.getAttribute("list"); %> --%>
<%-- 	<% FoodDAO mgr = (FoodDAO)request.getAttribute("mgr"); %> --%>
	
	<% String tier = (String)request.getAttribute("tier"); %>
	<% List<Food> onelist = (List<Food>)request.getAttribute("onelist"); %>
	<% List<Food> twolist = new ArrayList<Food>(); %>
	<% List<Food> threelist = new ArrayList<Food>(); %>
	<% if(tier.equals("2") || tier.equals("3")) {%>
	<% twolist = (List<Food>)request.getAttribute("twolist"); %>
	<% } %>
	<% if(tier.equals("3")) {%>
	<% threelist = (List<Food>)request.getAttribute("threelist");%>
	<% }%>
	<% List<Food> best = (List<Food>)request.getAttribute("best"); %>
	<% int idx = 1; %>
	
	<section>
		<div style="text-align: center;"><h1>상품 정보</h1><br><hr></div><br>
		<div class="container">
			<div style="text-align: left;"><h3>베스트 섭취 Top3</h3><br>사용자들이 가장 많이 섭취하는 음식<hr></div><br><br>
			<%for (Food f1 : best) {%>
			<div class="col-sm-6 col-md-3" style="display: inline-block;">
				<div class="thumbnail" style="height: 300px;">
						<br>
						<%if(idx == 1) {%>
						<img src="resources/img/gold.PNG" height="30" width="20">
						<%} else if(idx == 2) {%>
						<img src="resources/img/silver.PNG" height="30" width="20">
						<%} else if(idx == 3) {%>
						<img src="resources/img/bronze.PNG" height="30" width="20">
						<%} idx++;%>
						<br>
						<img src="resources/<%=f1.getImg() %>" alt="..." width="100" height="100">
						<br>
						<div class="caption">
							<h4><a href="read.safefood?f_id=<%=f1.getId()%>"><%= f1.getName() %></a></h4>
							<p>
								<a href="eat.safefood?id=${id }&fnum=<%=f1.getId()%>" class="btn btn-primary" role="button" onclick="return eatchk();">▲ 섭취</a> 
								<a href="save.safefood?id=${id }&fnum=<%=f1.getId()%>" class="btn btn-default" role="button" onclick="return savechk();">▲ 찜</a>
							</p>
						</div>
					</div>
			</div>
			<%} %>
			<br>
		</div>
		<br>
		<div class="container">
			<div style="text-align: left;"><h3>전체 리스트</h3><hr></div>
			<hr>
			<%for (Food f : onelist) {%>
			<div class="col-sm-6 col-md-3">
					<div class="thumbnail" style="height: 450px;">
					<h4 style="color:dark;">Normal</h4>
						<br>
						<img src="resources/<%=f.getImg() %>" alt="...">
						<div class="caption">
							<h4><a href="read.safefood?f_id=<%=f.getId()%>"><%= f.getName() %></a></h4>
							<p>
								<a href="eat.safefood?id=${id }&fnum=<%=f.getId()%>" class="btn btn-primary" role="button" onclick="return eatchk();">▲ 섭취</a> 
								<a href="save.safefood?id=${id }&fnum=<%=f.getId()%>" class="btn btn-default" role="button" onclick="return savechk();">▲ 찜</a>
							</p>
						</div>
					</div>
				</div>
			<%} %>
			
			<br>
			<br>
			<%if (tier.equals("2") || tier.equals("3")) {%>
				<%for (Food f : twolist) {%>
			<div class="col-sm-6 col-md-3">
					<div class="thumbnail" style="height: 450px;">
					<h4 style="color:silver;">VIP</h4>
						<br>
						<img src="resources/<%=f.getImg() %>" alt="...">
						<div class="caption">
							<h4><a href="read.safefood?f_id=<%=f.getId()%>"><%= f.getName() %></a></h4>
							<p>
								<a href="eat.safefood?id=${id }&fnum=<%=f.getId()%>" class="btn btn-primary" role="button" onclick="return eatchk();">▲ 섭취</a> 
								<a href="save.safefood?id=${id }&fnum=<%=f.getId()%>" class="btn btn-default" role="button" onclick="return savechk();">▲ 찜</a>
							</p>
						</div>
					</div>
			</div>
				<%} %>
			<%}%>
			<br>
			<br>
			<%if (tier.equals("3")) {%>
			<%for (Food f : threelist) {%>
			<div class="col-sm-6 col-md-3">
					<div class="thumbnail" style="height: 450px;">
					<h4 style="color:gold;">VVIP</h4>
						<br>
						<img src="resources/<%=f.getImg() %>" alt="...">
						<div class="caption">
							<h4><a href="read.safefood?f_id=<%=f.getId()%>"><%= f.getName() %></a></h4>
							<p>
								<a href="eat.safefood?id=${id }&fnum=<%=f.getId()%>" class="btn btn-primary" role="button" onclick="return eatchk();">▲ 섭취</a> 
								<a href="save.safefood?id=${id }&fnum=<%=f.getId()%>" class="btn btn-default" role="button" onclick="return savechk();">▲ 찜</a>
							</p>
						</div>
					</div>
			</div>
				<%} %>
			<%} else {%>
			<div class="col-sm-6 col-md-10">
				<p style="color:blue;">등급 제한으로 보이지 않는 식품이 존재합니다.</p>
			</div>
			<%} %>
		</div>
	</section>
	
	<!--  상품 정보 ----------------------------------------------------------------------------------------------------------- -->

<!--     메인 끝 -->
	<%@include file="template_down.jsp" %>
</body>
</html>