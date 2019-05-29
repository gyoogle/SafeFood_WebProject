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
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<script src="https://unpkg.com/vue"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script src="https://unpkg.com/vue-router/dist/vue-router.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
</head>
<body>
	<!-- 배너 -->
	<%@include file="template_up.jsp"%>

	<div id="app">
		<div class='search_box' style="text-align: center; font-size: 25px">
			<router-link to="/">QnA 게시판</router-link> &nbsp&nbsp&nbsp
			<router-link to="/route2">글쓰기</router-link>
		</div>
		<router-view></router-view>
	</div>



	<!-- template 정의 : 화면에 표시될 내용 -->
	<template id="board-template">
	<div>
		<div class="container">
			<h2>QnA 게시판</h2>
			<br>
			<br>
			<div>
				<select name="category" v-model="option" style="height: 23.979166px;">
					<option value="1" selected="selected">제목</option>
					<option value="2">작성자</option>
				</select>
				<input type="text" v-model="searchContent"></input>
			 	<button @click="search">검색</button>
			 	<button @click="allBoard" style="margin-left : 90%;">전체 게시글</button>
<!-- 				<router-link :to="{ name: 'search', params : { option : option, searchContent : searchContent}}">검색</router-link> -->
			</div>

			<br>
			<table class="table text-center">
				<thead>
					<tr>
						<th class="text-center">글 번호</th>
						<th class="text-center">작성자</th>
						<th class="text-center">제목</th>
						<th class="text-center">작성 날짜</th>
						<th class="text-center">조회수</th>
						<th class="text-center">내용</th>
					</tr>
				</thead>

				<!--             document.ready()와 같이  -->
				<tbody>
					<!-- 					<tr v-for="board in result" @click="selectBoard(board.num)"> -->

					<tr v-for="board in result">
						<td v-text="board.num"></td>
						<td v-text="board.name"></td>
						<td v-text="board.title"></td>
						<td v-text="board.wdate"></td>
						<td v-text="board.count"></td>
						<td><router-link :to="{ name: 'num', params : { num : board.num}}">읽기</router-link></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	</template>

	<template id="addboard-template">
	<div class="container">
		<form id="form1" class="form-horizontal">
			<h2>질문하기</h2>
			<hr>
			<div class="form-group">
				<h4 style="font-weight: bold;">작성자: ${id }</h4>
			</div>
			<div class="form-group">
				<label>비밀번호</label> <input type="password" class="form-control"
					id="pass" v-model="pass" required="required">
			</div>
			<div class="form-group">
				<label>제목</label> <input type="text" class="form-control"
					id="title" v-model="title" required="required">
			</div>

			<div class="form-group">
				<label>내용 </label> <input type="text" class="form-control"
					id="content" v-model="content" style="height: 80px;" required="required">
			</div>

			<div class="btn-group">
				<input type="submit" class="btn btn-primary" value="등록" id="btnAdd"
					@click="addBoard" />
			</div>
		</form>
	</div>
	</template>

	<template id="updateboard-template">
	<div class="container">
		<form id="form1" class="form-horizontal">
			<h2>수정하기</h2>
			<hr>
			<div class="form-group">
				<h4 style="font-weight: bold;">작성자: ${id }</h4>
			</div>
			<div class="form-group">
				<label>제목</label> <input type="text" class="form-control"
					id="title" v-model="title" required="required">
			</div>

			<div class="form-group">
				<label>내용</label> <input type="text" class="form-control"
					id="content" v-model="content" style="height: 80px;" required="required">
			</div>

			<div class="btn-group">
				<input type="submit" class="btn btn-primary" value="수정" id="btnAdd"
					@click="updateBoard()" required="required"/>
			</div>
		</form>
	</div>
	</template>

	<template id="viewboard">
	<div class="container">
		<h2>글읽기</h2>
		<br>
		<table class="table text-center">
				<tr>
					<th class="text-center">글 번호</th>
					<td v-text="num"></td>
				</tr>
				<tr>
					<th class="text-center">작성자</th>
					<td v-text="name"></td>
				</tr>
				<tr>
					<th class="text-center">글 제목</th>
					<td v-text="title"></td>
				</tr>
				<tr>
					<th class="text-center">글 내용</th>
					<td v-text="content"></td>
				</tr>
				<tr>
					<th class="text-center">작성일</th>
					<td v-text="wdate"></td>
				</tr>
				<tr>
					<th class="text-center">조회수</th>
					<td v-text="count"></td>
				</tr>
				
		</table>

		<div style="text-align: center; font-size: 18px;">
			<button @click="passwordConfirm">수정</button>
