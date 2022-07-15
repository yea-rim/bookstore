package com.trio.bookstore.repository;

public interface BoardAttachmentDao {
	void insert(int boardNo, int attachmentNo);
	int info(int boardNo);
}
