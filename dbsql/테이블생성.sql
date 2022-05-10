ALTER TABLE MY_SCHEMA.s2_list
	DROP
		CONSTRAINT FK_s2_zipcode_TO_s2_list
		CASCADE;

ALTER TABLE MY_SCHEMA.s1_pd
	DROP
		CONSTRAINT FK_s1_category_TO_s1_pd
		CASCADE;

ALTER TABLE MY_SCHEMA.s1_to
	DROP
		CONSTRAINT FK_s1_od_TO_s1_to
		CASCADE;

ALTER TABLE MY_SCHEMA.s1_oddt
	DROP
		CONSTRAINT FK_s1_od_TO_s1_oddt
		CASCADE;

ALTER TABLE MY_SCHEMA.s1_oddt
	DROP
		CONSTRAINT FK_s1_pd_TO_s1_oddt
		CASCADE;

ALTER TABLE MY_SCHEMA.s1_oding
	DROP
		CONSTRAINT FK_s1_od_TO_s1_oding
		CASCADE;

ALTER TABLE MY_SCHEMA.s2_store
	DROP
		CONSTRAINT FK_s2_list_TO_s2_store
		CASCADE;

ALTER TABLE MY_SCHEMA.s2_menu
	DROP
		CONSTRAINT FK_s2_store_TO_s2_menu
		CASCADE;

ALTER TABLE MY_SCHEMA.s2_review
	DROP
		CONSTRAINT FK_s2_store_TO_s2_review
		CASCADE;

ALTER TABLE MY_SCHEMA.s2_review
	DROP
		CONSTRAINT FK_s2_mem_TO_s2_review
		CASCADE;

ALTER TABLE MY_SCHEMA.s2_coment
	DROP
		CONSTRAINT FK_s2_review_TO_s2_coment
		CASCADE;

ALTER TABLE MY_SCHEMA.s2_coment
	DROP
		CONSTRAINT FK_s2_mem_TO_s2_coment
		CASCADE;

ALTER TABLE MY_SCHEMA.s2_list
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE MY_SCHEMA.s2_zipcode
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE MY_SCHEMA.s1_category
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE MY_SCHEMA.s1_pd
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE MY_SCHEMA.s1_od
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE MY_SCHEMA.s2_mem
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE MY_SCHEMA.s2_store
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE MY_SCHEMA.s2_review
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX MY_SCHEMA.PK_s2_list;

DROP INDEX MY_SCHEMA.PK_s2_zipcode;

DROP INDEX MY_SCHEMA.PK_s1_category;

DROP INDEX MY_SCHEMA.PK_s1_pd;

DROP INDEX MY_SCHEMA.PK_s1_od;

DROP INDEX MY_SCHEMA.PK_s2_mem;

DROP INDEX MY_SCHEMA.PK_s2_store;

DROP INDEX MY_SCHEMA.PK_s2_review;

/* 지역리스트 */
DROP TABLE MY_SCHEMA.s2_list 
	CASCADE CONSTRAINTS;

/* 주소정보 */
DROP TABLE MY_SCHEMA.s2_zipcode 
	CASCADE CONSTRAINTS;

/* 상품카테고리 */
DROP TABLE MY_SCHEMA.s1_category 
	CASCADE CONSTRAINTS;

/* 상품정보 */
DROP TABLE MY_SCHEMA.s1_pd 
	CASCADE CONSTRAINTS;

/* 매출정보 */
DROP TABLE MY_SCHEMA.s1_to 
	CASCADE CONSTRAINTS;

/* 주문정보 */
DROP TABLE MY_SCHEMA.s1_od 
	CASCADE CONSTRAINTS;

/* 주문상제정보 */
DROP TABLE MY_SCHEMA.s1_oddt 
	CASCADE CONSTRAINTS;

/* 회원정보 */
DROP TABLE MY_SCHEMA.s2_mem 
	CASCADE CONSTRAINTS;

/* 정산현황 */
DROP TABLE MY_SCHEMA.s1_cal 
	CASCADE CONSTRAINTS;

/* 진행주문정보 */
DROP TABLE MY_SCHEMA.s1_oding 
	CASCADE CONSTRAINTS;

