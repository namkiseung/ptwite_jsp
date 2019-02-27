<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
 <!-------기본 로그인 컴포넌트------->
<form name="loginform" action="login_chk.jsp" method="post">
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
                  <input type="submit" value="로그인"> <!-- 위의 form과 연동되어 loginProcess로 이동한다. -->
                  <a href ="signin.jsp">회원가입</a>  <!-- 회원가입을 누르면 a태그를 통해서 joinForm으로 이동한다. -->
              </td>
            </tr>
        </table>
    </center>
</form><br/><br/><br/>

<!-------패스워드 찾기 컴포넌트------->
<form action="sendMail.jsp" method="post">
	<center>
            <table border=1 style="width: 300px; height: 100px;">
                <tr><th colspan="2"><b><font size=6>PW 재설정</font></b></th></tr>
                <tr><td>이메일</td><td><input type="text" name="from" placeholder="email"/></td></tr>
                <tr><td>이름</td><td><input type="text" name="to" placeholder="username"/></td></tr>
                <tr><td colspan="2" style="text-align:right;"><input type="submit" value="전송"/></td></tr>
			</table>
			<span>이메일을 통해 비밀번호를 재설정하세요.</span><br/><br/><br/><br/>
	</center>
</form>
<div align="center">
<button onclick="location.href='main.jsp';">홈으로</button>
<button onclick="location.href='ologin.html';">ID찾기</button>
</div>
</body>
</html>