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
	<!-- ��� -->
	<%@include file="template_up.jsp"%>

	<div id="app">
		<div class='search_box' style="text-align: center; font-size: 25px">
			<router-link to="/">QnA �Խ���</router-link> &nbsp&nbsp&nbsp
			<router-link to="/route2">�۾���</router-link>
		</div>
		<router-view></router-view>
	</div>



	<!-- template ���� : ȭ�鿡 ǥ�õ� ���� -->
	<template id="board-template">
	<div>
		<div class="container">
			<h2>QnA �Խ���</h2>
			<br>
			<br>
			<div>
				<select name="category" v-model="option" style="height: 23.979166px;">
					<option value="1" selected="selected">����</option>
					<option value="2">�ۼ���</option>
				</select>
				<input type="text" v-model="searchContent"></input>
			 	<button @click="search">�˻�</button>
			 	<button @click="allBoard" style="margin-left : 90%;">��ü �Խñ�</button>
<!-- 				<router-link :to="{ name: 'search', params : { option : option, searchContent : searchContent}}">�˻�</router-link> -->
			</div>

			<br>
			<table class="table text-center">
				<thead>
					<tr>
						<th class="text-center">�� ��ȣ</th>
						<th class="text-center">�ۼ���</th>
						<th class="text-center">����</th>
						<th class="text-center">�ۼ� ��¥</th>
						<th class="text-center">��ȸ��</th>
						<th class="text-center">����</th>
					</tr>
				</thead>

				<!--             document.ready()�� ����  -->
				<tbody>
					<!-- 					<tr v-for="board in result" @click="selectBoard(board.num)"> -->

					<tr v-for="board in result">
						<td v-text="board.num"></td>
						<td v-text="board.name"></td>
						<td v-text="board.title"></td>
						<td v-text="board.wdate"></td>
						<td v-text="board.count"></td>
						<td><router-link :to="{ name: 'num', params : { num : board.num}}">�б�</router-link></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	</template>

	<template id="addboard-template">
	<div class="container">
		<form id="form1" class="form-horizontal">
			<h2>�����ϱ�</h2>
			<hr>
			<div class="form-group">
				<h4 style="font-weight: bold;">�ۼ���: ${id }</h4>
			</div>
			<div class="form-group">
				<label>��й�ȣ</label> <input type="password" class="form-control"
					id="pass" v-model="pass" required="required">
			</div>
			<div class="form-group">
				<label>����</label> <input type="text" class="form-control"
					id="title" v-model="title" required="required">
			</div>

			<div class="form-group">
				<label>���� </label> <input type="text" class="form-control"
					id="content" v-model="content" style="height: 80px;" required="required">
			</div>

			<div class="btn-group">
				<input type="submit" class="btn btn-primary" value="���" id="btnAdd"
					@click="addBoard" />
			</div>
		</form>
	</div>
	</template>

	<template id="updateboard-template">
	<div class="container">
		<form id="form1" class="form-horizontal">
			<h2>�����ϱ�</h2>
			<hr>
			<div class="form-group">
				<h4 style="font-weight: bold;">�ۼ���: ${id }</h4>
			</div>
			<div class="form-group">
				<label>����</label> <input type="text" class="form-control"
					id="title" v-model="title" required="required">
			</div>

			<div class="form-group">
				<label>����</label> <input type="text" class="form-control"
					id="content" v-model="content" style="height: 80px;" required="required">
			</div>

			<div class="btn-group">
				<input type="submit" class="btn btn-primary" value="����" id="btnAdd"
					@click="updateBoard()" required="required"/>
			</div>
		</form>
	</div>
	</template>

	<template id="viewboard">
	<div class="container">
		<h2>���б�</h2>
		<br>
		<table class="table text-center">
				<tr>
					<th class="text-center">�� ��ȣ</th>
					<td v-text="num"></td>
				</tr>
				<tr>
					<th class="text-center">�ۼ���</th>
					<td v-text="name"></td>
				</tr>
				<tr>
					<th class="text-center">�� ����</th>
					<td v-text="title"></td>
				</tr>
				<tr>
					<th class="text-center">�� ����</th>
					<td v-text="content"></td>
				</tr>
				<tr>
					<th class="text-center">�ۼ���</th>
					<td v-text="wdate"></td>
				</tr>
				<tr>
					<th class="text-center">��ȸ��</th>
					<td v-text="count"></td>
				</tr>
				
		</table>

		<div style="text-align: center; font-size: 18px;">
			<button @click="passwordConfirm">����</button>