/* 맛집 */
DROP TABLE MY_SCHEMA.s2_store 
	CASCADE CONSTRAINTS;

/* 메뉴 */
DROP TABLE MY_SCHEMA.s2_menu 
	CASCADE CONSTRAINTS;

/* 리뷰 */
DROP TABLE MY_SCHEMA.s2_review 
	CASCADE CONSTRAINTS;

/* 리뷰코멘트 */
DROP TABLE MY_SCHEMA.s2_coment 
	CASCADE CONSTRAINTS;

/* 지역리스트 */
CREATE TABLE MY_SCHEMA.s2_list (
	list_no NUMBER NOT NULL, /* 리스트번호 */
	list_name VARCHAR(60), /* 리스트이름 */
	list_pic CLOB, /* 지역사진 */
	zip_seq NUMBER /* 번호 */
);

COMMENT ON TABLE MY_SCHEMA.s2_list IS '지역리스트';

COMMENT ON COLUMN MY_SCHEMA.s2_list.list_no IS '리스트번호';

COMMENT ON COLUMN MY_SCHEMA.s2_list.list_name IS '리스트이름';

COMMENT ON COLUMN MY_SCHEMA.s2_list.list_pic IS '지역사진';

COMMENT ON COLUMN MY_SCHEMA.s2_list.zip_seq IS '번호';

CREATE UNIQUE INDEX MY_SCHEMA.PK_s2_list
	ON MY_SCHEMA.s2_list (
		list_no ASC
	);

ALTER TABLE MY_SCHEMA.s2_list
	ADD
		CONSTRAINT PK_s2_list
		PRIMARY KEY (
			list_no
		);

/* 주소정보 */
CREATE TABLE MY_SCHEMA.s2_zipcode (
	zip_code VARCHAR2(20), /* 우편번호 */
	zip_si VARCHAR2(20) NOT NULL, /* 시 */
	zip_gugun VARCHAR2(20) NOT NULL, /* 구군 */
	zip_dong VARCHAR2(20) NOT NULL, /* 동 */
	zip_sbunji VARCHAR2(20), /* 시작번지 */
	zip_ebunji VARCHAR2(20), /* 끝번지 */
	zip_seq NUMBER NOT NULL /* 번호 */
);

COMMENT ON TABLE MY_SCHEMA.s2_zipcode IS '주소정보';

COMMENT ON COLUMN MY_SCHEMA.s2_zipcode.zip_code IS '우편번호';

COMMENT ON COLUMN MY_SCHEMA.s2_zipcode.zip_si IS '시';

COMMENT ON COLUMN MY_SCHEMA.s2_zipcode.zip_gugun IS '구군';

COMMENT ON COLUMN MY_SCHEMA.s2_zipcode.zip_dong IS '동';

COMMENT ON COLUMN MY_SCHEMA.s2_zipcode.zip_sbunji IS '시작번지';

COMMENT ON COLUMN MY_SCHEMA.s2_zipcode.zip_ebunji IS '끝번지';

COMMENT ON COLUMN MY_SCHEMA.s2_zipcode.zip_seq IS '번호';

CREATE UNIQUE INDEX MY_SCHEMA.PK_s2_zipcode
	ON MY_SCHEMA.s2_zipcode (
		zip_seq ASC
	);

ALTER TABLE MY_SCHEMA.s2_zipcode
	ADD
		CONSTRAINT PK_s2_zipcode
		PRIMARY KEY (
			zip_seq
		);

/* 상품카테고리 */
CREATE TABLE MY_SCHEMA.s1_category (
	cate_no NUMBER NOT NULL, /* 카테고리번호 */
	cate_name VARCHAR2(20) NOT NULL /* 카테고리명 */
);

COMMENT ON TABLE MY_SCHEMA.s1_category IS '상품카테고리';

COMMENT ON COLUMN MY_SCHEMA.s1_category.cate_no IS '카테고리번호';

COMMENT ON COLUMN MY_SCHEMA.s1_category.cate_name IS '카테고리명';

CREATE UNIQUE INDEX MY_SCHEMA.PK_s1_category
	ON MY_SCHEMA.s1_category (
		cate_no ASC
	);

