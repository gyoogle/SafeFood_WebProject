<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.goog-te-banner-frame.skiptranslate {
	display: none !important;
}

.goog-te-combo {
	width: 110px; /* 원하는 너비설정 */
	padding: .8em .5em; /* 여백으로 높이 설정 */
	font-weight:bold; 
	font-family: inherit; /* 폰트 상속 */
	background:
		url(https://icon-icons.com/icons2/32/PNG/32/globe_earth_planet_2767.png)
		no-repeat 95% 50%; /* 네이티브 화살표 대체 */
	border: 1px solid #999;
	border-radius: 3px; /* iOS 둥근모서리 제거 */
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
}

body {
	top: 0px !important;
}
</style>
</head>
<body>

	<div id="google_translate_element"></div>
	<script type="text/javascript">
		function googleTranslateElementInit() {
			new google.translate.TranslateElement({
				pageLanguage : 'ko'
			}, 'google_translate_element');
		}
	</script>
	<script type="text/javascript"
		src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>



</body>
</html>