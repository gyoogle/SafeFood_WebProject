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

<script>
	function checkOnly(chk) {

		var obj = document.getElementsByName("userSelect");

		for (var i = 0; i < obj.length; i++) {
			if (obj[i] != chk) {
				obj[i].checked = false;
			}
		}
	}
	function tocheckpw2() {
        var pw = document.getElementById("Pw").value;
        var pwck = document.getElementById("PwCheck").value;
 
        if (pw != pwck) {
            alert('비밀번호가 서로 일치하지 않습니다');
            return false;
        }
        else{
        	alert('비밀번호가 일치합니다');
        }
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

section {
	margin-top: 40px;
	margin-bottom: 40px;
}

#join {
	width: 700px;
}

#inputId {
	position: relative;
	margin-left: 30px;
	margin-right: 30px;
	margin-left: 30px;
	width: 100%;
}

#fleft {
	float: left;
}

#fright {
	float: right;
}

#name {
	position: relative;
}
</style>


</head>
<body>
     <!-- 배너 -->
	<%@include file="template_up.jsp" %>

	<!-- 회원가입 틀------------------------------------------------------------------------ -->
	<form action="changeSave.safefood" role="form" method="post">
	<section class="container">
		<div class="container" id="join">
			<hr style="border: 1px solid gray">
			<br>
				<div class="container" id="board">
					<h2>회원 정보 변경</h2>
				</div>
				<br>
				<div class="container" id="inputId">
					<h4>아이디</h4>
					<div class="input-group" style="width: 570px;">
						<input type="text" class="form-control" value=${ member.id } name="id"
							aria-label="아이디를 입력하시오." aria-describedby="basic-addon2" readonly>
						<span class="input-group-addon" id="basic-addon2">@ssafy.com</span>
					</div>
					<p style="color: #ff3333; margin-top: 10px;">필수정보</p>
				</div>
				<br>
				<div class="container" id="inputId">
					<div class="input-group" style="width: 230px;" id="fleft">
						<h4>비밀번호</h4>
						<input type="password" class="form-control"  name="password"
							aria-label="●●●●●●●●" aria-describedby="basic-addon2" id="Pw" required="required">
					</div>
	
					<div class="input-group" style="width: 230px; margin-left: 70px;"
						id="fleft">
						<h4>비밀번호 확인</h4>
						<input type="password" class="form-control" aria-label="●●●●●●●●" aria-describedby="basic-addon2" id="PwCheck" required="required">
					</div>
					<p style="color: #ff3333; margin-top: 90px; clear: both;">필수정보</p>
					<button type="button" class="btn btn-primary" onclick="tocheckpw2()">비밀번호 확인</button>
				</div>
				<br>
				<div id="name" class="container">
					<div class="container">
						<div class="container">
							<div class="input-group" style="width: 200px;" id="fleft">
								<h4>이름</h4>
								<input type="text" class="form-control" name="name"
									aria-label="이름을 입력하시오." aria-describedby="basic-addon2" required="required">
							</div>
							<div class="input-group" style="width: 100px; margin-left: 60px;"
								id="fleft">
								<h4>나이</h4>
								<input type="number" class="form-control"
									aria-describedby="basic-addon2">
							</div>
	
							<div style="margin-left: 400px;">
								<h4>성별</h4>
								<input type="checkbox" name="userSelect" value="male"
									onClick="javascript:checkOnly(this);"> <span
									style="font-size: 15px;">남</span> <span
									style="margin-left: 20px;"></span> <input type="checkbox"
									name="userSelect" value="female"
									onClick="javascript:checkOnly(this);"> <span
									style="font-size: 15px;">여</span>
							</div>
							<p style="color: #ff3333; margin-top: 30px; clear: both;">필수정보</p>
						</div>
						<br>
						<div class="container">
							<div class="input-group" style="width: 500px;" id="fleft">
								<h4>이메일</h4>
								<input type="email" class="form-control"
									placeholder="OOO@OOOOO.OOO" aria-label="OOO@OOOOO.OOO"
									aria-describedby="basic-addon2">
							</div>
						</div>
						<br>
						<div class="container">
							<div class="input-group" style="width: 500px;" id="fleft">
								<h4>핸드폰 번호</h4>
								<input type="tel" class="form-control"
									placeholder="OOO - OOOO - OOOO" aria-label="OOO - OOOO - OOOO"
									aria-describedby="basic-addon2">
							</div>
						</div>
						<br>
						<div class="container">
							<div class="input-group" style="width: 500px;" id="fleft">
								<h4>알러지 체크</h4>
									<input type="checkbox" name="allergy" value="대두"> 대두
									<span style="margin-left: 20px;"></span>
									<input type="checkbox" name="allergy" value="땅콩"> 땅콩
									<span style="margin-left: 20px;"></span>
									<input type="checkbox" name="allergy" value="우유"> 우유
									<span style="margin-left: 20px;"></span>
									<input type="checkbox" name="allergy" value="게"> 게
									<span style="margin-left: 20px;"></span>
									<input type="checkbox" name="allergy" value="새우"> 새우
									<span style="margin-left: 20px;"></span><br>
									
									<input type="checkbox" name="allergy" value="참치"> 참치
									<span style="margin-left: 20px;"></span>
									<input type="checkbox" name="allergy" value="연어"> 연어
									<span style="margin-left: 20px;"></span>
									<input type="checkbox" name="allergy" value="쑥"> 쑥
									<span style="margin-left: 20px;"></span>
									<input type="checkbox" name="allergy" value="소고기"> 소고기
									<span style="margin-left: 20px;"></span>
									<input type="checkbox" name="allergy" value="닭고기"> 닭고기
									<span style="margin-left: 20px;"></span><br>
									
									<input type="checkbox" name="allergy" value="돼지고기"> 돼지고기
									<span style="margin-left: 20px;"></span>
									<input type="checkbox" name="allergy" value="복숭아"> 복숭아
									<span style="margin-left: 20px;"></span>
									<input type="checkbox" name="allergy" value="민들레"> 민들레
									<span style="margin-left: 20px;"></span>
									<input type="checkbox" name="allergy" value="계란흰자"> 계란흰자
									<span style="margin-left: 20px;"></span>
							</div>
						</div>
						<button type="submit" class="btn btn-info btn-lg"
							style="margin-top: 30px; margin-left: 480px;">변경 완료</button>
				</div>
			</div>
			<br>
			<hr style="border: 1px solid gray">
		</div>
	</section>
	</form>
	<br><br>
	<!-- 회원가입 틀------------------------------------------------------------------------ -->

	<!--  footer---------------------------------------------------------------------------- -->
	<!--     메인 끝 -->
	<%@include file="template_down.jsp" %>
</body>

</html>