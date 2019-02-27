<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>답변</title>
	<link rel="stylesheet" type="text/css" href="../main.css">


<script type="text/javascript">
	function move(url) {
		location.href=url;
	}
	function boardReplyCheck() {
		var form = document.BoardReplyForm;
		return true;
	}
</script>
</head>

<body>
	<script>
		setTimeout(function(){ alert("현재 답글달기는 기능 작업중입니다.");location.href='/notice/Board_List.jsp'; }, 100);
		</script>
<div id="container">
	<div id="header">
		<span class="style1"><%@ include file="../login.jsp"%></span>
	</div>
		<%@ include file="../left.jsp"%>
							<!--<div id="sidebar">right area</div>-->
	<div id="content">
	<table summary="전체 테이블 구성">
 	<tr>
  		<td height=25 align=center><h1>답변달기</h1></td>
 	</tr>
	</table><br>

	<table summary= "답변 테이블 구성">
	<form name="BoardReplyForm" method="post" action="Board_Reply_action.jsp" 
														onsubmit="return boardReplyCheck();" >
 	<tr>
		<td>
		<table border=0 width=100% align=center>
	    <tr>
			<td align="center">작성자</td>
			<td ><input type=text name=name size=10 maxlength=8></td>
    	</tr>
    	<tr>
	 		<td align="center">E-Mail</td>
	 		<td><input type=text name=email size=30 maxlength=30></td>
    	</tr>
    	<tr>
			<td align="center">홈페이지</td>
			<td><input type=text name=homepage size=40 maxlength=30></td>
	    </tr>
		<tr>
			<td width=10% align="center">제 목</td>
			<td width=50%><input type=text name=title size=50 maxlength=30 value="RE : 게시판 글입니다."></td>
		</tr>
		<tr>
			<td width=10% align="center">내 용</td>
			<td><textarea name=content rows=10 cols=70> 가나다라마바사

----------------------------------------------

|댓글|

		</textarea></td>
		</tr>
		<tr>
			<td width=10% align="center">비밀 번호</td> 
			<td width=70% ><input type=password name="password" size=15 maxlength=15></td>
		    </tr>
		<tr>
			<td colspan=2><hr size=2></td>
		</tr>
		<tr>
			<td colspan="3" align="center">
			<input type="submit" value="답변 등록" class="btn" >&nbsp;
			<input type="button" value="뒤로가기" onclick="javascript:history.back()">
			</td>
		</tr> 
		</table>
		</td>
		</tr>
		</form> 
	</table>
	</div>
	</div>
</body>
</html>