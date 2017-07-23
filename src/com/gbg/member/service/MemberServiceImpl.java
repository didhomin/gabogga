package com.gbg.member.service;


import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

import com.gbg.member.dao.MemberDao;
import com.gbg.member.mail.SMTPAuthenticatior;
import com.gbg.member.model.UsersDto;

@Service
public class MemberServiceImpl implements MemberService {

	private MemberDao memberDao;

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	@Override
	public int register(UsersDto usersDto) {
		return memberDao.register(usersDto);
	}
	@Override
	public int emailCheck(String email) {
		return memberDao.emailCheck(email);
	}
	@Override
	public void mailsend(String email) {
		
		String to = email;
		String from = "didhomin@gmail.com";
		String subject = "가보까!에서 보낸 인증 메일입니다.";
		String content = "오른쪽 버튼을 클릭하면 인증이 완료됩니다.<a href='http://localhost/gabogga/mail.gbg?email="+to+"'>인증</a>";
		Properties p = new Properties();

		p.put("mail.smtp.host", "smtp.gmail.com"); 
		p.put("mail.smtp.port", "25");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		p.setProperty("mail.stmp.port", "465");
		p.setProperty("mail.smtp.socketFactory.port", "465");
		

		try {
			Authenticator auth = new SMTPAuthenticatior();
			Session ses = Session.getInstance(p, auth);


			MimeMessage msg = new MimeMessage(ses);
			msg.setSubject(subject); 

			Address fromAddr = new InternetAddress(from);
			msg.setFrom(fromAddr);

			Address toAddr = new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr); 

			msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩

			Transport.send(msg); 
		} catch (Exception e) {
			e.printStackTrace();
			return;
		}

		
	}
	public void mailsend(Map<String,String> map) {
		
		String to = map.get("email");
		String from = "didhomin@gmail.com";
		String subject = "가보까!에서 보낸 임시 비밀번호입니다.";
		String content = "임시비밀번호 : "+ map.get("password")+ " <a href='http://localhost/gabogga/login.gbg'>로그인하러가기</a>";
		Properties p = new Properties();
		
		p.put("mail.smtp.host", "smtp.gmail.com"); 
		p.put("mail.smtp.port", "25");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		p.setProperty("mail.stmp.port", "465");
		p.setProperty("mail.smtp.socketFactory.port", "465");
		
		
		try {
			Authenticator auth = new SMTPAuthenticatior();
			Session ses = Session.getInstance(p, auth);
			
			
			MimeMessage msg = new MimeMessage(ses);
			msg.setSubject(subject); 
			
			Address fromAddr = new InternetAddress(from);
			msg.setFrom(fromAddr);
			
			Address toAddr = new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr); 
			
			msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩
			
			Transport.send(msg); 
		} catch (Exception e) {
			e.printStackTrace();
			return;
		}
		
		
	}
	@Override
	public int emailAuth(String email) {
		
		return memberDao.emailAuth(email);
	}
	@Override
	public UsersDto login(Map<String, String> map) {
		
		return memberDao.login(map);
	}
	@Override
	public void passReset(String email) {
		Map<String,String> map = new HashMap<String,String>();
		String password = (int) (Math.random() * 100000000)+"";
		map.put("email", email);
		map.put("password", password);
		memberDao.passResert(map);
		mailsend(map);
	}
	@Override
	public void passModify(Map<String, String> map) {
		memberDao.passModefiy(map);
		
	}

	
}
