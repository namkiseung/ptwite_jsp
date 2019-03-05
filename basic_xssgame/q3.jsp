<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
  <head>
    <title>Quiz 3</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js">
    </script>
 
    <script>
      function chooseTab(num) {
	  
        var html = "Image " + parseInt(num) + "<br>";
        html += "<img src='/lhs/quiz2/q3/iu" + num + ".jpg' />";
        $('#tabContent').html(html);
 
        window.location.hash = num; 
 
        var tabs = document.querySelectorAll('.tab');
        for (var i = 0; i < tabs.length; i++) {
          if (tabs[i].id == "tab" + parseInt(num)) {
            tabs[i].className = "tab active";
            } else {
            tabs[i].className = "tab";
          }
        }
 
        top.postMessage(self.location.toString(), "*");
      }
 
      window.onload = function() { 
        chooseTab(unescape(self.location.hash.substr(1)) || "1");
      } 
 	  
    </script>
 
  </head>
  <body id="l3">
    <div id="header">
      <span>아이유 사진 모음</a>
    </div>
 
    <div class="tab" id="tab1" onclick="chooseTab('1')"><input type="button" value="img1"></div>
    <div class="tab" id="tab2" onclick="chooseTab('2')"><input type="button" value="img2"></div>
    <div class="tab" id="tab3" onclick="chooseTab('3')"><input type="button" value="img3"></div>
	<br><br>
    Your Click is <div id="tabContent"> </div>
	<br><br> Dom XSS 취약점이 존재합니다.
	<br><br> Alert()을 띄우는 입력 값을 찾으세요~	
	<br><br> *자바스크립트 변수를 가변적으로 사용하는 경우 서버에 직접 관여하지 않고도 XSS 취약점이 발생할 수 있습니다 
	
	<br><button><a href="javascript:history.back(-1)">뒤로가기</A></button>
  </body>
</html>