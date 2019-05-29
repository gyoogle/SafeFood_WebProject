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
	var delay = 10; //�ð�����
	var correctAnswers = new Array("a", "b", "a", "a", "d", "c", "a", "a", "c", "b"); //����

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
			//			document.all.result.innerinnerHTML = id + "���� " + (q_num - 1) + "������ " + score + "���� ������ϴ�.";

			// 			document.all.timeLeft.innerHTML = 0;
			// 			document.all.quizScore.innerHTML = id + "���� " + (q_num - 1) + "������ "
			// 					+ score + "���� ������ϴ�.";
			//			document.all.quizScore.style.display = "inline";
			// ����� �ٲ��ֱ�.
		}
	}

	function show_result() {
		document.all.result.style.display = "inline";

		if (score >= 7) {
			document.all.result.innerHTML = "<h5>��� ��� : AD+</h5><br>(" + id
					+ "���� " + (q_num - 1) + "���� �� " + score + "���� ������ϴ�.)";
			tier = 3;
		} else if (score >= 3) {
			document.all.result.innerHTML = "<h5>��� ��� : AD</h5><br>(" + id
					+ "���� " + (q_num - 1) + "���� �� " + score + "���� ������ϴ�.)";
			tier = 2;
		} else {
			document.all.result.innerHTML = "<h5>��� ��� : IM</h5><br>(" + id
					+ "���� " + (q_num - 1) + "���� �� " + score + "���� ������ϴ�.)";
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
			document.all.answerBoard.innerHTML = "<font color=blue><b>�����Դϴ�.</b></font>";
		} else {
			document.all.answerBoard.innerHTML = "<font color=red><b>��! Ʋ�Ƚ��ϴ�.</b></font>";
		}
		clock = 0;
		clearTimeout(timer);
		timer = setTimeout("hide_question()", 700);
	}

	window.onload = show_question;
</script>

</head>
<body>
	<!-- ��� -->
	<%@include file="template_up.jsp"%>
	
	
	<div id="container" style="text-align:center;">
		<div id="time" style="display: inline">
			<h3>���ѽð�</h3>
			<B><span id="timeLeft"></span></B> ��
		</div>
		<br>
		<br>
		<div id="answerBoard"></div>
		<br>
	
		<div id="question1" style="display: none">
			<h4>1. ��ǰ�� ����,����,�����ϴµ� ���Ǵ� �����?</h4><br>
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('a')">a) ��ǰ����</a><br> 
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('b')">b) ��ǰ����</a><br>
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('c')">c) ��ǰ����</a><br>
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('d')">d) ��ǰ</a><br>
		</div>
		
		<div id="question2" style="display: none">
			<h4>2. ����ü�� ��� �������� �����ϴ� ����?</h4><br>
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('a')">a) �������Ʈ</a><br> 
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('b')">b) ������Ʈ</a><br>
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('c')">c) ���ñ���</a><br>
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('d')">d) �ڿܼ�</a><br>
		</div>
	
		<div id="question3" style="display: none">
			<h4>3. �� �Ƿθ� Ǯ���ִ� ������� ���� ����?</h4><br>
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('a')">a) 20�и��� 20��Ʈ ������ ���� 20�ʰ� �Ĵٺ���</a><br> 
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('b')">b) 200�и��� 1��Ʈ ������ ���� 1�ʰ� �Ĵٺ���</a><br>
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('c')">c) 5�и��� ����� ����</a><br>
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('d')">d) 20�и��� 2��Ʈ ������ ���� 2�ʰ� �Ĵٺ���</a><br>
		</div>
	
		<div id="question4" style="display: none">
			<h4>4. ���� �� �߸��� �ǰ������?</h4><br>
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('a')">a) ���� ������ ���� �Ծ�� �Ѵ�</a><br> 
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('b')">b) ź ������ ������</a><br>
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('c')">c) ���� ���� ������</a><br>
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('d')">d) ���� ���� ������</a><br>
		</div>
	
		<div id="question5" style="display: none">
	       <h4>5. ���ϰ� ���� ���� ��� �ɸ� �� �ִ� ���� �ƴѰ���?</h4><br>
	       <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('a')">a) ���ߵ���</a><br>
	       <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('b')">b) ����Ʈ����</a><br>
	       <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('c')">c) ������</a><br>
	       <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('d')">d) ġ��</a><br>
	   </div>
		
		<div id="question6" style="display: none">
	        <h4>6. �˷�����(Allergy)�� ����?</h4><br>
	        <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('a')">a) �ҹ� ����</a><br>
	        <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('b')">b) �ﰢ ����</a><br>
	        <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('c')">c) ���� ����</a><br>
	        <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('d')">d) ����</a><br>
	    </div>
	
		<div id="question7" style="display: none">
	        <h4>7. BMI ��� ����?</h4><br>
	        <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('a')">a) ü�� / ����^2</a><br>
	        <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('b')">b) ���� / ü��^2</a><br>
	        <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('c')">c) ü��^2 / ����</a><br>
	        <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('d')">d) ����^2 / ü��</a><br>
	    </div>
			
		<div id="question8" style="display: none">
			<h4>8. ������ �����ð� �ƴѰ���? (���ʽ� ����)</h4><br>
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('a')">a) ����</a><br> 
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('b')">b) ����</a><br>
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('c')">c) �λ�</a><br>
			<a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('d')">d) ��õ</a><br>
		</div>
		<div id="question9" style="display: none">
		    <h4>9. �����׿����� ���� ��ǰ �� ������������ ���� ���� ����?</h4><br>
		    <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('a')">a) ���� , �ϵ���</a><br>
		    <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('b')">b) ȣ�� , �������</a><br>
		    <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('c')">c) ���� , ������ ��</a><br>
		    <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('d')">d) ���� , ��</a><br>
		</div>
		<div id="question10" style="display: none">
		    <h4>10. ���������̶�?</h4><br>
		    <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('a')">a) ���� ��ǰ������ ������ ��Ÿ���� ��</a><br>
		    <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('b')">b) ���� ��ǰ�� ���� ��ǰ�������� �˷����� ������ ���̴� ��</a><br>
		    <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('c')">c) ���� ��ǰ���� �˷����� ������ ���̴ٰ� �ٸ� ��ǰ���� �Ű� ���� ��</a><br>
		    <a class="btn btn-light" href="javascript:void(0)" onclick="check_answer('d')">d) ��� ��ǰ���� �˷����� ������ ���̴� ��</a><br>
		</div>
		<div id="resultView" style="display: none">
			<h2>�˷����� �����׽�Ʈ ���</h2><br><br>
			<button type="button" class="btn btn-primary" onclick="show_result()">��� Ȯ��</button><br><br>
			<div id="result" style="display: none"></div>
		</div>
	
	</div>
	<!-- <div id="quizScore" style="display: none"></div> -->


	<!--     ���� �� -->
	<%@include file="template_down.jsp"%>
</body>
</html>