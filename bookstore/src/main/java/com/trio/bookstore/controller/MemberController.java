package com.trio.bookstore.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.Format;
import java.util.Random;

import javax.mail.MessagingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.trio.bookstore.entity.CertDto;
import com.trio.bookstore.entity.MemberDto;
import com.trio.bookstore.error.UnauthorizeException;
import com.trio.bookstore.repository.AttachmentDao;
import com.trio.bookstore.repository.CertDao;
import com.trio.bookstore.repository.MemberDao;
import com.trio.bookstore.repository.MemberProfileDao;
import com.trio.bookstore.service.EmailService;
import com.trio.bookstore.service.MemberService;

@Controller
@RequestMapping("/member") // 이 자리에 @GetMapping이나 @PostMapping 사용 불가
public class MemberController {

//	의존성 주입(Dependency Injection)
//	- 이 클래스는 등록된 도구 중에서 MemberDao를 쓸겁니다(그러니까 준비해놓으세요)
//	- 만약 등록된 도구 중 MemberDao가 없다면 Error!
	@Autowired
	private MemberDao memberDao;

	@Autowired
	private AttachmentDao attachmentDao;

	@Autowired
	private MemberProfileDao memberProfileDao;

	@Autowired
	private MemberService memberService;

	@Autowired
	private EmailService emailService;

	@Autowired
	private CertDao certDao;

//	회원가입
	@GetMapping("/join")
	public String join() {
		return "member/join";
	}
	
	@PostMapping("/join")
	public String join(
			@ModelAttribute MemberDto memberDto,
			@RequestParam MultipartFile memberProfile) throws IllegalStateException, IOException {
		
		memberService.join(memberDto, memberProfile);
		
//		return "redirect:join_success";//상대
		return "redirect:/member/join_success";//절대
	}
	
	@RequestMapping("/join_success")
	public String joinSuccess() {
		return "member/join_success";
	}

	@RequestMapping("/idCheck")
	@ResponseBody
	public String idCheck(HttpServletRequest request) {

		String memberId = request.getParameter("memberId");
		int result = memberService.idCheck(memberId);
		return Integer.toString(result);
	}

//	로그인 처리
//	- 사용자 요청 헤더에 있는 Referer라는 값을 알아야 로그인 성공 후 다시 이동시킬 수 있다
//	- @RequestHeader("헤더이름")
	@GetMapping("/login")
	public String login(@RequestHeader(value = "Referer", defaultValue = "/") String referer, Model model) {
		model.addAttribute("referer", referer);
		return "member/login";
	}

//	tip : 세션을 쓰고 싶으면 매개변수에 선언한 하면 자동으로 설정해준다
	@PostMapping("/login")
	public String login(@RequestParam String memberId, @RequestParam String memberPw, @RequestParam String referer,
			@RequestParam(required = false) String remember, HttpSession session, HttpServletResponse response) {
		MemberDto memberDto = memberDao.login(memberId, memberPw);
		if (memberDto != null) {// 로그인 성공
			// 세션
			session.setAttribute("login", memberDto.getMemberId());
			session.setAttribute("auth", memberDto.getMemberGrade());
			// 쿠키
			if (remember != null) {// 체크하고 로그인 했으면 -> 쿠키 발행
				Cookie ck = new Cookie("saveId", memberDto.getMemberId());
				ck.setMaxAge(4 * 7 * 24 * 60 * 60);// 4주
				response.addCookie(ck);
			} else {// 체크안하고 로그인 했으면 -> 쿠키 삭제
				Cookie ck = new Cookie("saveId", memberDto.getMemberId());
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
			return "redirect:" + referer;
		} else {// 로그인 실패
			return "redirect:login?error";
		}
	}
 
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("login");
		session.removeAttribute("auth");
		return "redirect:/";
	}

//	내정보
	@GetMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		String memberId = (String) session.getAttribute("login");

		MemberDto memberDto = memberDao.info(memberId);
		model.addAttribute("memberDto", memberDto);

		// 프로필 이미지의 다운로드 주소를 추가
		// - member_profile 에서 아이디를 이용하여 단일조회를 수행
		// - http://localhost:8080/home/attachment/download?attachmentNo=OOO
		int attachmentNo = memberProfileDao.info(memberId);
		if (attachmentNo == 0) {
			model.addAttribute("profileUrl", "/image/user.png");
		} else {
			model.addAttribute("profileUrl", "/attachment/download?attachmentNo=" + attachmentNo);
		}	

		return "member/mypage";
	}

