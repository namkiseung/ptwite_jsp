<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>04</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
 <%@ page import="java.security.*" %>
<%!
    public class CEncrypt
    {
        MessageDigest md;
        String strSRCData = "";
        String strENCData = "";

        public CEncrypt(){}
        //인스턴스 만들 때 한방에 처리할 수 있도록 생성자 중복시켰습니다. 
        public CEncrypt(String EncMthd, String strData)
        {
            this.encrypt(EncMthd, strData);
        }

        //암호화 절차를 수행하는 메소드입니다.
        public void encrypt(String EncMthd, String strData)
       {
           try
          {
              MessageDigest md = MessageDigest.getInstance(EncMthd); // "MD5" or "SHA1"
             byte[] bytData = strData.getBytes();
             md.update(bytData);

             byte[] digest = md.digest();
             for(int i =0;i<digest.length;i++)
             {
                 strENCData = strENCData + Integer.toHexString(digest[i] & 0xFF).toUpperCase();
             }
           }catch(NoSuchAlgorithmException e)
          {
             System.out.print("암호화 알고리즘이 없습니다.");
          };
        
          //나중에 원본 데이터가 필요할지 몰라서 저장해 둡니다.
          strSRCData = strData;
        }

        //접근자 인라인 함수(아니, 메소드)들입니다.
        public String getEncryptData(){return strENCData;}
        public String getSourceData(){return strSRCData;}

        //데이터가 같은지 비교해주는 메소드입니다.
        public boolean equal(String strData)
        {
          //암호화 데이터랑 비교를 하던, 원본이랑 비교를 하던 맘대로....
          if(strData == strENCData) return true;
          return false;
        }
    }    //CEncrypt
%>


<!-- loginchk은 입력된 정보를 DB와 연결해주는 창입니다. -->
<%
 String id = request.getParameter("siin_id");
 String tmp_pass =request.getParameter("siin_pw");

 CEncrypt encrypt = new CEncrypt("MD5", tmp_pass);
 String pass = encrypt.getEncryptData();




 String redirectUrl = "main.jsp";
 Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection conn = null;
 Statement stmt =null;
 ResultSet rs = null;
 
 try{
  String JDBCINFO = "jdbc:oracle:thin:@192.168.177.135:1521:xe";
  String ORA_USER = "testuser";
  String USER_PASSWD = "1234";
  String SQL_QUERY ="SELECT * FROM member WHERE USERID='"+id+"' and USERPW='"+pass+"'";
  
  conn = DriverManager.getConnection(JDBCINFO, ORA_USER, USER_PASSWD);
  stmt = conn.createStatement();
  rs = stmt.executeQuery(SQL_QUERY);  
  
  Boolean isLogin=false;
  while(rs.next()){  
	isLogin=true;
  }
  if (isLogin){
	  session.setAttribute("id",id);
	  session.setAttribute("pw",pass);
	  
  }
  
 }catch(SQLException ex){
  ex.printStackTrace();
 }
 response.sendRedirect("/sec04/main.jsp?de="+pass);
%>
</body>
</html>

