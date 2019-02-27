<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%
request.setCharacterEncoding("utf-8"); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" type="text/css" href="../main.css">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>게시판 목록</title>


<script type="text/javascript">
	function move(url){
		location.href=url;
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
	<marquee behavior="alternate" scrolldelay="100" direction="right">
		모의해킹용 홈페이지 입니다.</marquee>
	<p id="all_content">[ 총게시물 10개 ] 	</p>
	<%	 
	 

	 int sequence = 0;
     try{
	   ResultSet rs = null;
	   ResultSet rs2 = null;
       String driver = "oracle.jdbc.driver.OracleDriver";  
       Class.forName(driver);
 
       String url = "jdbc:oracle:thin:@192.168.232.1:1521:xe";
       String id = "testuser";
       String pw = "1234";
 
       Connection conn = DriverManager.getConnection(url, id, pw);
	   Connection conn2 = DriverManager.getConnection(url, id, pw);
       Statement st = conn.createStatement();
	   Statement st2 = conn2.createStatement();
	   String sql="";
	   String column_writer="WRITERB";
	   String column_title="TITLEB";
	   String column_content="CONTENTB";
	   try{ 
		   if(request.getParameter("col").equals("name")){ sql = "select * from noticeboard where 0 < ROWNUM  and ROWNUM < 15 and "+column_writer+" like '%"+request.getParameter("word")+"%' order by idxB desc"; }
	   
		}catch(Exception e){ 
			sql = "select * from noticeboard where 0 < ROWNUM  and ROWNUM < 20 order by idxB desc"; 
		}
		
		try{
			
			if(request.getParameter("col").equals("title")){ sql = "select * from noticeboard where 0 < ROWNUM  and ROWNUM < 15 and "+column_title+" like '%"+request.getParameter("word")+"%' order by idxB desc"; }
		}catch(Exception e){ 
			sql = "select * from noticeboard where 0 < ROWNUM  and ROWNUM < 20 order by idxB desc"; 
		}
		try{
			
			if(request.getParameter("col").equals("content")){ sql = "select * from noticeboard where 0 < ROWNUM  and ROWNUM < 15 and "+column_content+" like '%"+request.getParameter("word")+"%' order by idxB desc"; }
		}catch(Exception e){ 
			sql = "select * from noticeboard where 0 < ROWNUM  and ROWNUM < 20 order by idxB desc"; 
		}
		try{
			
			if(request.getParameter("col").equals("title_content")){ sql = "select * from noticeboard where 0 < ROWNUM  and ROWNUM < 15 and "+column_title+" like '%"+request.getParameter("word")+"%' or "+column_content+" like '%"+request.getParameter("word")+"%' order by idxB desc"; }
		}catch(Exception e){ 
			sql = "select * from noticeboard where 0 < ROWNUM  and ROWNUM < 20 order by idxB desc"; 
		}
	 
	   rs = st.executeQuery(sql); 
	   
	   
	   
	   		  String all_content="";
		  try{
		  String sql2 = "select count(*) from noticeboard";
		  rs2 = st2.executeQuery(sql2); 
		  while(rs2.next()) {
			  all_content = rs2.getString(1);
		  }
		  
		  }catch(SQLException e){}
%>
	<table  width="800" height="200" border="1" bgcolor="#FFFFFF">
		<colgroup>
			<col width="40" />
			<col width="480" />
			<col width="100" />
			<col width="220" />
		</colgroup>
		<thead>
			<tr>
				<th bgcolor=#CCCCCC>번 호</th>
				<th bgcolor=#CCCCCC>제 목</th>
				<th bgcolor=#CCCCCC>작성자</th>
				<th bgcolor=#CCCCCC>작성일</th>
				<th bgcolor=#CCCCCC>조 회</th>
			</tr>
		</thead>
		<tbody>
		<%
		int seq_max = Integer.parseInt(all_content);
		sequence = seq_max+1;
		while(rs.next()) {
			sequence -= 1;
			
			String idx = rs.getString("idxB");
			String title = rs.getString("titleB");
			String username = rs.getString("writerB");
			String year_day = rs.getString("dateB");
			String month_day=year_day.replaceFirst("-", "년");
			String day_day=month_day.replaceFirst("-", "월");
			String dday=day_day.replaceFirst(" ", "일");
			String day=dday.replaceFirst("일", "일 ");
			String hit = rs.getString("hitB");
		%>
			<tr>
				<td align="center"><a href="Board_View.jsp?num=<%=idx%>"><%=sequence %></a></td>
				<td><a href="Board_View.jsp?num=<%=idx%>"><%=title %></a></td>
				<td align="center"><a href="Board_View.jsp?num=<%=idx%>"><%=username %></a></td>
				<td align="center"><font size="2px"><%=day %></font></td>
				<td align="center"><%=hit %></td>
			</tr>

<%
		}
	

%>
<script>
document.getElementById("all_content").innerHTML = "<p><b>[ 총게시물 "+<%= all_content%>+" 개 ]</b></p>";
</script>
	
			
		</tbody>
		<tfoot>
			<tr>
				<td align="center" colspan="5">1</td>
			</tr>
			
		</tfoot>	
		
	</table>		<br/><br/>
	
		
			<FORM name='frm' method='GET' action='' accept-charset="utf-8">				
					<SELECT name='col'> <!-- 검색 컬럼 -->
						<OPTION value='name'>작성자</OPTION>
						<OPTION value='title'>제목</OPTION>
						<OPTION value='content'>내용</OPTION>
						<OPTION value='title_content'>제목+내용</OPTION>
					</SELECT>
				<input type='text' name='word' value='' placeholder="특수문자 X" >
				<button type='submit'>검색</button>     
				
			</FORM>
		


	 <%
		  
	 } catch (SQLException e){}
  if(session.getAttribute("id") == null){
  %>
  <input id="btn-world" type="button" value="글쓰기 권한이 부족합니다." style="width:1000px;height:50px;font-size:15px;"/>
  <%
  }else{
  %>
  <input id="btn-hello" type="button" value="글쓰기" onclick="move('Board_Write.jsp');" style="width:1000px;height:50px;font-size:30px;" />
  <%
  
  }
  %>
  <script>
var btn = document.getElementById('btn-world');
btn.disabled = 'disabled';
</script>
		
		</div>
	 </div>
						<!--<div align="center" id="footer">footer area</div>-->
</div>
</body>
</html>