<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
	<title>회원가입</title>
	<link rel="stylesheet" type="text/css" href="signup.css">
</head>
<body style="background-color:#FFFFFF">
 <center>
 <h1> 회원가입</h1>
 <table bgcolor = "#bbbbbb" cellspacing = "1" >
 <FORM name="signup_form" action="loginProcess.jsp" method="post">
  <tr>
   <td text-align="center">아이디 </td>
   <td> 
   <input type = "text" name="siup_id"/>
   <input type = "button" value = "중복확인"/>
   </td>
  </tr>
  <tr>
   <td> 비밀번호 </td>
   <td> <input type = "password"/> </td>
  </tr>
  <tr>
   <td> 비밀번호 확인 </td>
   <td> <input type = "password" name="siup_pw"/>&nbsp;*비밀번호 재입력 </td>
  </tr>
  <tr>
   <td> 성명 </td>
   <td> <input type = "text" name="siup_name"/> </td>
  </tr>
  <tr>
   <td> 이메일 </td>
   <td>
    <input type = "text" name="siup_email"/> @ <input type = "text" name="siup_domain"/> &nbsp;&nbsp; 
   </td>
  </tr>
  <tr>
   <td> 주소 </td>
   <td>
    <input type = "text" name="siup_addr"/>
    <input type = "button" value = "주소찾기"/>
   </td>
  </tr>
  <tr>
   <td> 생년월일 </td>
   <td>
    <input type = "text" name="siup_birth" size = "10"/>
	&nbsp;*앞 6자리
   </td>
  </tr>
 
</table>
<br/>
<input type="submit" value="가입하기"/>
<input type="reset" value="다시 입력"/>
</FORM>
</center>
</body>
</html>