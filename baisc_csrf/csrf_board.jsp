<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
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


<script language="javascript" src="../js/board.js"></script>
<form name="searchForm" action="boardList11.jsp" method="get" >
<p>

<center>
<input type="text" name="searchText" value="" />
<input type="submit" value="제목 검색" />	</center>
</p>


</form>
<table border="1" summary="게시판 목록">
<caption>게시판 목록</caption>
<colgroup>
<col width="50" />
<col width="50" />
<col width="210" />
<col width="50" />
<col width="70" />
<col width="100" />
<col width="70" />
</colgroup>
<thead>
<tr>
<th>번호</th>
<th>카테고리</th>
<th>제목</th>
<th>첨부파일</th>
<th>작성자</th>
<th>등록 일시</th>
<th>조회수</th>
</tr>
</thead>
<tbody>
<tr>
<td align="center">5</td>
<td align="center">Free</td>
<td><a href="boardView11.jsp?num=5">확인하2</a></td>
<td align="center">-
</td>
<td align="center">tammna </td>
<td align="center">2019-03-05</td>
<td align="center">2</td>
</tr>
<tr>
<td align="center">4</td>
<td align="center">Free</td>
<td><a href="boardView11.jsp?num=4">확인하</a></td>
<td align="center">-
</td>
<td align="center">tammna </td>
<td align="center">2019-03-05</td>
<td align="center">3</td>
</tr>
</tbody>

</table>
<p>
<input type="button" value="목록" onclick="goUrl('boardList11.jsp');" />
<input type="button" value="글쓰기" onclick="goUrl('boardWrite11.jsp');" />
</p>


<!-- end main -->
</td>
</tr>

</body>
</html>