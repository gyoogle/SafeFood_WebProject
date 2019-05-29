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
//         	alert('비밀번호를 확인하여 주세요');
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
     <!-- 배너 -->
	<%@include file="template_up.jsp" %>

	<!-- 회원가입 틀------------------------------------------------------------------------ -->
	<div id="app">
		<router-view></router-view>
	</div>
	
	<template id="member">
			<form action="findPassProcess.safefood" role="form" method="post">
				<div class="container" id="join">
					<br>
						<div class="container" id="inputId">
							<h4>아이디</h4>
							<div class="input-group" style="width: 570px;">
								<input type="text" class="form-control" placeholder="아이디를 입력하시오." name="id" id="id"
									aria-label="아이디를 입력하시오." aria-describedby="basic-addon2" v-model="id">
								<span class="input-group-addon" id="basic-addon2">@ssafy.com</span>
							</div>
							<p style="color: #ff3333; margin-top: 10px;">필수정보</p>
						</div>
						<br>
						<div id="name" class="container">
							<div class="container">
								<div class="container">
									<div class="input-group" style="width: 200px;" id="fleft">
										<h4>이름</h4>
										<input type="text" class="form-control" placeholder="이름을 입력하시오." name="name" id="name2"
											aria-label="이름을 입력하시오." aria-describedby="basic-addon2" v-model="name">
									</div>
								</div>
								<p style="color: #ff3333; margin-top: 10px; margin-left: 20px;">아이디와 이름이 일치하는 경우 비밀번호가 새로 생성됩니다.</p>
								<br>
								<button type="button" class="btn btn-info btn-lg"
									style="margin-top: 30px; margin-left: 480px;" @click="searchById">정보 확인</button>
							</div>
						
						<br>
						<div class="container" id="inputId2" style="display: none">
							<div class="input-group" style="width: 230px;" id="fleft">
								<h4>새로운 비밀번호</h4>
								<input type="password" class="form-control" placeholder="●●●●●●●●" name="password"
									aria-label="●●●●●●●●" aria-describedby="basic-addon2" id="Pw" v-model="password">
							</div>
			
							<div class="input-group" style="width: 230px; margin-left: 70px;"
								id="fleft">
								<h4>새로운 비밀번호 확인</h4>
								<input type="password" class="form-control" placeholder="●●●●●●●●"
									aria-label="●●●●●●●●" aria-describedby="basic-addon2" id="PwCheck" v-model="password2">
							</div>
							<p style="color: #ff3333; margin-top: 90px; clear: both;">필수정보</p>
							<!-- <button type="button" @click="pwSame" class="btn btn-info btn-lg"
									style="margin-top: 30px; margin-left: 480px;">비밀번호 변경</button> -->
							<a href="main.safefood" @click="pwSame" >비밀번호 변경</a>
						</div>
					</div>
					<br>
				</div>
			</form>
			<br><br>
	</template>
	
	<script type="text/javascript">
		function show() {
			console.log("show 실행");
			document.all.inputId2.style.display = "inline";
		}

        <!-- component 정의 : 화면, data, method .... -->
        var myInfo = Vue.component("info", { // my-info : component 이름
            template :'#member',

            // data임에도 component는 함수 형식으로
            data() { 
                return {
                    id : '${id}',
                    name : '',
                    password : '',
                    password2 : '',
                    result : '',    // ajax 요청 후에 서버가 보내준 결과 담에 놓을 변수
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
                    .get('http://localhost:9081/member/pwcheck/' + this.id + "/" + this.name )        // 요청
                    .then(response=>{
                    	this.result = response.data.result;
                    	console.log(this.result)
                    	if (this.result == 'correct'){
                    		alert("정보가 일치합니다.")
                    		show()
                    	} else if (this.result == 'incorrect'){
                    		alert("정보가 일치하지 않습니다.")
                    	}
                    }) // 응답 도착 후 처리
                },
                pwSame : function(){
                	if (this.password == ''){
                		alert("비밀번호를 입력하세요");
                	}
                	else if (this.password2 == ''){
                		alert("비밀번호를 확인해주세요.");
                	}
                	else if (this.password != this.password2){
						alert("비밀번호가 일치하지 않습니다.");
					}                	
					else {
	                    axios
	                    .get('http://localhost:9081/member/pwchange/' + this.id + "/" + this.password2)        // 요청
	                    .then(response=>{
							alert("비밀 번호 변경 완료")
	                    }) // 응답 도착 후 처리
					}
                }
            }
            
        });
        const router = new VueRouter({
			  routes: [
					   { path: '/', component: myInfo} // 개인정보
		]});
        var vm = new Vue({
        	el : "#app",
        	router
        })
        Vue.config.devtools = true;
	</script>
	
	<!-- 회원가입 틀------------------------------------------------------------------------ -->

	<!--  footer---------------------------------------------------------------------------- -->
	<!--     메인 끝 -->
	<%@include file="template_down.jsp" %>
</body>

</html>