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
			<h2>SafeFood ���ô� ��</h2><br>
			<div id="map" style="height: 400px; width: 400px; left-margin: 15%;"></div>
		</div>
		<div class="col-md-1"></div>
		<div class="col-md-6">
			<div class="col-md-12" style="padding-top : 60px; text-align:left;">
				<h3>�̿��� | ��������ó����޹�ħ</h3><br><br>
				<p>��Ƽķ�۽� ����Ư���� ������ ���ַ� 508 10-8�� 801ȣ(���ﵿ, �����Ϻ���)</p>
				<p>�� ~ �� : 09:00 ~ 18:00 | ����� �Ͽ��� �������� �޹��Դϴ�.</p>
				<p>������ 1234-1234</p>
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
			var marker = new google.maps.Marker({ //��Ŀ ����
				position : map.getCenter(), //��Ŀ ��ġ
				title : "���￪ ��Ƽķ�۽�",
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