<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body> 
    <%
        String find_name = request.getParameter("fi_name"); //이름
        String find_birth = request.getParameter("fi_birth"); //생년월일
		String driver = "oracle.jdbc.driver.OracleDriver";
		Class.forName(driver);
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		String finded_userid = null;
        try {
            // 드라이버 로딩
            
            
            // 관리자 
            String url = "jdbc:oracle:thin:@192.168.177.135:1521:xe";
            String id = "testuser";
            String pw = "1234";
            
            // 연결
            conn = DriverManager.getConnection(url, id, pw);
            st = conn.createStatement();
			
            String sql = "SELECT userid FROM member WHERE NAME='"+find_name+"' and BIRTH='"+find_birth+"'";
            rs = st.executeQuery(sql);
			while(rs.next()) {		
				finded_userid = (String)rs.getString(1);
			}
			//검색결과 없는경우
			if(finded_userid==null){
				out.println("<script>alert('ID 검색결과가 없습니다.'); location.href='../ologin.jsp';</script>");
			}
			//찾게되면 아이디 출력
			out.println("<script>alert('ID : "+finded_userid+"'); location.href='../ologin.jsp';</script>");
        } catch (Exception e) {
			e.printStackTrace();
			out.println("<script>alert('ID 검색결과가 없습니다.'); location.href='../ologin.jsp';</script>");
		}
			
    %>
 
</body>
</html>
