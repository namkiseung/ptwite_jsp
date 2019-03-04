<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
 <!-------기본 로그인 컴포넌트------->
<form name="" action="login_chk.jsp" method="post">
    <center>
        <table border=1 style="width: 300px; height: 100px;">
             <tr>
                  <td colspan="2" align=center>
                  <b><font size=6>로그인페이지</font></b>
                  </td>
                  </tr>
                  <tr><td>아이디 : </td><td><input type="text" name="siin_id" placeholder="username"></td></tr>
                  <tr><td>비밀번호 : </td><td><input type="password" name="siin_pw"></td></tr>
                  <tr>
                  <td colspan="2" align=center>
                  <input type="submit" value="로그인" onclick="fail_chk()"> <!-- 위의 form과 연동되어 loginProcess로 이동한다. -->
                  <a href ="signin.jsp">회원가입</a>  <!-- 회원가입을 누르면 a태그를 통해서 joinForm으로 이동한다. -->
              </td>
            </tr>
        </table>
    </center>
</form><br/><br/><br/>
<!-------아이디 찾기 컴포넌트------->
<form name="" action="findid.jsp" method="post">
    <center>
        <table border=1 style="width: 300px; height: 100px;">
             <tr>
                  <td colspan="2" align=center>
                  <b><font size=6>ID 찾기</font></b>
                  </td>
                  </tr>
                  <tr><td>이름 : </td><td><input type="text" name="fi_name" placeholder="username"></td></tr>
                  <tr><td>생년월일 : </td><td><input type="text" id="userdate" name="fi_birth"
                placeholder="ex) 960715"></td></tr>
                  <tr>
                  <td colspan="2" align=center>
                  <input type="submit" value="찾기"> <!-- 위의 form과 연동되어 이동한다. -->
              </td>
            </tr>
        </table>
    </center>
</form>
<br><br>

<%
String msg = "";
Cookie [] cookieArray = request.getCookies(); // 브라우저에서 전달된 모든 쿠키 저장
Cookie cookie = null;
int countNum = 0;
String countStr = "";
if(cookieArray != null) { // 브라우저에서 전달된 쿠키정보가 있다면
   for(int i = 0; i < cookieArray.length; i++) { // 전달된 모든 쿠키를 검사하며,
      if(cookieArray[i].getName().equals("counter")) { // “counter”란 이름의 쿠키정보를 찾아
         cookie = cookieArray[i]; // 저장하고
         break; // for문을 빠져나간다.
      }
   }
}
if(cookie != null) { // “counter”란 이름의 쿠키가 있으면
   countNum = Integer.parseInt(cookie.getValue()) + 1; // 값을 정수로 변환한 다음 1 증가한 후
   countStr = Integer.toString(countNum); // 다시 증가된 값을 문자열로 변환한 후
   cookie.setValue(countStr); // 'counter'란 이름의 쿠키값을 새롭게 설정한다.
   
}
else if(cookie == null){ // “counter”란 이름의 쿠키가 없으면
   cookie = new Cookie("counter", "1"); // counter란 이름으로 초기값 1인 쿠키를 생성한다.
   
}
response.addCookie(cookie); // 'counter'란 이름의 쿠키와 그 값을 클라이언트에 전달한다.
%>
<div align="center">
<%
if(Integer.parseInt(cookie.getValue())<5){
	//out.println("<script>");
	//out.println("alert(123);");
	//out.println("</script>");
	cookie.setMaxAge(5*60); //5분간
	out.println("<p><h3> - 로그인 남은 시도 횟수 : "+cookie.getValue()+" / 5회 - </h3></p>");
}else{
	out.println("<p><h3> - 5분간 로그인이 비활성화 되었습니다. - </h3></p>");
	out.println("<script>");
	out.println("alert('5분간 로그인이 비활성화 되었습니다.');location.href='http://192.168.177.136:8080/main.jsp';");
	out.println("</script>");
	
}
%>
</div>
<br/><br>

<div align="center">
<button onclick="location.href='main.jsp';">홈으로</button>
<button onclick="location.href='findpw.jsp';">PW찾기</button>
</div>
</body>
</html>