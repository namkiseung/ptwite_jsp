<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");   
	 String del_view = request.getParameter("view");	 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 삭제하기</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

body {
	font-family: 'Nanum Gothic', sans-serif;
}
</style>

<script type="text/javascript">
	function move(url) {
		location.href=url;
	}
	function boardDeleteCheck() {
		var form = document.BoardDeleteForm;
		return true;
	}
</script>
</head>

<body>
	<center>
	<br><br>
	<table width=50% cellspacing=0 cellpadding=3>
 		<tr>
			<td bgcolor=#dcdcdc height=21 align=center>
			작성자의 비밀번호를 입력해 주세요.</td>
		</tr>
	</table>
	
	<table width=70% cellspacing=0 cellpadding=2>
		<form name="BoardDeleteForm" method="post" action="Board_Delete_action.jsp" 
														onsubmit="return boardDeleteCheck();" >
 	<tr>
		<td align=center>
		<table align=center border=0 width=91%>
		<input type="hidden" name="del_content" value="<%=del_view %>"/>
    <tr> 
     	<td align=center>  
	  	<input type=password name="password" size=17 maxlength=15>
	 	</td> 
    </tr>
    <tr>
		<td><hr size=1 color=#eeeeee></td>
	</tr>
    <tr>
		<td align=center>
		<input type="submit" value="삭제완료" >
		<input type=button value="뒤로" onClick="history.go(-1)">
		</td>
	</tr> 
	</table>
	</td>
	</tr>
	</form> 
	</table>
	</center>
</body>
</html>