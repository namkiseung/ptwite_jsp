<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");   
	 String data_num = request.getParameter("num");	 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../main.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 읽기</title>
<script type="text/javascript">
	function move(url, num) {
		location.href="http://192.168.56.1:8080/qna/"+url+num;
	}
	function movelist(url) {
		location.href="http://192.168.56.1:8080/qna/"+url;
	}
	function update_move(url, username, day , email, attach, title, content, num) {
		var params = new Object();
		params.username = username;
		params.day = day;
		params.email = email;
		params.attach = attach;
		params.title = title;
		params.content = content;
		params.num = num;
		method = "post"; // Set method to post by default, if not specified.
    // The rest of this code assumes you are not using a library.
    // It can be made less wordy if you use one.
    var form = document.createElement("form");
    form.setAttribute("method", method);
    form.setAttribute("action", url);
	form.setAttribute("accept-charset", "utf-8");
	
    for(var key in params) {
		console.log(key);
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", key);
        hiddenField.setAttribute("value", params[key]);
        form.appendChild(hiddenField);
    }
	
    document.body.appendChild(form);
    form.submit();

		
	}
	function boardViewCheck() {
		var form = document.BoardViewForm;
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
<%	 
     
     try{
	   ResultSet rs = null;
       String driver = "oracle.jdbc.driver.OracleDriver";  
       Class.forName(driver);
 
       String url = "jdbc:oracle:thin:@192.168.232.1:1521:xe";
       String id = "testuser";
       String pw = "1234";
 
       Connection conn = DriverManager.getConnection(url, id, pw);
       Statement st = conn.createStatement();
       String sql = "select * from QNABOARD where idxQ="+data_num;
	   String sql_plusHit = "update QNABOARD set hitQ = (select hitQ+1 from QNABOARD where idxQ="+data_num+") where idxQ="+data_num;
	   st.execute(sql_plusHit);
       rs = st.executeQuery(sql);      
%>
	<form name="BoardViewForm" method="post" action="Qna_Write_action.jsp">
	<table summary="전체 테이블 구성">
	<tr>
		<td ><div align="center"><h3><b>글 읽기</b></h3></div></td>
	</tr>
	<%
		while(rs.next()) {
			
			String title = rs.getString("titleQ");
			String username = rs.getString("writerQ");
			String day = rs.getString("dateQ");
			String email = rs.getString("emailQ");
			String content = rs.getString("contentQ");
			String attach = rs.getString("attachQ");
			String hit = rs.getString("hitQ");
		%>
	<tr>
		<td colspan=2>
		<table border="1" summary="목록 테이블 구성"> 
    <tr> 
		<td align=center bgcolor=#dddddd width=30%> 작성자</td>
		<td bgcolor=#ffffe8 width=40%><%=username %></td>
		<td align=center bgcolor=#dddddd width=50%> 작성일</td>
		<td bgcolor=#ffffe8 width=40%><%=day %></td>
	</tr>
    <tr>
		<td align=center bgcolor=#dddddd> E-mail </td>
		<td bgcolor=#ffffe8 ><%=email %></td> 
		<td align=center bgcolor=#dddddd> 첨부파일 </td>
		<td bgcolor=#ffffe8><a id="downA" href="http://192.168.56.1:8080/qna/Board_fileDown.jsp?file_name=<%=attach %>"><%=attach %></a></td> <!-- <a href="http://namkisec.tistory.com" target="_new">http://namkisec.tistory.com</a> -->
	</tr>
	<tr> 
		<td align=center bgcolor=#dddddd> 제 목</td>
		<td bgcolor=#ffffe8 colspan=3><%=title %></td>
   </tr>
   <tr> 
		<td colspan=4><br><%=content %><br></td>
   </tr>
   <tr>
		<td colspan=4 align=right> 조회수  : <%=hit %></td>
   </tr>
	</table>
	</td>
 	</tr>

	<tr>
		<td align=center colspan=2> 
		<hr size=1>
		<div align="center">
		<%
		//if(session.getAttribute("id") != null && session.getAttribute("name").equals(username)){
		%>
		[ <input type="button" value="목록" onclick="movelist('Qna_List.jsp');"> | 
		<input type="button" value="수정" onclick="update_move('Qna_Update.jsp', '<%=username %>','<%=day %>','<%=email %>','<%=attach %>','<%=title %>',' <%=content %>', <%=data_num%>);"> |
		<input type="button" value="답변" onclick="movelist('Qna_Reply.jsp');"> |
		<input type="button" value="삭제" onclick="move('Qna_Delete.jsp?view=', '<%=data_num%>');">]<br>
		<%
		//}else{
		%>
		[ <input type="button" value="목록" onclick="movelist('Qna_List.jsp');"> | 
		<input type="button" value="답변" onclick="movelist('Qna_Reply.jsp');"> ]
		
		<%
		//}
		%>
		</div>
		</td>
	</tr>
	</table>
</form>
	<%
		}
} catch (SQLException e){}
%>	
</div>
</div>
</body>
</html>