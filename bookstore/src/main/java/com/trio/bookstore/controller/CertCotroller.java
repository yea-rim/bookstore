package com.trio.bookstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.trio.bookstore.entity.CertDto;
import com.trio.bookstore.repository.CertDao;
import com.trio.bookstore.service.EmailService;

@Controller
public class CertCotroller {
	
	@Autowired
	private EmailService emailService;
	
	@Autowired
	private CertDao certDao;
	
	@GetMapping("/")
	public String home() {
		return "index";
	}
	
	@GetMapping("/cert")
	public String cert(@RequestParam String certTarget) {
		emailService.sendCertification(certTarget);
		return "cert";
	}
	
	@PostMapping("/cert")
	public String cert(
			@ModelAttribute CertDto certDto, RedirectAttributes attr) {
		boolean isOk = certDao.check(certDto);
		if(isOk) {
			return "redirect:/";
		}
		else {
			//return "redirect:cert_re?certTarget="+certDto.getCertTarget();
			attr.addAttribute("certTarget", certDto.getCertTarget());
			return "redirect:cert_re";
		}
	}
	
	@GetMapping("/cert_re")
	public String certRe() {
		return "cert";
	}
	
	
	//비동기 요청에 대한 처리
	// - @ResponseBody 표시가 있어야 한다
	// - 또는 컨트롤러 자체를 @RestController라고 만들어야 한다
	// - 비동기일 경우 파라미터가 있다면 post가 편하다
	@PostMapping("/asyncSend")
	@ResponseBody
	public void send(@RequestParam String certTarget){
		emailService.sendCertification(certTarget);
	}
	
//	tip : Jackson과 같은 변환 라이브러리가 없다면 String만 반환이 가능하다
	@PostMapping("/asyncCheck")
	@ResponseBody
	public boolean check(@ModelAttribute CertDto certDto) {
		return certDao.check(certDto);
	}
	
}










