<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>
<%
request.setCharacterEncoding("utf-8"); 
java.util.Calendar cal = java.util.Calendar.getInstance();
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
		베스트 TOP 10</marquee>
	<p id="all_content">[ 총게시물 10개 ] 	</p>
	<%	 
	
	 final int ROWSIZE = 4; // 한페이지에 보일 게시물 수 
	 final int BLOCK = 5; // 아래에 보일 페이지 최대개수 1~5 / 6~10 / 11~10 식으로 5개로 고정 
	 int pg = 1; //기본 페이지값 
	 if(request.getParameter("pg")!=null) { //받아온 pg값이 있을때, 다른페이지일때 
		pg = Integer.parseInt(request.getParameter("pg")); // pg값을 저장 
	 } 
	 int _start = (pg*ROWSIZE) - (ROWSIZE-1); // 해당페이지에서 시작번호(step2) 
	 int _end = (pg*ROWSIZE); // 해당페이지에서 끝번호(step2) 
	 _start +=1;
	 int allPage = 0; // 전체 페이지수 
	 int startPage = ((pg-1)/BLOCK*BLOCK)+1; // 시작블럭숫자 (1~5페이지일경우 1, 6~10일경우 6) 
	 int endPage = ((pg-1)/BLOCK*BLOCK)+BLOCK; // 끝 블럭 숫자 (1~5일 경우 5, 6~10일경우 10)
	 if (pg==1){
		 _start=0;
		 _end=5;
	 }else if(pg==2){
		 _start=5;
		 _end=10;
	 }else if(pg==3){
		 _start=10;
		 _end=10;
	 }

	 int sequence = 0;
	 int seq_max = 0;
     try{
	   ResultSet rs = null;
	   ResultSet rs2 = null;
       String driver = "oracle.jdbc.driver.OracleDriver";  
       Class.forName(driver);
 
       String url = "jdbc:oracle:thin:@192.168.177.135:1521:xe";
       String id = "testuser";
       String pw = "1234";
 
       Connection conn = DriverManager.getConnection(url, id, pw);
	   Connection conn2 = DriverManager.getConnection(url, id, pw);
       Statement st = conn.createStatement();
	   Statement st2 = conn2.createStatement();
	   
	   String column_writer="WRITERB";
	   String column_title="TITLEB";
	   String column_content="CONTENTB";
	   
	   String sql = "";
	   
	   //select * from noticeboard n full outer join qnaboard q on not n.idxb is null and not q.idxq is null;
	   //정렬 조건 : 히트 | 작성일
	   if(request.getParameter("col") != null && request.getParameter("word") != null){
		  String subject_search = request.getParameter("col");
		  String search_word = request.getParameter("word");
		  if(subject_search.equals("name")){ 
			sql = "select * from noticeboard where 0 < ROWNUM  BETWEEN ROWNUM < 10 BETWEEN "+column_writer+" like '%"+search_word+"%' order by idxB desc"; 
		  }else if(subject_search.equals("title")){ 
			sql = "select * from noticeboard where 0 < ROWNUM  BETWEEN ROWNUM < 10 BETWEEN "+column_title+" like '%"+search_word+"%' order by idxB desc"; 
		  }else if(subject_search.equals("content")){ 
			sql = "select * from noticeboard where 0 < ROWNUM  BETWEEN ROWNUM < 10 BETWEEN "+column_content+" like '%"+search_word+"%' order by idxB desc"; 
		  }else if(subject_search.equals("title_content")){ 
			sql = "select * from noticeboard where 0 < ROWNUM  BETWEEN ROWNUM < 10 BETWEEN "+column_title+" like '%"+search_word+"%' or "+column_content+" like '%"+search_word+"%' order by idxB desc"; 
		  }
	   }else{
		  
			//sql="select idxB, titleB, emailB, contentB, passB, hitB, attachB, dateB from noticeboard union all select idxQ, titleQ, emailQ, contentQ, passQ, hitQ, attachQ, dateQ from qnaboard WHERE ROWNUM > 0 BETWEEN ROWNUM < 9";
				
			if(request.getParameter("search") != null && request.getParameter("search").equals("date")){
				sql="select * from noticeboard union all select * from QNABOARD order by 9 desc";
				
			}else if(request.getParameter("search") != null && request.getParameter("search").equals("hit")){
				sql="select * from noticeboard union all select * from QNABOARD order by 7 desc";
				
			}else{
				sql="select * from noticeboard union all select * from QNABOARD";
			}
	   }
	   
	   
	   //out.println(sql);
	   //out.println(request.getParameter("search"));
	   
	   rs = st.executeQuery(sql); 
	   
	   
	    String sql3=""; //old
	   	String total="0";
		int int_total=0;
		  try{
		    String sql2 = "select count(*) from noticeboard union all select count(*) from QNABOARD";
		    rs2 = st2.executeQuery(sql2); 
		    while(rs2.next()) {
			  int_total += Integer.parseInt(rs2.getString(1));
			  
		    }
		  total = String.valueOf(int_total);
		  
		  }catch(Exception e){ out.println(e.getMessage()); }
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
		seq_max = Integer.parseInt("10");
		sequence = seq_max+1;
		int break_num=0;
		while(rs.next()) {
			sequence -= 1;
			break_num+=1;
			if(break_num>10){break;}
			String idx = rs.getString(1); //idx
			String title = rs.getString(2);  //title
			String username = rs.getString(3); //writerB
			String year_day = rs.getString(9); //date
			String month_day=year_day.replaceFirst("-", "년");
			String day_day=month_day.replaceFirst("-", "월");
			String dday=day_day.replaceFirst(" ", "일");
			String day=dday.replaceFirst("일", "일 ");
			String hit = rs.getString(7);  //hitB			
		%>
			<tr>
				<td align="center"><a href="Board_View.jsp?num=<%=idx%>"><%=sequence %></a></td>
				<td><a href="Board_View.jsp?num=<%=idx%>"><%=title %>
				<%
				if(day.substring(8,10).equals(String.valueOf(cal.get(java.util.Calendar.DATE)))){
					out.println("<img src='http://192.168.177.136:8080/new.jpg' /");
				}
				%></a></td>
				<td align="center"><a href="Board_View.jsp?num=<%=idx%>"><%=username %></a></td>
				<td align="center"><font size="2px"><%=day %></font></td>
				<td align="center"><%=hit %></td>
			</tr>
<%
		}
%>
<script>
document.getElementById("all_content").innerHTML = "<p><b>[ 총게시물 "+<%= total%>+" 개 ] </b></p><p> [정렬] <a href='http://192.168.177.136:8080/best_content/Best_List.jsp?search=date'>날짜별</a> | <a href='http://192.168.177.136:8080/best_content/Best_List.jsp?search=hit'>조회수별</a></p>";
</script>			
		</tbody>
		<tfoot>
		</tfoot>	
	</table>		<br/>
	<br/>
		
			<FORM name='frm' method='GET' action='' accept-charset="utf-8" style="width:800px;height:22px;">				
					<SELECT name='col'> <!-- 검색 컬럼 -->
						<OPTION value='name'>작성자</OPTION>
						<OPTION value='title'>제목</OPTION>
						<OPTION value='content'>내용</OPTION>
						<OPTION value='title_content'>제목+내용</OPTION>
					</SELECT>
				<input type='text' name='word' value='' placeholder="특수문자 X" style="width:200px;height:22px;">
				<button type='submit'>검색</button>     
				
			</FORM>
		


	 <%
		  
	 } catch (SQLException e){out.println(e.getMessage());}finally{}
  if(session.getAttribute("id") == null){
  %>
  <input id="btn-world" type="button" value="로그인이 필요합니다." style="width:1000px;height:50px;font-size:10px;"/>
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