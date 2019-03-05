<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
<link rel="stylesheet" type="text/css" href="../main.css">

<script type="text/javascript">
	function move(url) {
		location.href=url;
	}
	function boardWriteCheck() {
		var form = document.BoardWriteForm;
		return true;
	}
</script>
</head>

<body>
<div id="container">
	<div id="header">
		<span class="style1"><%@ include file="../login.jsp"%></span>
	</div>
		<%@ include file="../left.jsp"%>
							<!--<div id="sidebar">right area</div>-->
	<div id="content">
	<table summary="글쓰기 전체 테이블">
		<form name="BoardWriteForm" method="post" action="/notice/Board_Write_action.jsp" enctype="Multipart/form-data">
		
   		<colgroup>
   			<col width="20%">
   			<col width="80%">
   		</colgroup>
   	

		<table summary="테이블 구성" >
		<caption>게시판 글쓰기</caption>	
    		<tr>
				<td>작성자</td>
				<td><%=session.getAttribute("name") %><input type=hidden name=name size=10 maxlength=8></td>
				<!--<td><input type=hidden name=isAction value="write"/></td>-->
			</tr>
			<tr>
	 			<td>E-Mail</td>
	 			<td><%=session.getAttribute("email") %><input type=hidden name=email size=30></td>
    		</tr>
    		<tr>
     			<td>첨부파일</td>
     			<td><input type="file" name="attach" /></td>
				    
    		</tr>
    		<tr>
     			<td>제 목</td>
     			<td><input type=text name=title value=""></td>
    		</tr>
    		<tr>
     			<td>내 용</td>
     			<td><textarea name=content rows ="10" cols="100" value=""></textarea></td>
    		</tr>
    		<tr>
     			<td>비밀번호</td> 
     			<td><input type=password name=password value="" size=15 maxlength=15></td>
    		</tr>
    		<tr>
     			<td colspan=2><hr size=1></td>
    		</tr>
    		<tr>
     			<td colspan="2"><div align="center">
     			<input type="submit" value="등록" >&nbsp;&nbsp;
         		<input type="button" value="뒤로" onclick="move('Board_List.jsp');"></div>
     			</td>
    		</tr> 
		</table>
	</form> 
</table>
</div>
</div>
</body>
</html>