package com.trio.bookstore.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.trio.bookstore.entity.MemberDto;
import com.trio.bookstore.entity.PayDto;
import com.trio.bookstore.repository.MemberDao;
import com.trio.bookstore.repository2.PayDao;
import com.trio.bookstore.vo.MemberComplexSearchVO;

@CrossOrigin(origins = "http://127.0.0.1:5500")
@RestController
@RequestMapping("/rest/pay")
public class DeliveryRestController {

	@Autowired
	private PayDao payDao;

	@GetMapping("/")
	public List<PayDto> list() {
		return payDao.list();
	}

//	@PostMapping("/")
//	public PayDto insert(@RequestBody PayDto payDto) {
//		return payDao.insert(payDto);
//	}

	@PutMapping("/{payNo}")
	public void update(@PathVariable int payNo) {
		payDao.update(payNo);
	}

//	@DeleteMapping("/{memberId}")
//	public void delete(@PathVariable int payNo) {
//		payDao.delete(payNo);
//	}

}