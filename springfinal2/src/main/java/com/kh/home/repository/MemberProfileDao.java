package com.kh.home.repository;

public interface MemberProfileDao {
	void insert(String memberId, int attachmentNo);
	int info(String memberId);
}