ALTER TABLE MY_SCHEMA.s1_category
	ADD
		CONSTRAINT PK_s1_category
		PRIMARY KEY (
			cate_no
		);

/* 상품정보 */
CREATE TABLE MY_SCHEMA.s1_pd (
	cate_no NUMBER, /* 카테고리번호 */
	pd_no NUMBER NOT NULL, /* 상품번호 */
	pd_name VARCHAR2(20) NOT NULL, /* 상품명 */
	pd_price NUMBER NOT NULL, /* 상품가격 */
	pd_img CLOB /* 이미지 */
);

COMMENT ON TABLE MY_SCHEMA.s1_pd IS '상품정보';

COMMENT ON COLUMN MY_SCHEMA.s1_pd.cate_no IS '카테고리번호';

COMMENT ON COLUMN MY_SCHEMA.s1_pd.pd_no IS '상품번호';

COMMENT ON COLUMN MY_SCHEMA.s1_pd.pd_name IS '상품명';

COMMENT ON COLUMN MY_SCHEMA.s1_pd.pd_price IS '상품가격';

COMMENT ON COLUMN MY_SCHEMA.s1_pd.pd_img IS '이미지';

CREATE UNIQUE INDEX MY_SCHEMA.PK_s1_pd
	ON MY_SCHEMA.s1_pd (
		pd_no ASC
	);

ALTER TABLE MY_SCHEMA.s1_pd
	ADD
		CONSTRAINT PK_s1_pd
		PRIMARY KEY (
			pd_no
		);

/* 매출정보 */
CREATE TABLE MY_SCHEMA.s1_to (
	od_number NUMBER, /* 주문번호 */
	to_total NUMBER NOT NULL, /* 판매가격 */
	to_date DATE NOT NULL, /* 판매일자 */
	to_pay VARCHAR2(20) NOT NULL /* 결제수단 */
);

COMMENT ON TABLE MY_SCHEMA.s1_to IS '매출정보';

COMMENT ON COLUMN MY_SCHEMA.s1_to.od_number IS '주문번호';

COMMENT ON COLUMN MY_SCHEMA.s1_to.to_total IS '판매가격';

COMMENT ON COLUMN MY_SCHEMA.s1_to.to_date IS '판매일자';

COMMENT ON COLUMN MY_SCHEMA.s1_to.to_pay IS '결제수단';

/* 주문정보 */
CREATE TABLE MY_SCHEMA.s1_od (
	od_number NUMBER NOT NULL, /* 주문번호 */
	od_total NUMBER NOT NULL, /* 판매가격 */
	od_date DATE NOT NULL /* 주문일자 */
);

COMMENT ON TABLE MY_SCHEMA.s1_od IS '주문정보';

COMMENT ON COLUMN MY_SCHEMA.s1_od.od_number IS '주문번호';

COMMENT ON COLUMN MY_SCHEMA.s1_od.od_total IS '판매가격';

COMMENT ON COLUMN MY_SCHEMA.s1_od.od_date IS '주문일자';

CREATE UNIQUE INDEX MY_SCHEMA.PK_s1_od
	ON MY_SCHEMA.s1_od (
		od_number ASC
	);

ALTER TABLE MY_SCHEMA.s1_od
	ADD
		CONSTRAINT PK_s1_od
		PRIMARY KEY (
			od_number
		);

/* 주문상제정보 */
CREATE TABLE MY_SCHEMA.s1_oddt (
	od_number NUMBER NOT NULL, /* 주문번호 */
	pd_no NUMBER NOT NULL, /* 상품번호 */
	oddt_cnt NUMBER, /* 수량 */
	oddt_io VARCHAR2(2), /* 매장이용여부 */
	oddt_ice VARCHAR2(2), /* 얼음 */
	oddt_shot VARCHAR2(2) /* 샷추가 */
);

COMMENT ON TABLE MY_SCHEMA.s1_oddt IS '주문상제정보';

COMMENT ON COLUMN MY_SCHEMA.s1_oddt.od_number IS '주문번호';

COMMENT ON COLUMN MY_SCHEMA.s1_oddt.pd_no IS '상품번호';

COMMENT ON COLUMN MY_SCHEMA.s1_oddt.oddt_cnt IS '수량';

