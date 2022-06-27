package com.trio.bookstore.repository;

import com.trio.bookstore.entity.CertDto;

public interface CertDao {
	void insert(CertDto certDto);
	boolean check(CertDto certDto);
	void clear();
}
