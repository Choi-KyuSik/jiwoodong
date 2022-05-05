package kh.semi.jwd.main.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static kh.semi.jwd.common.jdbc.JdbcDBCP.*;
public class BumAuthEmailRequest {
	// DB를 왔다갔다 하는것
	private PreparedStatement pstmt = null;
	// DB를 Java용 언어로 바꿔주는것
	private ResultSet rs = null;
	
	@SuppressWarnings({ "static-access", "static-access" })
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String inputedEmail = request.getParameter("email");
		
		//인증코드 생성
		String AuthenticationKey = authCodeMaker();
		
		// mail server 설정
		String host = "smtp.gmail.com";
		String user = "kingbambbang2@gmail.com"; // 자신의 구글 계정
		String password = "36zhdendb!!";// 자신의 구글 패스워드
		
		// 메일 받을 주소
		String to_email = inputedEmail;
		System.out.println("inputedEmail : " + inputedEmail);

		// SMTP 서버 정보를 설정한다.
		Properties prop = System.getProperties();
		prop.put("mail.smtp.host", host);
		//google - TLS : 587, SSL: 465
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		prop.put("mail.debug", "true");
        
		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		MimeMessage msg = new MimeMessage(session);
		
		// email 전송
		try {
			Authenticator auth = new Gmail();
			Session ses = Session.getInstance(prop, auth);
			ses.setDebug(true);
			
			msg.setFrom(new InternetAddress(user));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

			// 메일 제목
			msg.setSubject("안녕하세요. 지우동의 인증메일입니다.", "UTF-8");
			// 메일 내용
			msg.setText("인증 번호 :" + AuthenticationKey );

			Transport.send(msg);
			System.out.println("이메일 전송 : " + AuthenticationKey);
			
			ShareVar_login sv = ShareVar_login.getInstance();
			AuthenticationKey = sv.getAuthEamilCode().toString();
			//sv.authEamilCode = AuthenticationKey;
			

		} catch (AddressException e) { 
			System.out.println("이메일 전송 실패~ AddressException");
			e.printStackTrace(); 
		} catch (MessagingException e) { 
			System.out.println("MessagingException");
				e.printStackTrace(); 
		} catch (Exception e) {
			System.out.println("이메일 인증 실패");
			e.printStackTrace(); 
		}
	}
	// 인증 번호 생성기
		public String authCodeMaker() {
			String authCode = null;
			
			StringBuffer temp = new StringBuffer();
			Random rnd = new Random();
			for (int i = 0; i < 10; i++) {
				int rIndex = rnd.nextInt(3);
				switch (rIndex) {
				case 0:
					// a-z
					temp.append((char) ((int) (rnd.nextInt(26)) + 97));
					break;
				case 1:
					// A-Z
					temp.append((char) ((int) (rnd.nextInt(26)) + 65));
					break;
				case 2:
					// 0-9
					temp.append((rnd.nextInt(10)));
					break;
				}
			}
			
			authCode = temp.toString();
			System.out.println(authCode);
			
			return authCode;
		}
}
