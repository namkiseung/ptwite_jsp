<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
  <head>
    <title>Quiz 4</title>
  </head>
 
  <body id="l4">
  
    <br>
    <form action="t.jsp" method="GET">
      <input id="t" name="t" value="5">
      <input id="button" type="submit" value="go"> </form>
    </form>
	
	<br><br> XSS 취약점이 존재합니다.
	<br><br> Alert()을 띄우는 입력 값을 찾으세요~		
	<br><button><a href="javascript:history.back(-1)">뒤로가기</A></button>
  </body>
</html>