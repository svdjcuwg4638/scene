package com.itbank.service;

import java.io.IOException;
import java.util.Properties;
import java.util.Scanner;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.AddressException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

@Service
public class MailService {
	
	@Value("classpath:account.txt")
	private Resource account;
	
	@Value("classpath:html/form.html")
	private Resource mailForm;
	
	public int sendMail(String dst, String content) throws IOException {
		Scanner sc = new Scanner(account.getFile());
		String accountInfo = null;
		while(sc.hasNextLine()) {
			accountInfo = sc.nextLine();
		}
		sc.close();
		
		
		
		String host = "smtp.naver.com";
		int port = 465;
		final String serverId = accountInfo.split("/")[0];
		final String serverPw = accountInfo.split("/")[1];
		
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		
		Session mailSession = Session.getDefaultInstance(props,new Authenticator() {
			String un = serverId;
			String pw = serverPw;
			
			
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(un,pw);
			}
		});
		Message mimeMessage = new MimeMessage(mailSession);
		
		String body = "";
		sc = new Scanner(mailForm.getFile());
		while(sc.hasNextLine()) {
			body += sc.nextLine();
		}
		sc.close();
		
		try {
			mimeMessage.setFrom(new InternetAddress("kkkko371@naver.com"));
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(dst));
			mimeMessage.setSubject("[Scenestagram 인증번호입니다");
			body = String.format(body, content);
			mimeMessage.setContent(body, "text/html; charset=utf-8");	
			Transport.send(mimeMessage);
			
			return 1;
		}catch (AddressException e) {
			System.out.println("잘못된 주소입니다.");
			return -1;
		}catch (MessagingException e) {
			e.printStackTrace();
			System.out.println("메시지 전송에 문제가 발생했습니다.");
			return  -2;
		}
		
	}
}
