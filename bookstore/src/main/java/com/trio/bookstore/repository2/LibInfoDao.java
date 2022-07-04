package com.trio.bookstore.repository2;

import java.util.List;

import com.trio.bookstore.entity.LibInfoDto;

public interface LibInfoDao {

	List<LibInfoDto> list();

	LibInfoDto insert(LibInfoDto libinfoDto);

	LibInfoDto update(LibInfoDto libinfoDto);

	void delete(int libInfoNo);

	List<LibInfoDto> search(String query);

	List<LibInfoDto> findLib(int libInfoNo);

}
