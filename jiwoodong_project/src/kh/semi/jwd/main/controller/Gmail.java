package kh.semi.jwd.main.controller;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator{

	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("kingbambbang2@gmail.com", "36zhdendb!!");
	}
}
