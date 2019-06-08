# **SafeFood_WebProject**

>  Spring Boot, Vue.js based Safefood management project

<br/>



![ppt1.png](https://github.com/kim6394/SafeFood_WebProject/blob/master/%EC%BA%A1%EC%B3%90%ED%99%94%EB%A9%B4/ppt1.png?raw=true)

![ppt2.png](https://github.com/kim6394/SafeFood_WebProject/blob/master/%EC%BA%A1%EC%B3%90%ED%99%94%EB%A9%B4/ppt2.png?raw=true)

![ppt3.png](https://github.com/kim6394/SafeFood_WebProject/blob/master/%EC%BA%A1%EC%B3%90%ED%99%94%EB%A9%B4/ppt3.png?raw=true)

![ppt4.png](https://github.com/kim6394/SafeFood_WebProject/blob/master/%EC%BA%A1%EC%B3%90%ED%99%94%EB%A9%B4/ppt4.png?raw=true)

![ppt5.png](https://github.com/kim6394/SafeFood_WebProject/blob/master/%EC%BA%A1%EC%B3%90%ED%99%94%EB%A9%B4/ppt5.png?raw=true)

<br>

<br>



##### 메인 화면

![main.png](https://github.com/kim6394/SafeFood_WebProject/blob/master/%EC%BA%A1%EC%B3%90%ED%99%94%EB%A9%B4/main.png?raw=true)

<br>

##### 회원 가입

![join.png](https://github.com/kim6394/SafeFood_WebProject/blob/master/%EC%BA%A1%EC%B3%90%ED%99%94%EB%A9%B4/join.png?raw=true)

비밀번호와 비밀번호 확인이 서로 일치해야 정상적인 회원가입이 가능하도록 구현했음

<br>

##### 상품 정보

![bestEat.PNG](https://github.com/kim6394/SafeFood_WebProject/blob/master/%EC%BA%A1%EC%B3%90%ED%99%94%EB%A9%B4/bestEat.PNG?raw=true)

먼저 사용자들이 가장 많이 섭취한 베스트3 음식을 소개해줌

<br>

![list.PNG](https://github.com/kim6394/SafeFood_WebProject/blob/master/%EC%BA%A1%EC%B3%90%ED%99%94%EB%A9%B4/list.PNG?raw=true)

그 이후 음식 전체리스트가 나오고, 섭취와 찜을 버튼을 통해 할 수 있음

<br>

##### 검색

![search.png](https://github.com/kim6394/SafeFood_WebProject/blob/master/%EC%BA%A1%EC%B3%90%ED%99%94%EB%A9%B4/search.png?raw=true)

검색창을 통해 음식 데이터 정보 검색 가능

(추가 : 유사정보 검색을 위한 '검색 알고리즘 추가 구현')

<br>

> 검색한 정보가 데이터에 존재하지 않을 때, 일치율 60%이상인 정보를 출력하도록 알고리즘 구현

<br>

```java
@Override
	public List<Food> similarSearch(String f_name) {
		
		List<Food> allList = Fmapper.selectAll(); // 전체 음식리스트 불러오기
		
		List<Food> similar = new ArrayList<Food>();
		
		// 음식을 하나씩 돌면서, 유사한 단어가 있는지 체크하기. 한글자씩 비교해서 60%이상 일치하는 단어만 따로 저장후 return;
		for (int i = 0; i < allList.size(); i++) {
			
			Food f = allList.get(i);
			
			String[] origin = f.getName().split(""); // 원본 단어 한글자씩 자르기
			String[] arr = f_name.split(""); // 검색한 단어 한글자씩 자르기
			
			double length = origin.length; // 전체 글자 수
			double correct = 0.0; // 일치하는 수
			
			if(origin.length != arr.length) { // 같지 않을 때
				
				boolean[] chk = new boolean[origin.length];
				length = arr.length;
				
				for (int j = 0; j < arr.length; j++) {
					
					String s = arr[j];
					
					for (int k = 0; k < origin.length; k++) {
						
						if(s.equals(origin[k]) && !chk[k]) {
							chk[k] = true;
							correct++;
							break;
						}
						
					}
					
				}
				
			}
			
			else { // 같을 때
				for (int j = 0; j < origin.length; j++) {
					if(origin[j].equals(arr[j])) {
						correct++;
					}
				}
			}
			
			System.out.println("length : " + length);
			System.out.println("correct : " + correct);
			double percent = correct / length;
			System.out.println("percent : " + percent);
			if(percent >= 0.6) { // 일치확률이 60%이상 이면
				similar.add(f);
				System.out.println("--------추가!------------");
			}
			
		}
		
		return similar;
	}
```

<br>

<br>

(Vue.js를 활용해 단일 페이지 퍼포먼스 활용)

##### 내 정보

![myinfo.png](https://github.com/kim6394/SafeFood_WebProject/blob/master/%EC%BA%A1%EC%B3%90%ED%99%94%EB%A9%B4/myinfo.png?raw=true)

내 개인정보 확인 및 변경을 통해 수정이 가능

<br>

##### 섭취 정보

![eatInfo.PNG](https://github.com/kim6394/SafeFood_WebProject/blob/master/%EC%BA%A1%EC%B3%90%ED%99%94%EB%A9%B4/eatInfo.PNG?raw=true)

해당 사용자가 섭취한 내역 및 알레르기 정보 표시

<br>

##### 찜한 정보

![saveInfo.PNG](https://github.com/kim6394/SafeFood_WebProject/blob/master/%EC%BA%A1%EC%B3%90%ED%99%94%EB%A9%B4/saveInfo.PNG?raw=true)

찜한 음식의 영양 성분을 체크해 사용자의 권장 섭취량과 비교한 내역 출력

<br>

<br>

##### QnA 게시판

![qna.PNG](https://github.com/kim6394/SafeFood_WebProject/blob/master/%EC%BA%A1%EC%B3%90%ED%99%94%EB%A9%B4/qna.PNG?raw=true)

CRUD기능을 갖춘 게시판 구현

<br>

<br>

##### Quiz

![quiz.PNG](https://github.com/kim6394/SafeFood_WebProject/blob/master/%EC%BA%A1%EC%B3%90%ED%99%94%EB%A9%B4/quiz.PNG?raw=true)

음식 및 알레르기에 대한 기본 상식 퀴즈를 랜덤으로 10문제 출력하도록 구현

(맞춘 개수에 따라 회원등급이 존재하며, 제공되는 음식데이터가 달라짐)

<br>

<br>

##### Google 번역 API를 활용한 번역 서비스

나라 설정을 통한 웹 페이지 번역 서비스 구현

![english_main.PNG](https://github.com/kim6394/SafeFood_WebProject/blob/master/%EC%BA%A1%EC%B3%90%ED%99%94%EB%A9%B4/english_main.PNG?raw=true)

![arab_list.PNG](https://github.com/kim6394/SafeFood_WebProject/blob/master/%EC%BA%A1%EC%B3%90%ED%99%94%EB%A9%B4/arab_list.PNG?raw=true)

