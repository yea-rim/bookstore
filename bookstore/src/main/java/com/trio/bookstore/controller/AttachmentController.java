package com.trio.bookstore.controller;

import java.io.IOException;
import java.nio.charset.StandardCharsets;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.trio.bookstore.entity.AttachmentDto;
import com.trio.bookstore.error.CannotFindException;
import com.trio.bookstore.repository.AttachmentDao;

@RestController//@Controller + @ResponseBody
@RequestMapping("/attachment")
public class AttachmentController {
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@GetMapping("/download")
	public ResponseEntity<ByteArrayResource> download(
			@RequestParam int attachmentNo) throws IOException {
		//attachmentNo를 이용하여 DTO 정보를 조회(없으면 404)
		AttachmentDto attachmentDto = attachmentDao.info(attachmentNo);
		if(attachmentDto == null)
			throw new CannotFindException();//404 처리를 위임
	
		//DTO를 이용하여 파일정보 로드
		ByteArrayResource resource = 
				attachmentDao.load(attachmentDto.getAttachmentSavename());
		
		//반환
		return ResponseEntity.ok()
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.contentLength(attachmentDto.getAttachmentSize())
				.header(HttpHeaders.CONTENT_ENCODING, StandardCharsets.UTF_8.name())
				.header(HttpHeaders.CONTENT_DISPOSITION, 
						ContentDisposition.attachment()
								.filename(attachmentDto.getAttachmentUploadname(), StandardCharsets.UTF_8)
								.build()
								.toString()
				)
			.body(resource);
	}
	
	@RequestMapping("/upload")
	public String save() {
		return "attachment/upload";
	}
	
	@PostMapping("/upload")
	public int save(@RequestParam MultipartFile attachment) throws IllegalStateException, IOException {
		return attachmentDao.save(attachment);
	}
}