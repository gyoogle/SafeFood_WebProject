<%@page import="java.util.ArrayList" %>
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
    <!-- 메인시작 -->
    <section>
    	<div class="container">
    		<div style="text-align: center;"><h1>마이 페이지</h1><br><hr></div>
    		<div style="text-align: center;"><h4 class="text-primary"> 개인정보&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp섭취정보 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp찜한정보</h4></div>
			
			<br>
			<br>
			<h4 class="text-primary"> 찜한정보   </h4>
				 
				 <table class="table table-striped">
				  <thead>
				   <tr>
				     <th></th>
				     <th></th>
				     <th></th>
				   </tr>
				   </thead>
				   
				   <tr>
				     <td>이름</td>
				     <td><%=request.getAttribute("name") %></td>
				     <td></td>

				   </tr>
				   <tr>
				     <td>아이디</td>
				     <td><%=request.getAttribute("id") %></td>
				      <td></td>

				   </tr>
				   <tr>
				     <td>비밀번호</td>
				     <td><%=request.getAttribute("password") %></td>
				      <td></td>
				   </tr>
				   <tr>
				     <td>알러지 정보</td>
				     <% ArrayList<String> x = (ArrayList<String>)request.getAttribute("allergy");
				     	if (x.size() == 0) {%>
				    	<td> 알러지 정보가 없습니다. </td>
				    	<tr> 
				    	<%} else {
				    	for (int i = 0; i < x.size(); i++){	%>
				    	<td> <%= x.get(i) %> </td></tr>
				    	<tr><td></td>
				    	<%}} %>
				 </table>
				 
			<div class="row" >
				<div class="col-md-2 col-md-offset-10">
					  <form action="infoChange.safefood" class="navbar-form navbar-left" role="login" method="get">
                            <input type="hidden" name="id" value="<%=request.getAttribute("id") %>">
                            <button type="submit" class="btn btn-danger" data-toggle="modal"
                                data-target="#myModal-change">개인정보 변경</button>
                        </form>
                   </div>
            </div>
		</div>
    </section>
 <!--     메인 끝 -->
	<%@include file="template_down.jsp" %>
</body>
</html>