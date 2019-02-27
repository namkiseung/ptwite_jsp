<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
	<title>회원 정보 수정</title>
	<link rel="stylesheet" type="text/css" href="signup.css">
</head>
<body style="background-color:#FFFFFF">

 <center>
 <h1> 회원 정보 수정</h1>
 <table bgcolor = "#bbbbbb" cellspacing = "1" >
 <FORM name="signup_form" action="profile_edit_chk.jsp" method="post">
 <tr>
   <td>가입날짜 </td>
   <td> 
   <label><%=session.getAttribute("joindate")%></label>
   </td>
  </tr>
  <tr>
   <td>아이디 </td>
    <input type = "hidden" name="siup_id" value="<%=session.getAttribute("id")%>"/>
   <td> 
   <label><%=session.getAttribute("id")%></label>
   </td>
  </tr>
  <tr>
   <td> 기존 비밀번호 </td>
   <td> <input type = "password" name="siup_pw_old"/><input type = "hidden" name="siup_pw_session" value="<%=session.getAttribute("id")%>"/></td>
  </tr>
  <!--<tr>
   <td> 비밀번호 </td>
   <td> <input type = "password" name="siup_pw_new"/></td>
  </tr>
  <tr>-->
   <td> 성명 </td>
   <td> <input type = "text" name="siup_name"/ value="<%=session.getAttribute("name")%>"> </td>
  </tr>
  <tr>
   <td> 이메일 </td>
   <td>
    <input type = "text" name="siup_email" value="<%=session.getAttribute("email")%>"/> 
   </td>
  </tr>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
  <tr>
   <td> 주소 </td>
   <td>
    <input type="text" name="siup_addr" value="<%=session.getAttribute("address")%>" style="width:190px; height:20px;" />
   </td>
  </tr>
  <tr>
   <td> 생년월일 </td>
   <td>
   <input type = "text" name="siup_birth" value="<%=session.getAttribute("birth")%>"/>
	&nbsp;*앞 6자리
   </td>
  </tr>
 
</table>

<br/>
<input type="submit" value="수정완료"/>
<input type="reset" value="다시 입력"/>
</FORM>
<button onclick="location.href='main.jsp'">메인으로</button>
</center>
</body>
</html>