COMMENT ON COLUMN MY_SCHEMA.s1_oddt.oddt_io IS '매장이용여부';

COMMENT ON COLUMN MY_SCHEMA.s1_oddt.oddt_ice IS '얼음';

COMMENT ON COLUMN MY_SCHEMA.s1_oddt.oddt_shot IS '샷추가';

/* 회원정보 */
CREATE TABLE MY_SCHEMA.s2_mem (
	mem_no NUMBER NOT NULL, /* 회원번호 */
	mem_name VARCHAR2(20) NOT NULL, /* 이름 */
	mem_id VARCHAR2(20) NOT NULL, /* ID */
	mem_pw VARCHAR2(20) NOT NULL, /* PW */
	mem_birth VARCHAR2(20), /* 생년월일 */
	mem_tel VARCHAR2(30), /* 전화번호 */
	COL CLOB, /* 주소 */
	COL2 CLOB /* 프로필사진 */
);

COMMENT ON TABLE MY_SCHEMA.s2_mem IS '회원정보';

COMMENT ON COLUMN MY_SCHEMA.s2_mem.mem_no IS '회원번호';

COMMENT ON COLUMN MY_SCHEMA.s2_mem.mem_name IS '이름';

COMMENT ON COLUMN MY_SCHEMA.s2_mem.mem_id IS 'ID';

COMMENT ON COLUMN MY_SCHEMA.s2_mem.mem_pw IS 'PW';

COMMENT ON COLUMN MY_SCHEMA.s2_mem.mem_birth IS '생년월일';

COMMENT ON COLUMN MY_SCHEMA.s2_mem.mem_tel IS '전화번호';

COMMENT ON COLUMN MY_SCHEMA.s2_mem.COL IS '주소';

COMMENT ON COLUMN MY_SCHEMA.s2_mem.COL2 IS '프로필사진';

CREATE UNIQUE INDEX MY_SCHEMA.PK_s2_mem
	ON MY_SCHEMA.s2_mem (
		mem_no ASC
	);

ALTER TABLE MY_SCHEMA.s2_mem
	ADD
		CONSTRAINT PK_s2_mem
		PRIMARY KEY (
			mem_no
		);

/* 정산현황 */
CREATE TABLE MY_SCHEMA.s1_cal (
	cal_scash NUMBER, /* 개점준비금 */
	cal_ecash NUMBER, /* 마감현금 */
	cal_ecard NUMBER, /* 마감카드 */
	cal_sum NUMBER, /* 당일정산 */
	cal_date DATE /* 마감일 */
);

COMMENT ON TABLE MY_SCHEMA.s1_cal IS '정산현황';

COMMENT ON COLUMN MY_SCHEMA.s1_cal.cal_scash IS '개점준비금';

COMMENT ON COLUMN MY_SCHEMA.s1_cal.cal_ecash IS '마감현금';

COMMENT ON COLUMN MY_SCHEMA.s1_cal.cal_ecard IS '마감카드';

COMMENT ON COLUMN MY_SCHEMA.s1_cal.cal_sum IS '당일정산';

COMMENT ON COLUMN MY_SCHEMA.s1_cal.cal_date IS '마감일';

/* 진행주문정보 */
CREATE TABLE MY_SCHEMA.s1_oding (
	od_number NUMBER /* 주문번호 */
);

COMMENT ON TABLE MY_SCHEMA.s1_oding IS '진행주문정보';

COMMENT ON COLUMN MY_SCHEMA.s1_oding.od_number IS '주문번호';

/* 맛집 */
CREATE TABLE MY_SCHEMA.s2_store (
	st_no NUMBER NOT NULL, /* 맛집번호 */
	st_name VARCHAR(30), /* 이름 */
	st_add CLOB, /* 주소 */
	st_tel VARCHAR(30), /* 전화번호 */
	st_kind VARCHAR(30), /* 음식종류 */
	st_price VARCHAR(30), /* 가격대 */
	st_parking VARCHAR(4), /* 주차 */
	st_time VARCHAR(30), /* 영업시간 */
	st_restday VARCHAR(10), /* 휴일 */
	st_preview CLOB, /* 식당소개 */
	st_regdate DATE DEFAULT sysdate, /* 등록일 */
	st_pic CLOB, /* 맛집사진 */
	list_no NUMBER /* 리스트번호 */
);

