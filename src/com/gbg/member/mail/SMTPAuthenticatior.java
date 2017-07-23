package com.gbg.member.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticatior extends Authenticator{

	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication("didhomin@gmail.com","didals1390)(");
    }

}
