package com.trio.bookstore.service;

import javax.mail.MessagingException;

import com.trio.bookstore.entity.MemberDto;

public interface EmailService {
	void sendCertification(String email);
	void sendPasswordResetMail(MemberDto findDto) throws MessagingException;
}
