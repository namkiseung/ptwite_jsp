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
 <FORM name="signup_form" action="signin_chk.jsp" method="post" onSubmit="return post_check();">
  <tr>
   <td>아이디 </td>
   <td> 
   <input type = "text" name="siup_id" onkeydown="idputIdChk;" placeholder="userid" readonly />
   <input type = "hidden" name="idDuplication" id="idDuplication" value="idUncheck" />
   <input type = "button" value = "중복확인" onclick="duplication()" > <!-- https://all-record.tistory.com/147?category=733042-->
   </td>
  </tr>
   <tr>
   
   <td> 비밀번호 </td>
   <td> <input type = "password" name="siup_pw2" id="siup_pw2"/> </td>
  </tr>
  <tr>
   <td> 비밀번호 확인 </td>
   <td> <input type = "password" name="siup_pw" id="siup_pw"/>&nbsp;*비밀번호 재입력 </td>
  </tr>
  <tr>
   <td> 성명 </td>
   <td> <input type = "text" name="siup_name" placeholder="username"/> </td>
  </tr>
  <tr>
   <td> 이메일 </td>
   <td>
    <input type = "text" name="siup_email" placeholder="email ID"/> @ <input type = "text" name="siup_domain" placeholder="naver.com"/> &nbsp;&nbsp; 
   </td>
  </tr>
  <script>
  function checkPost()
{
window.open("checkPost.jsp","","width=500 height=500 scrollbars=yes");
}
</script>
 
  <tr>
   <td> 주소 </td>
   <td>
    
	<input type="text" name="siup_zip" style="width:60px; height:20px;" placeholder="zip code" readonly />
    <input type="text" name="siup_addr1" style="width:250px; height:20px;" placeholder="addr" readonly />
	<input type = "button" value = "주소찾기" onclick="checkPost()"/><br>
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
<button onclick="location.href='main.jsp'">홈</button>
</center>

<script>
//참고 https://all-record.tistory.com/147?category=733042
function duplication(){
 window.name="parentForm";
 window.open("IdCheckForm.jsp", "chkForm", "width=500, height=300, resizable=no, scrollbars = no");
}
function idputIdChk(){
 document.getElementById("idDuplication").value = "idUncheck";
 
}
function post_check(){
	if(document.getElementById("siup_pw").value != document.getElementById("siup_pw2").value){
		alert("비밀번호 확인!");
		return false;
	}
	if(document.getElementById("idDuplication").value != "idCheck"){
		alert("Id 중복체크 하기!!");
		return false;
	}
	
}
</script>
</body>
</html>