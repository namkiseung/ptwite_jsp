<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
	<title>회원가입</title>
	<link rel="stylesheet" type="text/css" href="signup.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body style="background-color:#FFFFFF">
 <center>
 <h1> 회원가입</h1>
 <table bgcolor = "#bbbbbb" cellspacing = "1" >
 <FORM name="signup_form" action="/daum_api_signin/signin_chk.jsp" method="post">
  <tr>
   <td text-align="center" placeholder="userid">아이디 </td>
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
   <td> <input type = "text" name="siup_name" placeholder="username"/> </td>
  </tr>
  <tr>
   <td> 이메일 </td>
   <td>
    <input type = "text" name="siup_email"/> @ <input type = "text" name="siup_domain"/> &nbsp;&nbsp; 
   </td>
  </tr>
  <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
  <script type="text/javascript" src="daum_api_map.js"></script>
  <tr>
   <td> 주소 </td>
   <td>
    
	<input type="text" name="siup_zip" style="width:60px; height:20px;" placeholder="zip code"/>
    <input type="text" name="siup_addr1" style="width:250px; height:20px;" placeholder="addr" readonly />
	<input type = "button" value = "주소찾기" onclick="openZipSearch()"/><br>
    <input type="text" name="siup_addr2" style="width:330px; height:20px;" placeholder="detail of addr"/>
    
   </td>
  </tr>
  <tr>
   <td> 생년월일 </td>
   <td>
    <input type = "text" name="siup_birth" size = "10" placeholder="ex) 870102"/>
	&nbsp;*앞 6자리
   </td>
  </tr>
 
</table>
<br/>
<input type="submit" value="가입하기"/>
<input type="reset" value="다시 입력"/>
</FORM>
<button onclick="location.href='/daum_api_signin/main.jsp'">홈</button>
</center>


</body>
</html>