//	비밀번호 변경
	@GetMapping("/password")
	public String password() {
		return "member/password";
	}

	@PostMapping("/password")
	public String password(@RequestParam String currentPw, @RequestParam String changePw, HttpSession session) {
		String memberId = (String) session.getAttribute("login");
		boolean success = memberDao.changePassword(memberId, currentPw, changePw);
		if (success) {
			// return "redirect:/member/mypage";
			return "redirect:mypage";
		} else {
			return "redirect:password?error";
		}
	}

	@GetMapping("/find_id")
	public String findId() {
		return "member/find_id";
	}

	@PostMapping("/find_id")
	public String findId(@ModelAttribute MemberDto memberDto, HttpSession session, Model model) {
		String memberId = memberDao.findId(memberDto);
		if (memberId == null) {
			return "redirect:find_id?error";
		} else {
			model.addAttribute("findUserId", memberId);
			return "member/find_id_result";
		}
	}

	@GetMapping("/exit")
	public String exit() {
		return "member/exit";
	}

	@PostMapping("/exit")
	public String exit(@RequestParam String memberPw, HttpSession session) {
		String memberId = (String) session.getAttribute("login");
		boolean success = memberDao.exit(memberId, memberPw);
		if (success) {
			session.removeAttribute("login");
			session.removeAttribute("auth");
			return "redirect:exit_finish";
		} else {
			return "redirect:exit?error";
		}
	}

	@GetMapping("/exit_finish")
	public String exitFinish() {
		return "member/exit_finish";
	}

//	개인정보 변경
	@GetMapping("/information")
	public String information(HttpSession session, Model model) {
		String memberId = (String) session.getAttribute("login");
		MemberDto memberDto = memberDao.info(memberId);
		model.addAttribute("memberDto", memberDto);
		return "member/information";
	}

	@PostMapping("/information")
	public String information(HttpSession session, @ModelAttribute MemberDto memberDto) {
		String memberId = (String) session.getAttribute("login");
		memberDto.setMemberId(memberId);

		boolean success = memberDao.changeInformation(memberDto);
		if (success) {
			return "redirect:mypage";
		} else {
			return "redirect:information?error";
		}
	}

	@GetMapping("/find_pw")
	public String findPw() {
		return "member/find_pw";
	}

	@PostMapping("/find_pw")
	public String findPw(@ModelAttribute MemberDto memberDto) throws MessagingException {
		MemberDto findDto = memberDao.find(memberDto);
		if (findDto == null) {
			return "redirect:find_pw?error";
		}
		if (findDto.getMemberEmail() == null) {
			return "redirect:email_is_null";
		}

		// 남은회원들(정보도 맞고 이메일도 있는 회원)에게 이메일 발송
		emailService.sendPasswordResetMail(findDto);
		return "redirect:find_pw_send_mail";
	}

	@GetMapping("/email_is_null")
	public String emailIsNull() {
		return "error/email_is_null";
	}

	private Random r = new Random();
	private Format f = new DecimalFormat("000000");

	@GetMapping("/reset")
	public String reset(@RequestParam String memberId, @RequestParam String cert, Model model) {
//		CertDto certDto = new CertDto();
//		certDto.setCertTarget(memberId);
//		certDto.setCertNumber(cert);
		CertDto certDto = CertDto.builder().certTarget(memberId).certNumber(cert).build();
		boolean isOk = certDao.check(certDto);
		if (isOk) {

			// 추가 인증번호 생성 및 페이지로 전달
			String newCert = f.format(r.nextInt(1000000));
			certDao.insert(CertDto.builder().certTarget(memberId).certNumber(newCert).build());
			model.addAttribute("cert", newCert);// 쿠키로 해도 됨

			return "member/reset";
		} else {
			throw new UnauthorizeException();// 401 error
		}
	}

	@PostMapping("/reset")
	public String reset(@ModelAttribute MemberDto memberDto, @RequestParam String cert) {
		boolean isOk = certDao.check(CertDto.builder().certTarget(memberDto.getMemberId()).certNumber(cert).build());
		if (isOk) {
			boolean result = memberDao.changePassword(memberDto);
			if (result) {
				return "redirect:reset_success";
			}
		}
		throw new UnauthorizeException();// 401
	}

	@GetMapping("/find_pw_send_mail")
	public String findPwSendMail() {
		return "member/find_pw_send_mail";
	}

	@GetMapping("/reset_success")
	public String resetSuccess() {
		return "member/reset_success";
	}

}
