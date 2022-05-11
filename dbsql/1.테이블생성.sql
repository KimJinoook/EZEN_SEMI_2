ALTER TABLE s1_pd
	DROP
		CONSTRAINT FK_s1_category_TO_s1_pd
		CASCADE;

ALTER TABLE s1_to
	DROP
		CONSTRAINT FK_s1_od_TO_s1_to
		CASCADE;

ALTER TABLE s1_oddt
	DROP
		CONSTRAINT FK_s1_od_TO_s1_oddt
		CASCADE;

ALTER TABLE s1_oddt
	DROP
		CONSTRAINT FK_s1_pd_TO_s1_oddt
		CASCADE;

ALTER TABLE s1_oding
	DROP
		CONSTRAINT FK_s1_od_TO_s1_oding
		CASCADE;

ALTER TABLE s2_store
	DROP
		CONSTRAINT FK_s2_list_TO_s2_store
		CASCADE;

ALTER TABLE s2_menu
	DROP
		CONSTRAINT FK_s2_store_TO_s2_menu
		CASCADE;

ALTER TABLE s2_review
	DROP
		CONSTRAINT FK_s2_store_TO_s2_review
		CASCADE;

ALTER TABLE s2_review
	DROP
		CONSTRAINT FK_s2_mem_TO_s2_review
		CASCADE;

ALTER TABLE s2_coment
	DROP
		CONSTRAINT FK_s2_review_TO_s2_coment
		CASCADE;

ALTER TABLE s2_coment
	DROP
		CONSTRAINT FK_s2_mem_TO_s2_coment
		CASCADE;

ALTER TABLE s2_list
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE s2_zipcode
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE s1_category
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE s1_pd
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE s1_od
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE s2_mem
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE s2_store
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE s2_review
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

/* 지역리스트 */
DROP TABLE s2_list 
	CASCADE CONSTRAINTS;

/* 주소정보 */
DROP TABLE s2_zipcode 
	CASCADE CONSTRAINTS;

/* 상품카테고리 */
DROP TABLE s1_category 
	CASCADE CONSTRAINTS;

/* 상품정보 */
DROP TABLE s1_pd 
	CASCADE CONSTRAINTS;

/* 매출정보 */
DROP TABLE s1_to 
	CASCADE CONSTRAINTS;

/* 주문정보 */
DROP TABLE s1_od 
	CASCADE CONSTRAINTS;

/* 주문상제정보 */
DROP TABLE s1_oddt 
	CASCADE CONSTRAINTS;

/* 회원정보 */
DROP TABLE s2_mem 
	CASCADE CONSTRAINTS;

/* 정산현황 */
DROP TABLE s1_cal 
	CASCADE CONSTRAINTS;

/* 진행주문정보 */
DROP TABLE s1_oding 
	CASCADE CONSTRAINTS;

/* 맛집 */
DROP TABLE s2_store 
	CASCADE CONSTRAINTS;

/* 메뉴 */
DROP TABLE s2_menu 
	CASCADE CONSTRAINTS;

/* 리뷰 */
DROP TABLE s2_review 
	CASCADE CONSTRAINTS;

/* 리뷰코멘트 */
DROP TABLE s2_coment 
	CASCADE CONSTRAINTS;

/* 지역리스트 */
CREATE TABLE s2_list (
	list_no NUMBER NOT NULL, /* 리스트번호 */
	list_name VARCHAR(60), /* 리스트이름 */
	list_pic CLOB /* 지역사진 */
);

ALTER TABLE s2_list
	ADD
		CONSTRAINT PK_s2_list
		PRIMARY KEY (
			list_no
		);

/* 주소정보 */
CREATE TABLE s2_zipcode (
	zip_code VARCHAR2(20), /* 우편번호 */
	zip_si VARCHAR2(20) NOT NULL, /* 시 */
	zip_gugun VARCHAR2(20) NOT NULL, /* 구군 */
	zip_dong VARCHAR2(20) NOT NULL, /* 동 */
	zip_sbunji VARCHAR2(20), /* 시작번지 */
	zip_ebunji VARCHAR2(20), /* 끝번지 */
	zip_seq NUMBER NOT NULL /* 번호 */
);

ALTER TABLE s2_zipcode
	ADD
		CONSTRAINT PK_s2_zipcode
		PRIMARY KEY (
			zip_seq
		);

/* 상품카테고리 */
CREATE TABLE s1_category (
	cate_no NUMBER NOT NULL, /* 카테고리번호 */
	cate_name VARCHAR2(20) NOT NULL /* 카테고리명 */
);

ALTER TABLE s1_category
	ADD
		CONSTRAINT PK_s1_category
		PRIMARY KEY (
			cate_no
		);

/* 상품정보 */
CREATE TABLE s1_pd (
	cate_no NUMBER, /* 카테고리번호 */
	pd_no NUMBER NOT NULL, /* 상품번호 */
	pd_name VARCHAR2(20) NOT NULL, /* 상품명 */
	pd_price NUMBER NOT NULL, /* 상품가격 */
	pd_img CLOB /* 이미지 */
);

ALTER TABLE s1_pd
	ADD
		CONSTRAINT PK_s1_pd
		PRIMARY KEY (
			pd_no
		);

/* 매출정보 */
CREATE TABLE s1_to (
	od_number NUMBER, /* 주문번호 */
	to_total NUMBER NOT NULL, /* 판매가격 */
	to_date DATE NOT NULL, /* 판매일자 */
	to_pay VARCHAR2(20) NOT NULL /* 결제수단 */
);

/* 주문정보 */
CREATE TABLE s1_od (
	od_number NUMBER NOT NULL, /* 주문번호 */
	od_total NUMBER NOT NULL, /* 판매가격 */
	od_date DATE NOT NULL /* 주문일자 */
);

