<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");

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
			
            Connection conn = DriverManager.getConnection(url, id, pw);
            Statement st = conn.createStatement();
            String sql = "SELECT * FROM member WHERE userid='"+inpt+"'";
            rs = st.executeQuery(sql);
			
            if(rs.next()){
				out.println("<br>이미 가입된 계정입니다.");
				out.println("<input id=cancelBtn type=button value=취소 onClick='window.close()'>");			
			}else if(inpt=="" || inpt==" "){
				out.println("<br>아이디를 작성하세요.");
			}else{
				out.println("<br>사용가능한 아이디 입니다.");
				out.println("<input id=useBtn type=button value=사용하기 onClick='sendCheckValue()'>");	
			}
			}
         catch (SQLException e){
			out.println("error");
		}





 
%>

