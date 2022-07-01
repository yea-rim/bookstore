package com.trio.bookstore.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LibInfoVO {

	private String LBRRY_SEQ_NO;
	private String LBRRY_NAME;
	private String GU_CODE;
	private String CODE_VALUE;
	private String ADRES;
	private String TEL_NO;
	private String HMPG_URL;
	private String OP_TIME;
	private String FDRM_CLOSE_DATE;
	private String LBRRY_SE_NAME;
	private String XCNTS;
	private String YDNTS;

}

//tel_no	:	02-2051-1178
//gu_code	:	0008
//lbrry_seq_no	:	1066
//adres	:	서울특별시 강남구 테헤란로8길 36. 4층
//lbrry_se	:	0001
//xcnts	:	37.4964968
//hmpg_url	:	http://ysplib.gangnam.go.kr/
//code_value	:	강남구
//lbrry_se_name	:	공공도서관
//lbrry_name	:	강남역삼푸른솔도서관
//fdrm_close_date	:	매주 화요일 및 법정 공휴일
//ydnts	:	127.0320274
//op_time	:	평일 : 09:00~18:00, 주말 : 09:00~17:00