<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<style type="text/css">

input[type=button] {
  -webkit-transition-duration: 0.4s; /* Safari */
  transition-duration: 0.4s;
}

input[type=button]:hover {
  background-color: blue; /* Green */
  color: white;
}

h4 {
	font-weight: bold;
}

</style>
<script language="javascript">
	var delay = 10; //시간설정
	var correctAnswers = new Array("a", "b", "a", "a", "d", "c", "a", "a", "c", "b"); //정답

	var q_num = 1;
	var timer;
	var layer;
	var clock = delay;
	var score = 0;
	var tier = 0;
	
	var id = "<%=(String) session.getAttribute("id")%>";

	function show_question() {
		if (layer = eval("document.all.question" + q_num)) {
			layer.style.display = "inline";
			document.all.timeLeft.innerHTML = clock;
			hide_question();
		}

		else {
			document.all.time.style.display = "none";
			document.all.resultView.style.display = "inline";
			//			document.all.result.innerinnerHTML = id + "님은 " + (q_num - 1) + "문제중 " + score + "개를 맞췄습니다.";

			// 			document.all.timeLeft.innerHTML = 0;
			// 			document.all.quizScore.innerHTML = id + "님은 " + (q_num - 1) + "문제중 "
			// 					+ score + "개를 맞췄습니다.";
			//			document.all.quizScore.style.display = "inline";
			// 멤버십 바꿔주기.
		}
	}

	function show_result() {
		document.all.result.style.display = "inline";

		if (score >= 7) {
			document.all.result.innerHTML = "<h5>취득 등급 : AD+</h5><br>(" + id
					+ "님은 " + (q_num - 1) + "문제 중 " + score + "개를 맞췄습니다.)";
			tier = 3;
		} else if (score >= 3) {
			document.all.result.innerHTML = "<h5>취득 등급 : AD</h5><br>(" + id
					+ "님은 " + (q_num - 1) + "문제 중 " + score + "개를 맞췄습니다.)";
			tier = 2;
		} else {
			document.all.result.innerHTML = "<h5>취득 등급 : IM</h5><br>(" + id
					+ "님은 " + (q_num - 1) + "문제 중 " + score + "개를 맞췄습니다.)";
			tier = 1;
		}
		update_tier(tier);
	}

	function update_tier(tier) {
		console.log(tier);
		axios
		.get('http://localhost:9081/member/tierchange/'+ this.id + "/" + tier)
		.then(response=>{
		})
	}

	function hide_question() {
		if (clock > 0) {
			document.all.timeLeft.innerHTML = clock;
			clock--;
			if(clock >= 5) {
				document.all.timeLeft.style.color = "black";
			}
			else {
				document.all.timeLeft.style.color = "red";
			}
			timer = setTimeout("hide_question()", 1000);
		} else {
			clearTimeout(timer);
			document.all.answerBoard.innerHTML = " ";
			clock = delay;
			layer.style.display = "none";
			q_num++;
			show_question();
		}
	}

	function check_answer(answer) {
		if (correctAnswers[q_num - 1] == answer) {
			score++;
			document.all.answerBoard.innerHTML = "<font color=blue><b>정답입니다.</b></font>";
		} else {
			document.all.answerBoard.innerHTML = "<font color=red><b>땡! 틀렸습니다.</b></font>";
		}
		clock = 0;
		clearTimeout(timer);
		timer = setTimeout("hide_question()", 700);
	}

	window.onload = show_question;
</script>

