<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>
	<footer style="margin-bottom : 400px;">
	<br><br><br><br>
	<hr style="border: 1px solid gray;" class="container">
	<div class="container">
		<div class="col-md-5">
			<h2>SafeFood 오시는 길</h2><br>
			<div id="map" style="height: 400px; width: 400px; left-margin: 15%;"></div>
		</div>
		<div class="col-md-1"></div>
		<div class="col-md-6">
			<div class="col-md-12" style="padding-top : 60px; text-align:left;">
				<h3>이용약관 | 개인정보처리취급방침</h3><br><br>
				<p>멀티캠퍼스 서울특별시 강남구 언주로 508 10-8층 801호(역삼동, 서울상록빌딩)</p>
				<p>월 ~ 금 : 09:00 ~ 18:00 | 토요일 일요일 공유일은 휴무입니다.</p>
				<p>고객센터 1234-1234</p>
				<br><br><br><br><br><br>
				<p><%@include file="template_translate.jsp" %></p>
			</div>
		</div>
		</footer>
	</div>
	<hr style="border: 1px solid gray; margin-bottom : 100px;"" class="container">

	<script>
		var map;
		function initMap() {
			var mapOptions = {
				center : {
					lat : 37.501363,
					lng : 127.039664
				},
				zoom : 16
			};
			map = new google.maps.Map(document.getElementById('map'),
					mapOptions);
			var marker = new google.maps.Marker({ //마커 설정
				position : map.getCenter(), //마커 위치
				title : "역삼역 멀티캠퍼스",
// 				draggable : true
			});
			marker.setMap(map);
		}
	</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDWhxTRugFS3so7QLT_dnpm6syLh6nVoH4&callback=initMap"
		async defer>
	</script>
</body>
</html>