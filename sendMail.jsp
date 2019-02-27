<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
import="java.lang.*, java.util.*, java.util.Date, java.text.*, java.text.SimpleDateFormat, java.text.ParseException"
import="java.sql.*, java.net.*, javax.mail.*, javax.mail.internet.*, javax.activation.*" %>
<%
response.setHeader ( "Cache-Control", "no-cache,no-store,must-revalidate" ) ;
response.setHeader ( "Pragma", "no-cache" ) ;
response.setDateHeader ( "Expires", 0 ) ;
response.setCharacterEncoding ( "UTF-8" ) ;
request.setCharacterEncoding ( "UTF-8" ) ;

String mail_recver = request.getParameter("from");
String mail_sender_name = "보내는사람이름" ;
String mail_sender_email = "계정@메일주소" ;
String mail_subject ="test";
String mail_msg="test" ;

Properties props = System.getProperties ( ) ;
props.put ( "mail.smtp.host" , "8.8.8.8" ) ; // 수정해주어야한다.

try {
	javax.mail.Session mailSession = javax.mail.Session.getInstance ( props , null /* new javax.mail.Authenticator ( )
	{
		protected javax.mail.PasswordAuthentication getPasswordAuthentication ( )
		{
			return new javax.mail.PasswordAuthentication ( "rlzld100@gmail.com" , "" ) ;
		}
	} */ ) ;

	InternetAddress [ ] recver_address = { new InternetAddress ( mail_recver ) } ;

	InternetAddress sender_address = new InternetAddress ( ) ;
	sender_address.setPersonal ( mail_sender_name , "UTF-8" ) ;
	sender_address.setAddress ( mail_sender_email ) ;

	javax.mail.Message msg = new MimeMessage ( mailSession ) ;

	msg.setHeader ( "Content-Type", "text/html; charset=UTF-8" ) ;
	msg.setFrom ( sender_address ) ;
	msg.setRecipients ( Message.RecipientType.TO , recver_address ) ;
	msg.setSentDate ( new Date ( ) ) ;
	msg.setSubject ( mail_subject ) ;
	msg.setContent ( mail_msg , "text/html; charset=UTF-8" ) ;

	javax.mail.Transport.send ( msg ) ;
} catch ( Exception e ) {
	String errMsg = "전자우편 발송에 실패하였습니다." ;
	out.println("<script>");
	out.println(errMsg);
	out.println("</script>");
	
	
} finally { }

//참고 : https://joont.tistory.com/52
//참고 : https://kh2ya.tistory.com/72
%>
