<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="javax.activation.*"%>
<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%// SMTP 서버 주소
String smtpHost = "smtp.naver.com";
String smtpPort = "465";


//받는 사람의 정보
String toName = "남기승";
String toEmail = "";

request.getParameter("siup_id");
request.getParameter("siup_id");

//보내는 사람의 정보
String fromName = request.getParameter("to");
String fromEmail = request.getParameter("from");



try {
 Properties props = new Properties();
 props.put("smtp.naver.com", smtpHost);

 Session sess = Session.getDefaultInstance(props, null);
 InternetAddress addr = new InternetAddress();
 addr.setPersonal(fromName,"UTF-8");
 addr.setAddress(fromEmail);

 // create a message
 Message msg = new MimeMessage(sess);
 msg.setFrom(addr);         
 msg.setSubject(MimeUtility.encodeText("메일전송테스트", "utf-8","B"));
 msg.setContent("메일전송테스트", "text/html;charset=utf-8");
 msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));

 Transport.send(msg);
} catch (Exception e) {
 e.printStackTrace();
 out.println("<script>alert('"+fromEmail+"님께 메일전송이 실패하였습니다.'); location.href='../main.jsp';</script>");
}
 out.println("<script>alert('메일이 전송되었습니다.'); location.href='../main.jsp';</script>");
%>