<!-- 			<router-link :to="{ name: 'update', params : { num : num}}">수정</router-link> -->
			&nbsp&nbsp&nbsp
			<button @click="deleteBoard">삭제</button>
		</div>
	</div>
	</template>



	<script type="text/javascript">
	
	
		function addBoard2(){
			alert("1234")
			router.push('/')
		}
        <!-- component 정의 : 화면, data, method .... -->
        var boardresult = Vue.component("board-result", { // board-result : component 이름
            template :'#board-template',

            // data임에도 component는 함수 형식으로
            data() { 
                return {
                    result : [],    // ajax 요청 후에 서버가 보내준 결과 담에 놓을 변수
                    pass : '',
                    title : '',
                    content : '',
                    option : '',
                    searchContent : ''
                }
            },
            mounted(){
                this.allBoard()
            }, 
            methods : {
                allBoard : function(){
                    axios
                    .get('http://localhost:9081/articles')        // 요청
                    .then(response=>{
                    	console.log("???");
                    	this.result=response.data
                    }) // 응답 도착 후 처리
                    console.log("allBoard 소환");
                },
                init : function(){
                    this.pass = '';
                    this.name = '';
                    this.title = '';
                    this.content = '';
                },
            	search : function() {
		        	console.log(this.option);
		        	console.log(this.searchContent);
		        	if (this.option == ''){
		        		alert('검색 옵션을 선택하세요!')
		        	} else if (this.searchContent == ''){
		        		alert('검색어를 입력하세요!');
		        	}
		        	else if (this.option == '1'){
		        		axios
		                .get('http://localhost:9081/articles/title/' + this.searchContent)        // 요청
		                .then(response=>(this.result=response.data))
		        	}
		        	
		        	else if (this.option == '2'){
		        		axios
		                .get('http://localhost:9081/articles/name/' + this.searchContent)        // 요청
		                .then(response=>(this.result=response.data))
		        	}
            	}
            }
        }); 
        
        var searchresult = Vue.component("searchresult", { // board-result : component 이름
            template :'#board-template',
        
        	data(){
                return {
                    result : [],    // ajax 요청 후에 서버가 보내준 결과 담에 놓을 변수
                    pass : '',
                    title : '',
                    content : '',
                    option : '',
                    searchContent : ''
                }
            },
            mounted(){
                this.search()
            },
            methods : {
            	search : function() {
		        	if (this.$route.params.option == '1'){
		        		console.log(this.option);
		        		console.log(this.searchContent);
		        		axios
		                .get('http://localhost:9081/articles/title/' + this.$route.params.searchContent)        // 요청
		                .then(response=>(this.result=response.data))
		        	}
		        	
		        	else if (this.$route.params.option == '2'){
		        		console.log('2xxxx');
		        		axios
		                .get('http://localhost:9081/articles/name/' + this.$route.params.searchContent)        // 요청
		                .then(response=>(this.result=response.data))
		        	}
            	}
            }
        });
        
        var addboard = Vue.component('addboard', {
        	template: '#addboard-template',
        	data() { 
                return {
                    result : [],    // ajax 요청 후에 서버가 보내준 결과 담에 놓을 변수
                    pass : '',
                    name : '',
                    title : '',
                    content : ''
                }
            },
        	methods : {
        		allBoard : function(){
                    axios
                    .get('http://localhost:9081/articles')        // 요청
                    .then(response=>(this.result=response.data)) // 응답 도착 후 처리
                    console.log(this.result)
                },
        		addBoard : function(){
                	axios
                    .post('http://localhost:9081/articles', {pass:this.pass, name:"${sessionScope.id}", title:this.title, content:this.content})        // 요청
                    .then(response=>{
                    	console.log("실행됨")
                    	
//                    	this.$router.push('/');
                    	router.push('/');
                    	
                    	console.log("after")
//                     	this.allBoard()
                    })
                    console.log(this.name)
                }
        	}
        });
        
        var updateboard = Vue.component('updateboard', {
        	template: '#updateboard-template',
        	data() { 
                return {
                    result : [],    // ajax 요청 후에 서버가 보내준 결과 담에 놓을 변수
                    num : '',
                    title : '',
                    content : ''
                }
            },
            mounted(){
            	this.num = this.$route.params.num;
            },
        	methods : {
        		allBoard : function(){
                    axios
                    .get('http://localhost:9081/articles')        // 요청
                    .then(response=>(this.result=response.data)) // 응답 도착 후 처리
                    console.log("여기가 호출되는가?")
                },
                updateBoard : function(){
                	axios
                    .put('http://localhost:9081/articles', {num:this.num, title:this.title, content:this.content})        // 요청
                    .then(response=>{
                    	alert("수정이 완료되었습니다.");
//                     	this.allBoard();
                    	this.$router.push('/');
                    })
                }
        	}
        });
        
        var viewboard = Vue.component('viewboard', {
        	template: '#viewboard',
            // data임에도 component는 함수 형식으로
            data() { 
                return {
                    result : [],    // ajax 요청 후에 서버가 보내준 결과 담에 놓을 변수
                    num : '',
                    name : '',
                    title : '',
                    content : '',
                    wdate : '',
                    count : '',
                    passNow: '',
                    passNowResult: []
                }
            },
            mounted(){
            	this.num = this.$route.params.num;
            	this.selectBoard(this.num);
            	console.log("상세 글 읽기 호출 : " + this.num);
            }, 
            
        	methods : {
        		passwordConfirm : function(){
        			this.passNow = prompt("비밀번호를 입력하세요", "");
        			
        			axios
        			.get('http://localhost:9081/articles/passConfirm/' + this.num + "/" + this.passNow)
        			.then(response=>{
        				this.passNowResult = response.data
        				console.log("결과2 : " + this.passNowResult)
        				
	        			if (this.passNowResult.result == 'correct'){
							alert("비밀번호 확인 완료")	        				
	        				this.$router.push({name : 'update', params : {num : this.num}});
	        			} 
	        			else if (this.passNowResult.result == 'incorrect'){
	        				alert("비밀번호가 일치하지 않습니다.")
	        			}
        			})
        		},
        		allBoard : function(){
                    axios
                    .get('http://localhost:9081/articles')        // 요청
                    .then(response=>(this.result=response.data)) // 응답 도착 후 처리
                    console.log(this.result)
                },
                selectBoard : function(num){
                	axios
                    .get('http://localhost:9081/articles/'+ num)        // 요청
                    .then(response=>{
                    	this.num=response.data.num // 응답 도착 후 처리
                    	this.name=response.data.name // 응답 도착 후 처리
                    	this.title=response.data.title // 응답 도착 후 처리
                    	this.content=response.data.content // 응답 도착 후 처리
                    	this.wdate=response.data.wdate // 응답 도착 후 처리
                    	this.count=response.data.count // 응답 도착 후 처리
                    })
                },
                deleteBoard : function(){
                	this.passNow = prompt("비밀번호를 입력하세요", "");
                	
                	axios
        			.get('http://localhost:9081/articles/passConfirm/' + this.num + "/" + this.passNow)
        			.then(response=>{
        				this.passNowResult = response.data
//         				console.log("결과2 : " + this.passNowResult)
        				
	        			if (this.passNowResult.result == 'correct'){
	        				axios
	                        .delete('http://localhost:9081/articles/'+ this.num)        // 요청
	                        .then(response=>{
	                        	alert("삭제가 완료되었습니다.")
	                        	this.$router.push('/');
	                        	this.allBoard()
	                        })		
	        			} else if (this.passNowResult.result == 'incorrect'){
	        				alert("비밀번호가 일치하지 않습니다.")
	        			}
        			})
                },
                updateBoard : function(num){
                	axios
                    .put('http://localhost:9081/articles', {num:this.num, title:this.title, content:this.content})        // 요청
                    .then(response=>{
                    	this.$router.push('/');
                    	this.allBoard()
                    })
                },
                init : function(){
                    this.num = '';
                    this.name = '';
                    this.title = '';
                    this.content = '';
                    this.wdate = '';
                    this.count = '';
                }
        	}
        });
        
	   //뷰라우터 객체 생성: 라우터 경로와 컴포넌트 맵핑
	   const router = new VueRouter({
			  routes: [
// 					   { path: '/', name : 'listall', component: boardresult},
					   { path: '/', name : 'xx', component: boardresult},
					   { path: '/route2', component: addboard},
					   { path: '/route3/:num', name : 'num', component: viewboard},
					   { path: '/route4/:num', name : 'update', component: updateboard},
					   { path: '/route5/:option/:searchContent', name : 'search', component: searchresult}
	 	]});  
        
        var vm = new Vue({
            el : "#app",
            router
        });
        
        Vue.config.devtools = true;
    </script>

	<!--     메인 끝 -->
	<%@include file="template_down.jsp"%>

</body>
</html>