<!-- 			<router-link :to="{ name: 'update', params : { num : num}}">����</router-link> -->
			&nbsp&nbsp&nbsp
			<button @click="deleteBoard">����</button>
		</div>
	</div>
	</template>



	<script type="text/javascript">
	
	
		function addBoard2(){
			alert("1234")
			router.push('/')
		}
        <!-- component ���� : ȭ��, data, method .... -->
        var boardresult = Vue.component("board-result", { // board-result : component �̸�
            template :'#board-template',

            // data�ӿ��� component�� �Լ� ��������
            data() { 
                return {
                    result : [],    // ajax ��û �Ŀ� ������ ������ ��� �㿡 ���� ����
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
                    .get('http://localhost:9081/articles')        // ��û
                    .then(response=>{
                    	console.log("???");
                    	this.result=response.data
                    }) // ���� ���� �� ó��
                    console.log("allBoard ��ȯ");
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
		        		alert('�˻� �ɼ��� �����ϼ���!')
		        	} else if (this.searchContent == ''){
		        		alert('�˻�� �Է��ϼ���!');
		        	}
		        	else if (this.option == '1'){
		        		axios
		                .get('http://localhost:9081/articles/title/' + this.searchContent)        // ��û
		                .then(response=>(this.result=response.data))
		        	}
		        	
		        	else if (this.option == '2'){
		        		axios
		                .get('http://localhost:9081/articles/name/' + this.searchContent)        // ��û
		                .then(response=>(this.result=response.data))
		        	}
            	}
            }
        }); 
        
        var searchresult = Vue.component("searchresult", { // board-result : component �̸�
            template :'#board-template',
        
        	data(){
                return {
                    result : [],    // ajax ��û �Ŀ� ������ ������ ��� �㿡 ���� ����
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
		                .get('http://localhost:9081/articles/title/' + this.$route.params.searchContent)        // ��û
		                .then(response=>(this.result=response.data))
		        	}
		        	
		        	else if (this.$route.params.option == '2'){
		        		console.log('2xxxx');
		        		axios
		                .get('http://localhost:9081/articles/name/' + this.$route.params.searchContent)        // ��û
		                .then(response=>(this.result=response.data))
		        	}
            	}
            }
        });
        
        var addboard = Vue.component('addboard', {
        	template: '#addboard-template',
        	data() { 
                return {
                    result : [],    // ajax ��û �Ŀ� ������ ������ ��� �㿡 ���� ����
                    pass : '',
                    name : '',
                    title : '',
                    content : ''
                }
            },
        	methods : {
        		allBoard : function(){
                    axios
                    .get('http://localhost:9081/articles')        // ��û
                    .then(response=>(this.result=response.data)) // ���� ���� �� ó��
                    console.log(this.result)
                },
        		addBoard : function(){
                	axios
                    .post('http://localhost:9081/articles', {pass:this.pass, name:"${sessionScope.id}", title:this.title, content:this.content})        // ��û
                    .then(response=>{
                    	console.log("�����")
                    	
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
                    result : [],    // ajax ��û �Ŀ� ������ ������ ��� �㿡 ���� ����
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
                    .get('http://localhost:9081/articles')        // ��û
                    .then(response=>(this.result=response.data)) // ���� ���� �� ó��
                    console.log("���Ⱑ ȣ��Ǵ°�?")
                },
                updateBoard : function(){
                	axios
                    .put('http://localhost:9081/articles', {num:this.num, title:this.title, content:this.content})        // ��û
                    .then(response=>{
                    	alert("������ �Ϸ�Ǿ����ϴ�.");
//                     	this.allBoard();
                    	this.$router.push('/');
                    })
                }
        	}
        });
        
        var viewboard = Vue.component('viewboard', {
        	template: '#viewboard',
            // data�ӿ��� component�� �Լ� ��������
            data() { 
                return {
                    result : [],    // ajax ��û �Ŀ� ������ ������ ��� �㿡 ���� ����
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
            	console.log("�� �� �б� ȣ�� : " + this.num);
            }, 
            
        	methods : {
        		passwordConfirm : function(){
        			this.passNow = prompt("��й�ȣ�� �Է��ϼ���", "");
        			
        			axios
        			.get('http://localhost:9081/articles/passConfirm/' + this.num + "/" + this.passNow)
        			.then(response=>{
        				this.passNowResult = response.data
        				console.log("���2 : " + this.passNowResult)
        				
	        			if (this.passNowResult.result == 'correct'){
							alert("��й�ȣ Ȯ�� �Ϸ�")	        				
	        				this.$router.push({name : 'update', params : {num : this.num}});
	        			} 
	        			else if (this.passNowResult.result == 'incorrect'){
	        				alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.")
	        			}
        			})
        		},
        		allBoard : function(){
                    axios
                    .get('http://localhost:9081/articles')        // ��û
                    .then(response=>(this.result=response.data)) // ���� ���� �� ó��
                    console.log(this.result)
                },
                selectBoard : function(num){
                	axios
                    .get('http://localhost:9081/articles/'+ num)        // ��û
                    .then(response=>{
                    	this.num=response.data.num // ���� ���� �� ó��
                    	this.name=response.data.name // ���� ���� �� ó��
                    	this.title=response.data.title // ���� ���� �� ó��
                    	this.content=response.data.content // ���� ���� �� ó��
                    	this.wdate=response.data.wdate // ���� ���� �� ó��
                    	this.count=response.data.count // ���� ���� �� ó��
                    })
                },
                deleteBoard : function(){
                	this.passNow = prompt("��й�ȣ�� �Է��ϼ���", "");
                	
                	axios
        			.get('http://localhost:9081/articles/passConfirm/' + this.num + "/" + this.passNow)
        			.then(response=>{
        				this.passNowResult = response.data
//         				console.log("���2 : " + this.passNowResult)
        				
	        			if (this.passNowResult.result == 'correct'){
	        				axios
	                        .delete('http://localhost:9081/articles/'+ this.num)        // ��û
	                        .then(response=>{
	                        	alert("������ �Ϸ�Ǿ����ϴ�.")
	                        	this.$router.push('/');
	                        	this.allBoard()
	                        })		
	        			} else if (this.passNowResult.result == 'incorrect'){
	        				alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.")
	        			}
        			})
                },
                updateBoard : function(num){
                	axios
                    .put('http://localhost:9081/articles', {num:this.num, title:this.title, content:this.content})        // ��û
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
        
	   //������ ��ü ����: ����� ��ο� ������Ʈ ����
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

	<!--     ���� �� -->
	<%@include file="template_down.jsp"%>

</body>
</html>