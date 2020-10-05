

package com.nmp;



import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class JEmail extends HttpServlet {

	Properties emailProperties;
	Session mailSession;
	MimeMessage emailMessage;
	boolean b = false;
	public boolean EmailCaller(HttpServletRequest request, String[] toEmails) {

		b = false;
		try {
			setMailServerProperties();
			createEmailMessage(request, toEmails);
			sendEmail();
			b = true;
		} catch (Exception ex) {
			System.out.println(ex);
		}
		return b;
	}

	public boolean EmailCaller(HttpServletRequest request, String[] toEmails, String text) {
		b = false;

		try {
			setMailServerProperties();
			createEmailMessage(request, toEmails, text);
			sendEmail();
			b = true;
		} catch (Exception ex) {
			System.out.println("error2:" + ex);
		}
		return b;
	}


	public void setMailServerProperties() {

		String emailPort = "587";//gmail's smtp port

		emailProperties = System.getProperties();
		emailProperties.put("mail.smtp.port", emailPort);
		emailProperties.put("mail.smtp.auth", "true");
		emailProperties.put("mail.smtp.starttls.enable", "true");

	}

	public void createEmailMessage(HttpServletRequest request, String[]  toEmails) throws AddressException,
		MessagingException {

		String emailSubject = "Notifyme";
		int code = 0;
		code = vcode();
		HttpSession session = request.getSession();
		session.setAttribute("vcode", code);
		String vcode = new String("" + code);
		String emailBody = "This is an email sent by Notifyme you Verifycode are :" + vcode;

		mailSession = Session.getDefaultInstance(emailProperties, null);
		emailMessage = new MimeMessage(mailSession);

		for (int i = 0; i < toEmails.length; i++) {
			emailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmails[i]));
		}

		emailMessage.setSubject(emailSubject);
		emailMessage.setContent(emailBody, "text/html");//for a html email
		//emailM^essage.setText(emailBody);// for a text email

	}

	public void createEmailMessage(HttpServletRequest request, String[]  toEmails, String text) throws AddressException,
		MessagingException {

		String emailSubject = "Notifyme";
		String emailBody = text;

		mailSession = Session.getDefaultInstance(emailProperties, null);
		emailMessage = new MimeMessage(mailSession);

		for (int i = 0; i < toEmails.length; i++) {
			emailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmails[i]));
		}

		emailMessage.setSubject(emailSubject);
		emailMessage.setContent(emailBody, "text/html");//for a html email
		//emailM^essage.setText(emailBody);// for a text email

	}

	public void sendEmail() throws AddressException, MessagingException {

		String emailHost = "smtp.gmail.com";
		//Enter your email and password for send emails.
		String fromUser = "abc@xyz.com";
		String fromUserEmailPassword = "abcxyz";
		//Keep your email and password private.
		Transport transport = mailSession.getTransport("smtp");
		transport.connect(emailHost, fromUser, fromUserEmailPassword);
		transport.sendMessage(emailMessage, emailMessage.getAllRecipients());
		transport.close();
		System.out.println("Email sent successfully !!!");
	}

	public static  Integer vcode() {
		int vcode = 0;
		Random rand = new Random();
		vcode = rand.nextInt(9999);


		return vcode;
	}

	public String getText(String uid, String oname, String fname, String lname, String title, String msg) {
		String text = " \n" +
		              "<html>\n" +
		              "    <head>\n" +
		              "        <style>\n" +
		              "            .font \n" +
		              "            {\n" +
		              "                \n" +
		              "                font-family: comic sans ms;\n" +
		              "                font-size: 15px;\n" +
		              "            }\n" +
		              "            \n" +
		              "            \n" +
		              "        </style>\n" +
		              "    </head>\n" +
		              "    <body>\n" +
		              "       <div class=\"font\">\n" +
		              "        <h1>Notify Me Pro</h1>\n" +
		              "        <h3>Organization Name : " + oname + "</h3>\n" +
		              "        <h4>User ID : " + uid + " and User Name :" + fname + " " + lname + "</h3>   \n" +
		              "        <h4>Title :" + title + "</h4>\n" +
		              "        <h5>" + msg + "</h5>\n" +
		              "        </div>\n" +
		              "    </body>\n" +
		              "</html>";




		return text;
	}



}