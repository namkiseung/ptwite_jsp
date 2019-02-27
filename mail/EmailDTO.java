package email;

public class Email DTO{
	private String name;
	private String email;
	private String message;
	
	public String getSenderName(){return name;}
	
	public String setSenderName(String senderName){this.senderName = name}
	
	public String getSenderMail(){return email;}
	
	public String setSenderMail(String email){this.email=email;}
	
	public String getSenderMsg(){return message;}
	
	public String setSenderMsg(String msg){this.message = msg;}
	
	
}