</head>
<body>
	<!-- 배너 -->
	<%@include file="template_up.jsp"%>
	
	
	<div id="container" style="text-align:center;">
		<div id="time" style="display: inline">
			<h3>제한시간</h3>
			<B><span id="timeLeft"></span></B> 초
		</div>
		<br>
		<br>
		<div id="answerBoard"></div>
		<br>
	
		<div id="question1" style="display: none">
			<h4>1. 식품을 제조,가공,조리하는데 사용되는 원료란?</h4><br>
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('a')">a) 식품원료</a><br> 
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('b')">b) 식품원로</a><br>
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('c')">c) 상품원료</a><br>
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('d')">d) 식품</a><br>
		</div>
		
		<div id="question2" style="display: none">
			<h4>2. 수정체를 통과 망막까지 도달하는 것은?</h4><br>
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('a')">a) 레드라이트</a><br> 
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('b')">b) 블루라이트</a><br>
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('c')">c) 가시광선</a><br>
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('d')">d) 자외선</a><br>
		</div>
	
		<div id="question3" style="display: none">
			<h4>3. 눈 피로를 풀어주는 방법으로 옳은 것은?</h4><br>
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('a')">a) 20분마다 20피트 떨어진 곳을 20초간 쳐다보기</a><br> 
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('b')">b) 200분마다 1피트 떨어진 곳을 1초간 쳐다보기</a><br>
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('c')">c) 5분마다 모니터 보기</a><br>
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('d')">d) 20분마다 2피트 떨어진 곳을 2초간 쳐다보기</a><br>
		</div>
	
		<div id="question4" style="display: none">
			<h4>4. 다음 중 잘못된 건강상식은?</h4><br>
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('a')">a) 물은 무조건 많이 먹어야 한다</a><br> 
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('b')">b) 탄 음식은 안좋다</a><br>
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('c')">c) 담배는 몸에 안좋다</a><br>
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('d')">d) 술은 몸에 안좋다</a><br>
		</div>
	
		<div id="question5" style="display: none">
	       <h4>5. 과하게 물을 마실 경우 걸릴 수 있는 병이 아닌것은?</h4><br>
	       <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('a')">a) 물중독증</a><br>
	       <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('b')">b) 저나트륨증</a><br>
	       <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('c')">c) 뇌부종</a><br>
	       <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('d')">d) 치매</a><br>
	   </div>
		
		<div id="question6" style="display: none">
	        <h4>6. 알레르기(Allergy)의 뜻은?</h4><br>
	        <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('a')">a) 소민 반응</a><br>
	        <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('b')">b) 즉각 반응</a><br>
	        <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('c')">c) 과민 반응</a><br>
	        <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('d')">d) 반응</a><br>
	    </div>
	
		<div id="question7" style="display: none">
	        <h4>7. BMI 계산 법은?</h4><br>
	        <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('a')">a) 체중 / 신장^2</a><br>
	        <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('b')">b) 신장 / 체중^2</a><br>
	        <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('c')">c) 체중^2 / 신장</a><br>
	        <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('d')">d) 신장^2 / 체중</a><br>
	    </div>
			
		<div id="question8" style="display: none">
			<h4>8. 다음중 광역시가 아닌곳은? (보너스 문제)</h4><br>
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('a')">a) 충주</a><br> 
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('b')">b) 광주</a><br>
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('c')">c) 부산</a><br>
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('d')">d) 인천</a><br>
		</div>
		<div id="question9" style="display: none">
		    <h4>9. 교차항원성을 가진 식품 중 교차반응률이 가장 높은 것은?</h4><br>
		    <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('a')">a) 땅콩 , 완두콩</a><br>
		    <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('b')">b) 호두 , 헤이즐넛</a><br>
		    <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('c')">c) 우유 , 염소의 젖</a><br>
		    <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('d')">d) 새우 , 게</a><br>
		</div>
		<div id="question10" style="display: none">
		    <h4>10. 교차반응이란?</h4><br>
		    <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('a')">a) 원인 식품에서만 증상이 나타나는 것</a><br>
		    <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('b')">b) 원인 식품과 같은 식품군에서도 알레르기 반응을 보이는 것</a><br>
		    <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('c')">c) 원인 식품에서 알레르기 반응을 보이다가 다른 식품으로 옮겨 가는 것</a><br>
		    <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('d')">d) 모든 식품에서 알레르기 반응을 보이는 것</a><br>
		</div>
		<div id="resultView" style="display: none">
			<h2>알레르기 역량테스트 결과</h2><br><br>
			<button type="button" class="btn btn-primary" onclick="show_result()">결과 확인</button><br><br>
			<div id="result" style="display: none"></div>
		</div>
	
	</div>
	<!-- <div id="quizScore" style="display: none"></div> -->


	<!--     메인 끝 -->
	<%@include file="template_down.jsp"%>
</body>
</html>