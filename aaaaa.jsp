<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%
    request.setCharacterEncoding("UTF-8");
%>

<%
 try {
			String inpt;
			inpt = request.getParameter("param"); 
			ResultSet rs = null;
            // 드라이버 로딩
            String driver = "oracle.jdbc.driver.OracleDriver";
            Class.forName(driver);
            String checkId="";
            // 관리자 Login
            String url = "jdbc:oracle:thin:@192.168.177.135:1521:xe";
            String id = "testuser";
            String pw = "1234";
            
            // 연결
            // INSERT 해달라 USERTABLE에 
            // id, pw, hobby 라는 필드를 가진
            Connection conn = DriverManager.getConnection(url, id, pw);
            Statement st = conn.createStatement();
            String sql = "SELECT userid member WHERE userid="+inpt;
            st.executeQuery(sql);
            while(rs.next()){
				checkId = rs.getString(1);
			}
       
        } catch (SQLException e){
			out.println( "");
		}
String method = request.getMethod(); 
if ("POST".equals(method)){ 
out.println("can't access!");
 } else  { 
 out.println("결과, '" + checkId + "' 입니다."); 
 out.println("당신, '" + checkId + "' 라고 썼습니다."); 
}
rs.close();
st.close();
conn.close(); 
%>

