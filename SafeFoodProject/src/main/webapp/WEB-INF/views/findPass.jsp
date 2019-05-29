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
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/vue"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script src="https://unpkg.com/vue-router/dist/vue-router.js"></script>

<link href="https://fonts.googleapis.com/css?family=Gothic+A1"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
	
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
        var id = document.getElementById("id").value;
        var name = document.getElementById("name2").value;
 
        console.log(id);
        console.log(name);
//         if (id ) {
//         	alert('��й�ȣ�� Ȯ���Ͽ� �ּ���');
//             return false;
//         }
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
	<div id="app">
		<router-view></router-view>
	</div>
	
	<template id="member">
			<form action="findPassProcess.safefood" role="form" method="post">
				<div class="container" id="join">
					<br>
						<div class="container" id="inputId">
							<h4>���̵�</h4>
							<div class="input-group" style="width: 570px;">
								<input type="text" class="form-control" placeholder="���̵� �Է��Ͻÿ�." name="id" id="id"
									aria-label="���̵� �Է��Ͻÿ�." aria-describedby="basic-addon2" v-model="id">
								<span class="input-group-addon" id="basic-addon2">@ssafy.com</span>
							</div>
							<p style="color: #ff3333; margin-top: 10px;">�ʼ�����</p>
						</div>
						<br>
						<div id="name" class="container">
							<div class="container">
								<div class="container">
									<div class="input-group" style="width: 200px;" id="fleft">
										<h4>�̸�</h4>
										<input type="text" class="form-control" placeholder="�̸��� �Է��Ͻÿ�." name="name" id="name2"
											aria-label="�̸��� �Է��Ͻÿ�." aria-describedby="basic-addon2" v-model="name">
									</div>
								</div>
								<p style="color: #ff3333; margin-top: 10px; margin-left: 20px;">���̵�� �̸��� ��ġ�ϴ� ��� ��й�ȣ�� ���� �����˴ϴ�.</p>
								<br>
								<button type="button" class="btn btn-info btn-lg"
									style="margin-top: 30px; margin-left: 480px;" @click="searchById">���� Ȯ��</button>
							</div>
						
						<br>
						<div class="container" id="inputId2" style="display: none">
							<div class="input-group" style="width: 230px;" id="fleft">
								<h4>���ο� ��й�ȣ</h4>
								<input type="password" class="form-control" placeholder="�ܡܡܡܡܡܡܡ�" name="password"
									aria-label="�ܡܡܡܡܡܡܡ�" aria-describedby="basic-addon2" id="Pw" v-model="password">
							</div>
			
							<div class="input-group" style="width: 230px; margin-left: 70px;"
								id="fleft">
								<h4>���ο� ��й�ȣ Ȯ��</h4>
								<input type="password" class="form-control" placeholder="�ܡܡܡܡܡܡܡ�"
									aria-label="�ܡܡܡܡܡܡܡ�" aria-describedby="basic-addon2" id="PwCheck" v-model="password2">
							</div>
							<p style="color: #ff3333; margin-top: 90px; clear: both;">�ʼ�����</p>
							<!-- <button type="button" @click="pwSame" class="btn btn-info btn-lg"
									style="margin-top: 30px; margin-left: 480px;">��й�ȣ ����</button> -->
							<a href="main.safefood" @click="pwSame" >��й�ȣ ����</a>
						</div>
					</div>
					<br>
				</div>
			</form>
			<br><br>
	</template>
	
	<script type="text/javascript">
		function show() {
			console.log("show ����");
			document.all.inputId2.style.display = "inline";
		}

        <!-- component ���� : ȭ��, data, method .... -->
        var myInfo = Vue.component("info", { // my-info : component �̸�
            template :'#member',

            // data�ӿ��� component�� �Լ� ��������
            data() { 
                return {
                    id : '${id}',
                    name : '',
                    password : '',
                    password2 : '',
                    result : '',    // ajax ��û �Ŀ� ������ ������ ��� �㿡 ���� ����
                }
            },
            mounted(){
            	
            }, 
            methods : {
            	check : function(){
            		console.log("aa : " + this.id);
            		console.log("bb : " + this.name);
            	},
                searchById : function(){
                    axios
                    .get('http://localhost:9081/member/pwcheck/' + this.id + "/" + this.name )        // ��û
                    .then(response=>{
                    	this.result = response.data.result;
                    	console.log(this.result)
                    	if (this.result == 'correct'){
                    		alert("������ ��ġ�մϴ�.")
                    		show()
                    	} else if (this.result == 'incorrect'){
                    		alert("������ ��ġ���� �ʽ��ϴ�.")
                    	}
                    }) // ���� ���� �� ó��
                },
                pwSame : function(){
                	if (this.password == ''){
                		alert("��й�ȣ�� �Է��ϼ���");
                	}
                	else if (this.password2 == ''){
                		alert("��й�ȣ�� Ȯ�����ּ���.");
                	}
                	else if (this.password != this.password2){
						alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
					}                	
					else {
	                    axios
	                    .get('http://localhost:9081/member/pwchange/' + this.id + "/" + this.password2)        // ��û
	                    .then(response=>{
							alert("��� ��ȣ ���� �Ϸ�")
	                    }) // ���� ���� �� ó��
					}
                }
            }
            
        });
        const router = new VueRouter({
			  routes: [
					   { path: '/', component: myInfo} // ��������
		]});
        var vm = new Vue({
        	el : "#app",
        	router
        })
        Vue.config.devtools = true;
	</script>
	
	<!-- ȸ������ Ʋ------------------------------------------------------------------------ -->

	<!--  footer---------------------------------------------------------------------------- -->
	<!--     ���� �� -->
	<%@include file="template_down.jsp" %>
</body>

</html>