package com.kh.home.service;

import javax.mail.MessagingException;

import com.kh.home.entity.MemberDto;

public interface EmailService {
	void sendCertification(String email);
	void sendPasswordResetMail(MemberDto findDto) throws MessagingException;
}
