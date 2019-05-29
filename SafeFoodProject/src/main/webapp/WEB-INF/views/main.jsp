<%@page import="com.mvc.vo.Food"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>SaffyFood</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<script type="text/javascript">


function eatchk(){
	return confirm("섭취 하시겠습니까?");
}

function savechk(){
	return confirm("찜 하시겠습니까?");
}

function warning() {
	alert("로그인이 필요한 서비스입니다.");
}
</script>
</head>

<body>
	
	<!-- 배너 -->
	<%@include file="template_up.jsp" %>
	<!-- 메인시작 -->
	<%
		Food f1 = (Food) request.getAttribute("f1");
	%>
	<%
		Food f2 = (Food) request.getAttribute("f2");
	%>
	<section>
		<div class="container">
			<div id="down" class="row">
				<div class="col-sm-12 col-md-5">
				<iframe width="450" height="300" src="https://www.youtube.com/embed/buikfbebF0s?start=78?&amp;autoplay=1&amp;loop=1">
				</iframe>
					<h4 class="container">
						<span class="badge badge-pill badge-success">New</span> Food Allergy가 무엇인가요?
					</h4>
				</div>
				<div class="col-sm-6 col-md-3 col-md-offset-1">
					<div class="thumbnail">
						<span class="badge badge-info">Hot</span> <img
							src="resources/<%=f1.getImg() %>" alt="...">
						<div class="caption">
							<c:if test="${empty id }">
							<h4>
								<a href="#" onclick="warning();"><%=f1.getName() %></a>
							</h4>
								<p>
									<a href="#" class="btn btn-primary" role="button" onclick="warning();">▲ 섭취</a> <a
										href="#" class="btn btn-default" role="button" onclick="warning();">▲ 찜</a>
								</p>
							</c:if>
							<c:if test="${!empty id }">
							<h4>
								<a href="read.safefood?f_id=<%=f1.getId() %>"><%=f1.getName() %></a>
							</h4>
								<p>
									<a href="eat.safefood?id=${id }&fnum=<%=f1.getId()%>" class="btn btn-primary" role="button" onclick="return eatchk();">▲ 섭취</a> <a
										href="save.safefood?id=${id }&fnum=<%=f1.getId()%>" class="btn btn-default" role="button" onclick="return savechk();">▲ 찜</a>
								</p>
							</c:if>
						</div>
					</div>
				</div>

				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<span class="badge badge-success">New</span> <img
							src="resources/<%=f2.getImg() %>" alt="...">
						<div class="caption">
							<c:if test="${empty id }">
							<h4>
								<a href="#" onclick="warning();"><%=f2.getName() %></a>
							</h4>
							<p>
								<a href="#" class="btn btn-primary" role="button" onclick="warning();">▲ 섭취</a> <a
									href="#" class="btn btn-default" role="button" onclick="warning();">▲ 찜</a>
							</p>
							
							</c:if>
							<c:if test="${!empty id }">
							<h4>
								<a href="read.safefood?f_id=<%=f2.getId() %>"><%=f2.getName() %></a>
							</h4>
							<p>
								<a href="eat.safefood?id=${id }&fnum=<%=f2.getId()%>" class="btn btn-primary" role="button" onclick="return eatchk();">▲ 섭취</a> <a
									href="save.safefood?id=${id }&fnum=<%=f2.getId()%>" class="btn btn-default" role="button" onclick="return savechk();">▲ 찜</a>
							</p>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<div id="down" class="row">
				<div class="col-sm-3 col-md-6 col-md-offset-6">
					<c:if test="${empty id }">
					<a href="#" class="btn btn-info btn-lg btn-block"
						role="button" onclick="warning();">더 많은 상품 보러가기</a>
					</c:if>
					<c:if test="${!empty id }">
					<a href="list.safefood" class="btn btn-info btn-lg btn-block"
						role="button">더 많은 상품 보러가기</a>
					</c:if>
				</div>
			</div>
		</div>
	</section>
    
<!--     메인 끝 -->
	<%@include file="template_down.jsp" %>
</body>
</html>