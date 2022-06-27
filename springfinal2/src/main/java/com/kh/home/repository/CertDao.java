package com.kh.home.repository;

import com.kh.home.entity.CertDto;

public interface CertDao {
	void insert(CertDto certDto);
	boolean check(CertDto certDto);
	void clear();
}
