<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
  <head>
    <title>Quiz 6</title>
    <script>
    function setInnerText(element, value) {
      if (element.innerText) {
        element.innerText = value;
      } else {
        element.textContent = value;
      }
    }
 
    function includeGadget(url) {
      var scriptEl = document.createElement('script');
 
      if (url.match(/^https?:\/\//)) {
        alert("미안해요~ \"http\" 의 문자열로 시작하는 값은 보안상 막아놨어요!");
        return;
      }
 
      scriptEl.src = url;
 
      scriptEl.onload = function() { 
        setInnerText(document.getElementById("log"),  
          "Loaded gadget from " + url);
      }
      scriptEl.onerror = function() { 
        setInnerText(document.getElementById("log"),  
          "Couldn't load gadget from " + url);
      }
 
      document.head.appendChild(scriptEl);
    }
 
    function getGadgetName() { 
      return window.location.hash.substr(1) || "loading.js";
    }
 
    includeGadget(getGadgetName());
 
    window.addEventListener("message", function(event){
      if (event.source == parent) {
        includeGadget(getGadgetName());
      }
    }, false);
 
    </script>
  </head>
 
  <body id="level6">
    <img src="iu1.jpg">
    <div id="log">Loading IU... hint:index.html#attack.js???</div>
	
	<br><br> XSS 취약점이 존재합니다.
	<br><br> Alert()을 띄우는 입력 값을 찾으세요~	 
	<br><br> hint1 : index.html#attack.js 이렇게 입력해보세요
	<br><br> hint2 : 정규표현식?
	<br><br> hint3 : 실제 공격하기 위해서는 공격자 서버가 있어야 되는 경우도 있습니다. <br>하지만 취약점 존재여부 테스트용도일 경우엔 필요하지 않을 수 도 있어요
	
	<br><button><a href="javascript:history.back(-1)">뒤로가기</A></button>
  </body>
</html>