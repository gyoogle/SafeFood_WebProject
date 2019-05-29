<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
	
	<div id="app">
		<div class='search_box' style="text-align: center; font-size: 25px">
			<router-link to="/">개인정보</router-link> &nbsp&nbsp&nbsp
			<router-link to="/route2">섭취정보</router-link> &nbsp&nbsp&nbsp
			<router-link to="/route3">찜한정보</router-link>
		</div>
		<router-view></router-view>
	</div>
	
	<template id="info-template">
	
		<div class="container">
			
			<br>
			<h4 class="text-primary"> 개인정보   </h4>
				 
				 <table class="table table-striped">
				  <thead>
				   <tr>
				     <th></th>
				     <th></th>
				   </tr>
				   </thead>
				   
				   <tr>
				     <th>이름</th>
				     <td v-text="name"></td>
				   </tr>
				   <tr>
				     <th>아이디</th>
				     <td v-text="id"></td>
				   </tr>
				   <tr>
				     <th>비밀번호</th>
				     <td v-text="password"></td>
				   </tr>
				   <tr>
				     <th>등급</th>
				     <td v-if="tier === '1'">
				     	IM
				     </td>
				     <td v-else-if="tier === '2'">
				     	AD
				     </td>
				     <td v-else="tier === '3'">
				     	AD+
				     </td>
				   </tr>
				   <tr>
				   	 <th>알레르기</th>
				   	 <td> </td>
				   </tr>
				   <tr v-for="al in allergy">
				     <!-- <th>알레르기</th> -->
				     <td></td>
				     <td v-text="al"></td>
				   </tr>
				 </table>
				 
			<div class="row" >
				<div class="col-md-2 col-md-offset-10">
					  <form action="infoChange.safefood" class="navbar-form navbar-left" role="login" method="get">
                            <input type="hidden" name="id" value="${id }">
                            <button type="submit" class="btn btn-danger" data-toggle="modal"
                                data-target="#myModal-change">개인정보 변경</button>
                        </form>
                   </div>
            </div>
		</div>
		
	</template>
	
	<template id="eat-template">
	
		<div class="container">
			
			<br>
			<h4 class="text-primary"> 섭취정보   </h4>
				 
				 <table class="table table-striped">
				  <thead>
				   <tr>
				     <th>상품번호</th>
				     <th>이미지</th>
				     <th>상품명</th>
				     <th>제조사</th>
				     <th>칼로리</th>
				     <th></th>
				   </tr>
				   </thead>
				   
				   <tr v-for="f in food" v-bind:id="f.id">
<!-- 				     <td v-text="f.id"></td> -->
				     <td v-html="f.id"></td>
				     <td><img :src="resources+f.img" width="50" height="50"></td>
				     <td v-text="f.name"></td>
				     <td v-text="f.maker"></td>
				     <td v-text="f.calory"></td>
				     <td>
				     	<div>
				     		<button class="btn btn-default" @click="deleteFood(f.id)">삭제</button>
				     	</div>
				     </td>
				   </tr>
				 </table>
				 <p style="font-weight: bold;">※알레르기가 포함된 식품은 빨간색으로 표시됩니다.</p>
				 
			<div class='col-sm-6 col-md-5'>
				<br><h3> ${id } 님 알레르기 검사 </h3>
				<canvas id="chart2" style="margin-top : 10px;"></canvas>
			</div>
			
			<div class='col-sm-6 col-md-7'>
					<br>
						<h3> 알레르기 정보 </h3>
						<br>
						<table class="table">
							<th>알레르기 성분</th>
							<th>담긴 횟수</th>
							
							<tr v-for="allergy in allergys">
								<td v-text="allergy.al"></td>
								<td v-text="allergy.cnt"></td>
							</tr>
						</table>
				</div>
		</div>
		
		
	</template>
	
	<template id="save-template">
	
		<div class="container">
			
			<br>
			<h4 class="text-primary"> 찜한정보   </h4>
				 
				 <table class="table table-striped">
				  <thead>
				   <tr>
				     <th>상품번호</th>
				     <th>이미지</th>
				     <th>상품명</th>
				     <th>제조사</th>
				     <th>칼로리</th>
				     <th></th>
				   </tr>
				   </thead>
				   
				   <tr v-for="f in food">
				     <td v-text="f.id"></td>
				     <td><img :src="resources+f.img" width="50" height="50"></td>
				     <td v-text="f.name"></td>
				     <td v-text="f.maker"></td>
				     <td v-text="f.calory"></td>
				     <td>
				     	<div>
				     		<button class="btn btn-default" @click="deleteFood(f.id)">삭제</button>
				     	</div>
				     </td>
				   </tr>
				 </table>
				 
				 <div class='col-sm-6 col-md-5' style="margin-top:20px;">
				 	<h3> ${id } 님의 부족한 영양 성분 </h3><br>
