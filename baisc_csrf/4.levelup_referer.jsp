<html>
<body>

<table width="800" height="700" border="1" cellpadding="2" cellspacing="0" align=center>
<tr>
<!-- left -->
<td rowspan="2" width="200" height="700">
<table>
<tr><td width="200" height="100"><center><img src="/lhs/img/logo.jpg" width="200" height="100"></center></td></tr>
<tr><td width="200" height="300"> 로그인 안하고 보이는 텍스트 1</td></tr>
<tr><td width="200" height="300"> 로그인 안하고 보이는 텍스트 2</td></tr>
</table>
</td>
<!-- top -->
<td width="600" height="100">
<html>
<table>
<tr>
<td width="200" align="center"><a href="/lhs/main.jsp">메인</td>
<td width="200" align="center"><a href="/lhs/board/boardList.jsp">게시판</td>
<td width="200" align="center"><a href="/lhs/join/update.jsp">정보수정</td>
<td width="200" align="center"><a href="/lhs/login/logout.jsp">로그아웃</td>
</tr>
</table>
</html>
</td>
</tr>
<tr>
<td width="600" height="600">
<!-- main -->

<form name="id_search" action="./4.levelup_referer.jsp" method="post">
<center>
관리자 전용 :: 권한 수정 페이지(REFERER)<br><br><br><br>
ID <input name="id" type="text" value="">
<input type="submit" value="검색"><p>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
</form>
<form id="levelup" name="levelup" action="./4.levelup_referer_Process.jsp" method="post">
<input name="rid" type="hidden" value="">
<table border="1" summary="ID 목록">
<colgroup>
<col width="150" />
<col width="150" />
<col width="50" />
<col width="50" />
</colgroup>
<thead>
<tr>
<th>ID</th>
<th>이름</th>
<th>현재권한</th>
<th>수정권한</th>
</tr>
</thead>
<tbody>

<tr>
<td align="center" colspan="7">등록된 ID가 없습니다..</td>
</tr>
</tbody>
</table><p>
<input type="submit" value="수정">

</form>





<!-- end main -->
</td>
</tr>



</body>
</html>