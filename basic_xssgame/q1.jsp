
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
	<head>
		<title>Quiz 1</title>
	</head>  
	<body id="xss">
	  <div>
		<form action="" method="GET">
		  <input id="query" name="query" value="XSS Text here..." onfocus="this.value=''">
		  <input id="button" type="submit" value="Search">
		</form>
		param is null !
	</div>
	<body id="desc">
	<br> <br> Reflected XSS 취약점이 존재합니다.
	<br> <br> Alert()을 띄우는 입력 값을 찾으세요~
	</div>
	<br><button><a href="javascript:history.back(-1)">뒤로가기</A></button>
	</body>
</html>