COMMENT ON TABLE MY_SCHEMA.s2_store IS '맛집';

COMMENT ON COLUMN MY_SCHEMA.s2_store.st_no IS '맛집번호';

COMMENT ON COLUMN MY_SCHEMA.s2_store.st_name IS '이름';

COMMENT ON COLUMN MY_SCHEMA.s2_store.st_add IS '주소';

COMMENT ON COLUMN MY_SCHEMA.s2_store.st_tel IS '전화번호';

COMMENT ON COLUMN MY_SCHEMA.s2_store.st_kind IS '음식종류';

COMMENT ON COLUMN MY_SCHEMA.s2_store.st_price IS '가격대';

COMMENT ON COLUMN MY_SCHEMA.s2_store.st_parking IS '주차';

COMMENT ON COLUMN MY_SCHEMA.s2_store.st_time IS '영업시간';

COMMENT ON COLUMN MY_SCHEMA.s2_store.st_restday IS '휴일';

COMMENT ON COLUMN MY_SCHEMA.s2_store.st_preview IS '식당소개';

COMMENT ON COLUMN MY_SCHEMA.s2_store.st_regdate IS '등록일';

COMMENT ON COLUMN MY_SCHEMA.s2_store.st_pic IS '맛집사진';

COMMENT ON COLUMN MY_SCHEMA.s2_store.list_no IS '리스트번호';

CREATE UNIQUE INDEX MY_SCHEMA.PK_s2_store
	ON MY_SCHEMA.s2_store (
		st_no ASC
	);

ALTER TABLE MY_SCHEMA.s2_store
	ADD
		CONSTRAINT PK_s2_store
		PRIMARY KEY (
			st_no
		);

/* 메뉴 */
CREATE TABLE MY_SCHEMA.s2_menu (
	st_no NUMBER, /* 맛집번호 */
	menu_name VARCHAR(30), /* 메뉴이름 */
	menu_price NUMBER, /* 가격 */
	menu_pic CLOB /* 메뉴사진 */
);

COMMENT ON TABLE MY_SCHEMA.s2_menu IS '메뉴';

COMMENT ON COLUMN MY_SCHEMA.s2_menu.st_no IS '맛집번호';

COMMENT ON COLUMN MY_SCHEMA.s2_menu.menu_name IS '메뉴이름';

COMMENT ON COLUMN MY_SCHEMA.s2_menu.menu_price IS '가격';

COMMENT ON COLUMN MY_SCHEMA.s2_menu.menu_pic IS '메뉴사진';

/* 리뷰 */
CREATE TABLE MY_SCHEMA.s2_review (
	re_no NUMBER NOT NULL, /* 리뷰번호 */
	st_no NUMBER, /* 맛집번호 */
	mem_no NUMBER, /* 회원번호 */
	re_review CLOB, /* 리뷰 */
	re_score NUMBER, /* 평점 */
	re_regdate DATE DEFAULT sysdate /* 등록일 */
);

COMMENT ON TABLE MY_SCHEMA.s2_review IS '리뷰';

COMMENT ON COLUMN MY_SCHEMA.s2_review.re_no IS '리뷰번호';

COMMENT ON COLUMN MY_SCHEMA.s2_review.st_no IS '맛집번호';

COMMENT ON COLUMN MY_SCHEMA.s2_review.mem_no IS '회원번호';

COMMENT ON COLUMN MY_SCHEMA.s2_review.re_review IS '리뷰';

COMMENT ON COLUMN MY_SCHEMA.s2_review.re_score IS '평점';

COMMENT ON COLUMN MY_SCHEMA.s2_review.re_regdate IS '등록일';

CREATE UNIQUE INDEX MY_SCHEMA.PK_s2_review
	ON MY_SCHEMA.s2_review (
		re_no ASC
	);

ALTER TABLE MY_SCHEMA.s2_review
	ADD
		CONSTRAINT PK_s2_review
		PRIMARY KEY (
			re_no
		);

