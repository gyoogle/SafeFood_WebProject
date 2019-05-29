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
            alert('��й�ȣ�� ���� ��ġ���� �ʽ��ϴ�');
            return false;
        }
        else{
        	alert('��й�ȣ�� ��ġ�մϴ�');
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
     <!-- ��� -->
	<%@include file="template_up.jsp" %>

	<!-- ȸ������ Ʋ------------------------------------------------------------------------ -->
	<form action="changeSave.safefood" role="form" method="post">
	<section class="container">
		<div class="container" id="join">
			<hr style="border: 1px solid gray">
			<br>
				<div class="container" id="board">
					<h2>ȸ�� ���� ����</h2>
				</div>
				<br>
				<div class="container" id="inputId">
					<h4>���̵�</h4>
					<div class="input-group" style="width: 570px;">
						<input type="text" class="form-control" value=${ member.id } name="id"
							aria-label="���̵� �Է��Ͻÿ�." aria-describedby="basic-addon2" readonly>
						<span class="input-group-addon" id="basic-addon2">@ssafy.com</span>
					</div>
					<p style="color: #ff3333; margin-top: 10px;">�ʼ�����</p>
				</div>
				<br>
				<div class="container" id="inputId">
					<div class="input-group" style="width: 230px;" id="fleft">
						<h4>��й�ȣ</h4>
						<input type="password" class="form-control"  name="password"
							aria-label="�ܡܡܡܡܡܡܡ�" aria-describedby="basic-addon2" id="Pw" required="required">
					</div>
	
					<div class="input-group" style="width: 230px; margin-left: 70px;"
						id="fleft">
						<h4>��й�ȣ Ȯ��</h4>
						<input type="password" class="form-control" aria-label="�ܡܡܡܡܡܡܡ�" aria-describedby="basic-addon2" id="PwCheck" required="required">
					</div>
					<p style="color: #ff3333; margin-top: 90px; clear: both;">�ʼ�����</p>
					<button type="button" class="btn btn-primary" onclick="tocheckpw2()">��й�ȣ Ȯ��</button>
				</div>
				<br>
				<div id="name" class="container">
					<div class="container">
						<div class="container">
							<div class="input-group" style="width: 200px;" id="fleft">
								<h4>�̸�</h4>
								<input type="text" class="form-control" name="name"
									aria-label="�̸��� �Է��Ͻÿ�." aria-describedby="basic-addon2" required="required">
							</div>
							<div class="input-group" style="width: 100px; margin-left: 60px;"
								id="fleft">
								<h4>����</h4>
								<input type="number" class="form-control"
									aria-describedby="basic-addon2">
							</div>
	
							<div style="margin-left: 400px;">
								<h4>����</h4>
								<input type="checkbox" name="userSelect" value="male"
									onClick="javascript:checkOnly(this);"> <span
									style="font-size: 15px;">��</span> <span
									style="margin-left: 20px;"></span> <input type="checkbox"
									name="userSelect" value="female"
									onClick="javascript:checkOnly(this);"> <span
									style="font-size: 15px;">��</span>
							</div>
							<p style="color: #ff3333; margin-top: 30px; clear: both;">�ʼ�����</p>
						</div>
						<br>
						<div class="container">
							<div class="input-group" style="width: 500px;" id="fleft">
								<h4>�̸���</h4>
								<input type="email" class="form-control"
									placeholder="OOO@OOOOO.OOO" aria-label="OOO@OOOOO.OOO"
									aria-describedby="basic-addon2">
							</div>
						</div>
						<br>
						<div class="container">
							<div class="input-group" style="width: 500px;" id="fleft">
								<h4>�ڵ��� ��ȣ</h4>
								<input type="tel" class="form-control"
									placeholder="OOO - OOOO - OOOO" aria-label="OOO - OOOO - OOOO"
									aria-describedby="basic-addon2">
							</div>
						</div>
						<br>
						<div class="container">
							<div class="input-group" style="width: 500px;" id="fleft">
								<h4>�˷��� üũ</h4>
									<input type="checkbox" name="allergy" value="���"> ���
									<span style="margin-left: 20px;"></span>
									<input type="checkbox" name="allergy" value="����"> ����
									<span style="margin-left: 20px;"></span>
									<input type="checkbox" name="allergy" value="����"> ����
									<span style="margin-left: 20px;"></span>
									<input type="checkbox" name="allergy" value="��"> ��
									<span style="margin-left: 20px;"></span>
									<input type="checkbox" name="allergy" value="����"> ����
									<span style="margin-left: 20px;"></span><br>
									
									<input type="checkbox" name="allergy" value="��ġ"> ��ġ
									<span style="margin-left: 20px;"></span>
									<input type="checkbox" name="allergy" value="����"> ����
									<span style="margin-left: 20px;"></span>
									<input type="checkbox" name="allergy" value="��"> ��
									<span style="margin-left: 20px;"></span>
									<input type="checkbox" name="allergy" value="�Ұ��"> �Ұ��
									<span style="margin-left: 20px;"></span>
									<input type="checkbox" name="allergy" value="�߰��"> �߰��
									<span style="margin-left: 20px;"></span><br>
									
									<input type="checkbox" name="allergy" value="�������"> �������
									<span style="margin-left: 20px;"></span>
									<input type="checkbox" name="allergy" value="������"> ������
									<span style="margin-left: 20px;"></span>
									<input type="checkbox" name="allergy" value="�ε鷹"> �ε鷹
									<span style="margin-left: 20px;"></span>
									<input type="checkbox" name="allergy" value="�������"> �������
									<span style="margin-left: 20px;"></span>
							</div>
						</div>
						<button type="submit" class="btn btn-info btn-lg"
							style="margin-top: 30px; margin-left: 480px;">���� �Ϸ�</button>
				</div>
			</div>
			<br>
			<hr style="border: 1px solid gray">
		</div>
	</section>
	</form>
	<br><br>
	<!-- ȸ������ Ʋ------------------------------------------------------------------------ -->

	<!--  footer---------------------------------------------------------------------------- -->
	<!--     ���� �� -->
	<%@include file="template_down.jsp" %>
</body>

</html>