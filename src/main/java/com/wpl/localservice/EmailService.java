package com.wpl.localservice;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.wpl.model.User;

@Service
public class EmailService
{
	public void sendMail(String name,String emailId,boolean conf)
	{
		String to = emailId;
		String from = "sparksupport@utdallas.edu";
		String host = "smtp.gmail.com";
		String subject = "SPARK Support - Thank you for your email !";
		String body;
		if(!conf) {
			body = "Greetings,<br><br>"
				+ "We have received your email.<br>"
				+ "We will get back to you as soon as possible.<br><br>"
				+ "Have a wonderful day!<br><br>"
				+ "Thank You,<br>"
				+ "<b>Spark Support Team</b>";
		}
		else{
			body = "Hi "+ name +",<br><br>"
					+ "Your rides are confirmed. Please check your dashboard for the upcoming as well as completed rides. "
					+ "Thank you for choosing SPARK. "
					+ "Have a wonderful day!<br><br>"
					+ "Thank You,<br>"
					+ "<b>Spark Support Team</b>";
			}
		
		Properties properties = System.getProperties();
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", "587");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		
		Session session = Session.getDefaultInstance(properties,new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("utd.spark@gmail.com", "spark.support");
			}
		  });
		
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject(subject);
			message.setContent(body, "text/html");
			message.setSentDate(new Date());
			Transport.send(message);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
