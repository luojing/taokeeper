package com.taobao.taokeeper.reporter.alarm;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;


public class SendMail {
	
	private List<String> targetAddressList;
	private String subject;
	private String content;
	
	public SendMail(List<String> targetAddressList, String subject, String content){
		this.targetAddressList = targetAddressList;
		this.subject = subject;
		this.content = content;
	}
	
	public void send(){
		boolean isSSL = true;
        String host = "smtp.163.com";
        int port = 465;
        String from = "taokeeper alarm<cdbaas_report@163.com>";
        String username = "cdbaas_report@163.com";
        String password = "qwer!@#$";

        try {
            Email email = new SimpleEmail();
            email.setSSLOnConnect(isSSL);
            email.setHostName(host);
            email.setSmtpPort(port);
            email.setAuthentication(username, password);
            email.setFrom(from);
            for(String addr: targetAddressList ){
            	email.addTo(addr);
            }
            email.setSubject(this.subject);
            email.setMsg(this.content);
            email.send();
        } catch (EmailException e) {
            e.printStackTrace();
        }
	}
	
	public static void main(String[] args) {
		List<String> targetAddressList = new ArrayList<String>();
		targetAddressList.add("luojinglp@gmail.com");
		targetAddressList.add("binbinwang118@gmail.com");
		targetAddressList.add("wen.wancai@gmail.com");
		
		
		SendMail mail = new SendMail(targetAddressList,"test subject...","hello world");
		mail.send();
	}
}