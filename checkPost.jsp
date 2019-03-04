<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
							<%!
							Connection conn; // 디비 연결 변수
							PreparedStatement pstmt; // 쿼리 핸들 변수
							ResultSet rs; // 결과를 받아올 변수
							public void init() //Call Back메소드, 드라이버 로딩
							{
							try {Class.forName("oracle.jdbc.driver.OracleDriver");} // 드라이버 로딩
							catch (ClassNotFoundException e) {e.printStackTrace(); } // 드라이버 클래스가 없는 예외 발생시 오류 출력
							} 
							public void setConnection() // 디비 입출력전 연결 메소드
							{
							try{conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.177.135:1521:xe", "testuser", "1234");} // 디비 연결
							catch (SQLException e) {e.printStackTrace();} // 예외상황발생시 오류 출력
							}
							%><%
								//1. 데이터 받아오기
								request.setCharacterEncoding("UTF-8");
								String dong = request.getParameter("dong");
								//2. db-select
								try
								{
								this.setConnection(); // 접속
								String sql = "select * from big_juso where seq_juso4 like '%" +dong + "%'"; // 동으로 검색하여 레코드를 가져 옵니다
								pstmt = conn.prepareStatement(sql); // 핸들을 생성하고 쿼리문을 등록합니다
								rs = pstmt.executeQuery(); // resultset에 내용을 담아 옵니다
								}
								catch(SQLException e){e.printStackTrace();}
								%>
								<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
								<html>
								<head>
								<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
								<title>Insert title here</title>
								<script>
									
										// 우편번호 검색 창이 닫힐때 수행할 내용
										function checkPostClose(zipcode, address)
										{
										opener.signup_form.siup_zip.value = zipcode; // 회원가입폼에 우편번호값 입력
										opener.signup_form.siup_addr1.value = address; // 회원가입폼에 첫번째 주소값 입력
										window.close(); // 창 종료
										opener.signup_form.siup_addr2.focus(); // 회원가입폼의 두번째 주소박스에 커서이동
										}
										// 찾기 버튼 입력시 수행될 내용
										function checkSearch()
										{
										if(document.checkPostForm.dong.value =="")alert("동을 입력해주세요");
										else document.checkPostForm.submit();
										}
									</script><!-- 스타일 지정 --><style>
										body {font-size:12pt} // 본문 폰트
										th {font-size:9pt} // 제목 폰트
										td {font-size:9pt} // 칸 폰트
										a:link {color:black; text-decoration:none} // 링크 연결된 텍스트색
										a:visited {color:black; text-decoration:none} // 방문했던 텍스트 색
										a:hover {color:red; text-decoration:underline} // 마우스 오버시 텍스트 색
										a:active {color:red; text-decoration:none} // 실행시 텍스트 색
									</style>
									</head>
									<body><!--submit 실행시 checkPost.jsp로 되돌아 갑니다.-->
									<form name="checkPostForm" method="post">
									<h5><span>지역선택시 <b>(광주, 대구, 세종, 제주 지역)</b>외 작업중</span></h5>
									<center>동입력 : 
											<!-- 동 입력 상자 --><input type="text" style=ime-mode:active; name="dong"></input><!-- 검색 버튼 -->
											<input type="button" name="search" value="검색" onClick="javascript:checkSearch()">
											</input><br></br><!--출력테이블-->
											<table border="1" width="100%">
											<th width="20%">우편번호</th>
											<th>주소</th>
											
											<%
			
														// 값이 있는 경우 출력
														try
														{
														while(rs.next()){
														// 가져온 각 필드의 데이터를 한문장의 스트링으로 변환
														String address= rs.getString("seq_juso2") + " " +
														rs.getString("seq_juso3") + " " +
														rs.getString("seq_juso4");
														
														if(rs.getString("seq_juso2") != null)address += rs.getString("seq_juso2"); // 회원가입폼의 주소1 란을 위한 변수
														String address2=address;
														if(rs.getString("seq_juso7") != null)address2 += rs.getString("seq_juso7"); // 검색창의 화면 출력을 위한 변수
														
														%><tr>
														<!-- 우편번호 출력&클릭시 회원가입폼에 우편번호, 주소 입력됨-->
														<td width="15%">
														<a href="#" onClick="javascript:checkPostClose('<%=rs.getString("seq_juso2") %>','<%=address %>')"><%=rs.getString("seq_juso2") %></td><!-- 주소 출력&클릭시 회원가입폼에 우편번호,주소 입력됨 -->
														<td align="left">
														<a href="#" onClick="javascript:checkPostClose('<%=rs.getString("seq_juso2") %>','<%=address %>')"><%=address2%></td>
														</tr><% 
																							}
																							}
																							catch(SQLException e){e.printStackTrace();}
																							finally
																							{ 
																							try
																							{
																							if(pstmt!=null) pstmt.close();
																							if(conn!=null) conn.close();
																							}
																							catch(SQLException e2){ e2.printStackTrace(); } 
																							}
																							%>
																							</table>
																							</center>
																							</form>
																							</body>
																							</html>