ALTER TABLE s1_od
	ADD
		CONSTRAINT PK_s1_od
		PRIMARY KEY (
			od_number
		);

/* 주문상제정보 */
CREATE TABLE s1_oddt (
	od_number NUMBER NOT NULL, /* 주문번호 */
	pd_no NUMBER NOT NULL, /* 상품번호 */
	oddt_cnt NUMBER, /* 수량 */
	oddt_io VARCHAR2(2), /* 매장이용여부 */
	oddt_ice VARCHAR2(2), /* 얼음 */
	oddt_shot VARCHAR2(2) /* 샷추가 */
);

/* 회원정보 */
CREATE TABLE s2_mem (
	mem_no NUMBER NOT NULL, /* 회원번호 */
	mem_name VARCHAR2(20) NOT NULL, /* 이름 */
	mem_id VARCHAR2(20) NOT NULL, /* ID */
	mem_pw VARCHAR2(20) NOT NULL, /* PW */
	mem_birth VARCHAR2(20), /* 생년월일 */
	mem_tel VARCHAR2(30), /* 전화번호 */
	mem_add CLOB, /* 주소 */
	mem_pic CLOB /* 프로필사진 */
);

ALTER TABLE s2_mem
	ADD
		CONSTRAINT PK_s2_mem
		PRIMARY KEY (
			mem_no
		);

/* 정산현황 */
CREATE TABLE s1_cal (
	cal_scash NUMBER, /* 개점준비금 */
	cal_ecash NUMBER, /* 마감현금 */
	cal_ecard NUMBER, /* 마감카드 */
	cal_sum NUMBER, /* 당일정산 */
	cal_date DATE /* 마감일 */
);

/* 진행주문정보 */
CREATE TABLE s1_oding (
	od_number NUMBER /* 주문번호 */
);

/* 맛집 */
CREATE TABLE s2_store (
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

ALTER TABLE s2_store
	ADD
		CONSTRAINT PK_s2_store
		PRIMARY KEY (
			st_no
		);

/* 메뉴 */
CREATE TABLE s2_menu (
	st_no NUMBER, /* 맛집번호 */
	menu_name VARCHAR(30), /* 메뉴이름 */
	menu_price NUMBER, /* 가격 */
	menu_pic CLOB /* 메뉴사진 */
);

/* 리뷰 */
CREATE TABLE s2_review (
	re_no NUMBER NOT NULL, /* 리뷰번호 */
	st_no NUMBER, /* 맛집번호 */
	mem_no NUMBER, /* 회원번호 */
	re_review CLOB, /* 리뷰 */
	re_score NUMBER, /* 평점 */
	re_regdate DATE DEFAULT sysdate /* 등록일 */
);

ALTER TABLE s2_review
	ADD
		CONSTRAINT PK_s2_review
		PRIMARY KEY (
			re_no
		);

/* 리뷰코멘트 */
CREATE TABLE s2_coment (
	re_no NUMBER, /* 리뷰번호 */
	mem_no NUMBER, /* 회원번호 */
	co_coment CLOB, /* 코멘트 */
	co_regdate DATE DEFAULT sysdate /* 등록일 */
);

ALTER TABLE s1_pd
	ADD
		CONSTRAINT FK_s1_category_TO_s1_pd
		FOREIGN KEY (
			cate_no
		)
		REFERENCES s1_category (
			cate_no
		);

ALTER TABLE s1_to
	ADD
		CONSTRAINT FK_s1_od_TO_s1_to
		FOREIGN KEY (
			od_number
		)
		REFERENCES s1_od (
			od_number
		)
		ON DELETE CASCADE;

ALTER TABLE s1_oddt
	ADD
		CONSTRAINT FK_s1_od_TO_s1_oddt
		FOREIGN KEY (
			od_number
		)
		REFERENCES s1_od (
			od_number
		)
		ON DELETE CASCADE;

ALTER TABLE s1_oddt
	ADD
		CONSTRAINT FK_s1_pd_TO_s1_oddt
		FOREIGN KEY (
			pd_no
		)
		REFERENCES s1_pd (
			pd_no
		);

ALTER TABLE s1_oding
	ADD
		CONSTRAINT FK_s1_od_TO_s1_oding
		FOREIGN KEY (
			od_number
		)
		REFERENCES s1_od (
			od_number
		)
		ON DELETE CASCADE;

ALTER TABLE s2_store
	ADD
		CONSTRAINT FK_s2_list_TO_s2_store
		FOREIGN KEY (
			list_no
		)
		REFERENCES s2_list (
			list_no
		);

ALTER TABLE s2_menu
	ADD
		CONSTRAINT FK_s2_store_TO_s2_menu
		FOREIGN KEY (
			st_no
		)
		REFERENCES s2_store (
			st_no
		);

ALTER TABLE s2_review
	ADD
		CONSTRAINT FK_s2_store_TO_s2_review
		FOREIGN KEY (
			st_no
		)
		REFERENCES s2_store (
			st_no
		);

ALTER TABLE s2_review
	ADD
		CONSTRAINT FK_s2_mem_TO_s2_review
		FOREIGN KEY (
			mem_no
		)
		REFERENCES s2_mem (
			mem_no
		);

ALTER TABLE s2_coment
	ADD
		CONSTRAINT FK_s2_review_TO_s2_coment
		FOREIGN KEY (
			re_no
		)
		REFERENCES s2_review (
			re_no
		);

ALTER TABLE s2_coment
	ADD
		CONSTRAINT FK_s2_mem_TO_s2_coment
		FOREIGN KEY (
			mem_no
		)
		REFERENCES s2_mem (
			mem_no
		);