/* 리뷰코멘트 */
CREATE TABLE MY_SCHEMA.s2_coment (
	re_no NUMBER, /* 리뷰번호 */
	mem_no NUMBER, /* 회원번호 */
	co_coment CLOB, /* 코멘트 */
	co_regdate DATE DEFAULT sysdate /* 등록일 */
);

COMMENT ON TABLE MY_SCHEMA.s2_coment IS '리뷰코멘트';

COMMENT ON COLUMN MY_SCHEMA.s2_coment.re_no IS '리뷰번호';

COMMENT ON COLUMN MY_SCHEMA.s2_coment.mem_no IS '회원번호';

COMMENT ON COLUMN MY_SCHEMA.s2_coment.co_coment IS '코멘트';

COMMENT ON COLUMN MY_SCHEMA.s2_coment.co_regdate IS '등록일';

ALTER TABLE MY_SCHEMA.s2_list
	ADD
		CONSTRAINT FK_s2_zipcode_TO_s2_list
		FOREIGN KEY (
			zip_seq
		)
		REFERENCES MY_SCHEMA.s2_zipcode (
			zip_seq
		);

ALTER TABLE MY_SCHEMA.s1_pd
	ADD
		CONSTRAINT FK_s1_category_TO_s1_pd
		FOREIGN KEY (
			cate_no
		)
		REFERENCES MY_SCHEMA.s1_category (
			cate_no
		);

ALTER TABLE MY_SCHEMA.s1_to
	ADD
		CONSTRAINT FK_s1_od_TO_s1_to
		FOREIGN KEY (
			od_number
		)
		REFERENCES MY_SCHEMA.s1_od (
			od_number
		)
		ON DELETE CASCADE;

ALTER TABLE MY_SCHEMA.s1_oddt
	ADD
		CONSTRAINT FK_s1_od_TO_s1_oddt
		FOREIGN KEY (
			od_number
		)
		REFERENCES MY_SCHEMA.s1_od (
			od_number
		)
		ON DELETE CASCADE;

ALTER TABLE MY_SCHEMA.s1_oddt
	ADD
		CONSTRAINT FK_s1_pd_TO_s1_oddt
		FOREIGN KEY (
			pd_no
		)
		REFERENCES MY_SCHEMA.s1_pd (
			pd_no
		);

ALTER TABLE MY_SCHEMA.s1_oding
	ADD
		CONSTRAINT FK_s1_od_TO_s1_oding
		FOREIGN KEY (
			od_number
		)
		REFERENCES MY_SCHEMA.s1_od (
			od_number
		)
		ON DELETE CASCADE;

ALTER TABLE MY_SCHEMA.s2_store
	ADD
		CONSTRAINT FK_s2_list_TO_s2_store
		FOREIGN KEY (
			list_no
		)
		REFERENCES MY_SCHEMA.s2_list (
			list_no
		);

ALTER TABLE MY_SCHEMA.s2_menu
	ADD
		CONSTRAINT FK_s2_store_TO_s2_menu
		FOREIGN KEY (
			st_no
		)
		REFERENCES MY_SCHEMA.s2_store (
			st_no
		);

ALTER TABLE MY_SCHEMA.s2_review
	ADD
		CONSTRAINT FK_s2_store_TO_s2_review
		FOREIGN KEY (
			st_no
		)
		REFERENCES MY_SCHEMA.s2_store (
			st_no
		);

ALTER TABLE MY_SCHEMA.s2_review
	ADD
		CONSTRAINT FK_s2_mem_TO_s2_review
		FOREIGN KEY (
			mem_no
		)
		REFERENCES MY_SCHEMA.s2_mem (
			mem_no
		);

ALTER TABLE MY_SCHEMA.s2_coment
	ADD
		CONSTRAINT FK_s2_review_TO_s2_coment
		FOREIGN KEY (
			re_no
		)
		REFERENCES MY_SCHEMA.s2_review (
			re_no
		);

ALTER TABLE MY_SCHEMA.s2_coment
	ADD
		CONSTRAINT FK_s2_mem_TO_s2_coment
		FOREIGN KEY (
			mem_no
		)
		REFERENCES MY_SCHEMA.s2_mem (
			mem_no
		);