<!-- 					<canvas id="chart" style="margin-top: 50px;"></canvas> -->
					<canvas id="chart"></canvas>
					<br>
					칼로리 : <span v-text="scarce"></span> 가 필요합니다.
				</div>
			
				<div class='col-sm-6 col-md-7'>
					<br>
						<h3> 영양 정보 </h3>
						<br><br><br>
						<table class="table">
							<th style="text-align:center;">영양 성분</th>
							<th style="text-align:center;">현재 섭취량 (kcal / g)</th>
							<th style="text-align:center;">권장 섭취량 (여성 19 ~ 29세)</th>
							<th style="text-align:center;">권장 섭취량 (남성 19 ~ 29세)</th>
							<tr v-for="nutri in nutrients">
								<td v-text="nutri.name"></td>
								<td v-text="nutri.amount" style="text-align:right;"></td>
								<td style="text-align:right;" v-text="nutri.womanKcal"></td>
								<td style="text-align:right;" v-text="nutri.manKcal"></td>
							</tr>
						</table>
				</div>
		</div>
	</template>
	
	
	
	<script type="text/javascript">
        <!-- component 정의 : 화면, data, method .... -->
        var myInfo = Vue.component("my-info", { // my-info : component 이름
            template :'#info-template',

            // data임에도 component는 함수 형식으로
            data() { 
                return {
                    result : [],    // ajax 요청 후에 서버가 보내준 결과 담에 놓을 변수
                    name : '',
                    id : '${id}',
                    password : '',
                    allergy : '',
                    tier : '',
                }
            },
            mounted(){
            	console.log(this.id);
               	this.searchById(this.id);
            }, 
            methods : {
                searchById : function(id){
                    axios
                    .get('http://localhost:9081/member/'+ this.id)        // 요청
                    .then(response=>{
                    	this.name=response.data.name
                    	this.password=response.data.password
                    	this.allergy=response.data.allergy
                    	this.tier=response.data.tier
                    }) // 응답 도착 후 처리
                }
            }
            
        });

        
        
        var saveInfo = Vue.component("save-info", { // my-info : component 이름
            template :'#save-template',

            // data임에도 component는 함수 형식으로
            data() { 
                return {
                	la : [],
                	da : [],
                	result : [],    // ajax 요청 후에 서버가 보내준 결과 담에 놓을 변수
                    food : [],
                    id : '${id}',
                    fcode : '',
                    mcode : '',
                    resources : "resources/",
                    nutrients : [],
                    scarce : ''
                }
            },
            mounted(){
            	this.selectFood();
            	this.nutri();
//             	this.drawing();
            },
            watch : {
				da : function() {
					console.log("2");
					this.drawing()
				}
			},
            methods : {
            	selectFood : function(){
                    axios
                    .get('http://localhost:9081/save/'+ this.id)        // 요청
                    .then(response=>{
                    	this.fcode ='';
                    	console.log(response)
                    	this.food=response.data
                    	console.log("selectFood");
                    }) // 응답 도착 후 처리
                },
                nutri : function(){
                	axios
                    .get('http://localhost:9081/save/nutri/'+ this.id)        // 요청
                    .then(response=>{
                    	this.nutrients=response.data;
                    	this.la = []; // 초기화
                    	this.da = [];
                    	
                    	this.nutrients[0].amount = this.nutrients[0].amount.toFixed(2);
                    	
						for(var i = 1; i < this.nutrients.length; i++){
							this.la.push(this.nutrients[i].name);
							this.da.push(this.nutrients[i].manKcal - this.nutrients[i].amount);
							this.nutrients[i].amount = this.nutrients[i].amount.toFixed(2); 
						}
						this.scarce = this.nutrients[0].manKcal - this.nutrients[0].amount;
						this.scarce = this.scarce.toFixed(2);
						console.log(this.scarce);
                    }) // 응답 도착 후 처리
                },
                deleteFood : function(fcode1) {
                       axios
                       .get('http://localhost:9081/save/get/' + this.id)        // 요청
                       .then(response=>{
                       	this.mcode = response.data;
                       	this.fcode = fcode1;
                       	console.log(this.mcode + " // " + this.fcode);
                       	
                       	
                       	this.deleteFood2();
                       }) // 응답 도착 후 처리
                },
                deleteFood2 : function() {
                    axios
                    .delete('http://localhost:9081/save/' + this.fcode + "/" + this.mcode)        // 요청
                    .then(response=>{
                    	console.log(response.data);
                    	this.$router.push('/route3');
                    	
                    	this.selectFood();
                    	this.nutri();
//                     	this.drawing();
                    }) // 응답 도착 후 처리
             	},
             	drawing : function(){
                	var chart = new Chart(document.getElementById("chart"), {
       					type : 'bar',
       					data : {
       						labels : this.la,
       						datasets : [ {
       							label : "nutrients",
       							backgroundColor : [ '#ff6384', '#36a2eb', '#cc65fe',
       								'#ffce56'],
       							data : this.da
       						} ]
       					},
//        					options : {
//        						title : {
//        							display : false,
//        						}
//        					}
       				});
       				chart.render();
                }
            }
            
        });
        
        
        var eatInfo = Vue.component("eatInfo-info", { // my-info : component 이름
            template :'#eat-template',

            // data임에도 component는 함수 형식으로
            data() { 
                return {
                    la : [],
                    da : [],
                    food : [],
                    allergys : [],
                    getfood : [],
                    id : '${id}',
                    fcode : '',
                    mcode : '',
                    resources : "resources/"
                }
            },
            mounted(){
            	this.selectFood();
            	this.allergyFunc();
            	this.getFood();
            	console.log(this.getfood);
            	console.log("1");
             	//this.drawing();
             	
            },
            update(){
            	this.getFood();
            },
            watch : {
				da : function() {
					console.log("2");
					this.drawing()
				}
			},
            methods : {
            	selectFood : function(){
                    axios
                    .get('http://localhost:9081/Eatlist/' + this.id)
                    .then(response=>{
                    	this.food=response.data
                    }) // 응답 도착 후 처리
                },
                
                allergyFunc : function(){
					axios
					.get('http://localhost:9081/Eatlist/allergy/' + this.id)
					.then(response=> {
						this.allergys =response.data
						
						this.la = [];
						this.da = [];
						
						for(var i = 0; i < this.allergys.length; i++){
							this.la.push(this.allergys[i].al);
							this.da.push(this.allergys[i].cnt);
						}
					})
                },
                
                getFood : function(){
					axios
					.get('http://localhost:9081/Eatlist/getfood/' + this.id)
					.then(response=> {
						this.getfood = response.data;
						console.log(this.getfood);
						this.coloring();
					});
                }, 
                
                coloring : function(){
                	for(var i = 0; i < this.getfood.length; i++){
                		document.getElementById(this.getfood[i]).style.color="red";
                	}
                },
                
                deleteFood : function(fcode1) {
                    axios
                    .get('http://localhost:9081/Eatlist/get/' + this.id)        // 요청
                    .then(response=>{
                    	this.mcode = response.data;
                    	this.fcode = fcode1;
                    	console.log(this.mcode + " // " + this.fcode);
                    	
                    	
                    	this.deleteFood2();
                    }) // 응답 도착 후 처리
	             },
	             deleteFood2 : function() {
	                 axios
	                 .delete('http://localhost:9081/Eatlist/' + this.mcode + "/" + this.fcode)        // 요청
	                 .then(response=>{
	                 	console.log(response.data);
	                 	this.$router.push('/route2');
	                 	
	                 	this.selectFood();
	                 	this.allergyFunc();
	                 }) // 응답 도착 후 처리
	          	},
                drawing : function(){
       				var chart = new Chart(document.getElementById("chart2"), {
       					type : 'bar',
       					data : {
       						labels : this.la,
       						datasets : [ {
       							label : "allergy",
       							backgroundColor : [ '#ff6384', '#36a2eb', '#cc65fe',
       								'#ffce56'],
       							data : this.da
       						} ]	
       					},
       				});
       				chart.render();
                }
            }
            
        });
        
      //뷰라우터 객체 생성: 라우터 경로와 컴포넌트 맵핑
 	   const router = new VueRouter({
 			  routes: [
 					   { path: '/', component: myInfo}, // 개인정보
 					   { path: '/route2', component: eatInfo}, // 섭취정보
 					   { path: '/route3', component: saveInfo} // 찜한정보
 	   ]});  
         
       var vm = new Vue({
           el : "#app",
           router
       });
       
       Vue.config.devtools = true;
       
    </script>
	
 <!--     메인 끝 -->
	<%@include file="template_down.jsp" %>
</body>
</html>