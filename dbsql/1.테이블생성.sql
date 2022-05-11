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

/* ��������Ʈ */
DROP TABLE s2_list 
	CASCADE CONSTRAINTS;

/* �ּ����� */
DROP TABLE s2_zipcode 
	CASCADE CONSTRAINTS;

/* ��ǰī�װ� */
DROP TABLE s1_category 
	CASCADE CONSTRAINTS;

/* ��ǰ���� */
DROP TABLE s1_pd 
	CASCADE CONSTRAINTS;

/* �������� */
DROP TABLE s1_to 
	CASCADE CONSTRAINTS;

/* �ֹ����� */
DROP TABLE s1_od 
	CASCADE CONSTRAINTS;

/* �ֹ��������� */
DROP TABLE s1_oddt 
	CASCADE CONSTRAINTS;

/* ȸ������ */
DROP TABLE s2_mem 
	CASCADE CONSTRAINTS;

/* ������Ȳ */
DROP TABLE s1_cal 
	CASCADE CONSTRAINTS;

/* �����ֹ����� */
DROP TABLE s1_oding 
	CASCADE CONSTRAINTS;

/* ���� */
DROP TABLE s2_store 
	CASCADE CONSTRAINTS;

/* �޴� */
DROP TABLE s2_menu 
	CASCADE CONSTRAINTS;

/* ���� */
DROP TABLE s2_review 
	CASCADE CONSTRAINTS;

/* �����ڸ�Ʈ */
DROP TABLE s2_coment 
	CASCADE CONSTRAINTS;

/* ��������Ʈ */
CREATE TABLE s2_list (
	list_no NUMBER NOT NULL, /* ����Ʈ��ȣ */
	list_name VARCHAR(60), /* ����Ʈ�̸� */
	list_pic CLOB /* �������� */
);

ALTER TABLE s2_list
	ADD
		CONSTRAINT PK_s2_list
		PRIMARY KEY (
			list_no
		);

/* �ּ����� */
CREATE TABLE s2_zipcode (
	zip_code VARCHAR2(20), /* �����ȣ */
	zip_si VARCHAR2(20) NOT NULL, /* �� */
	zip_gugun VARCHAR2(20) NOT NULL, /* ���� */
	zip_dong VARCHAR2(20) NOT NULL, /* �� */
	zip_sbunji VARCHAR2(20), /* ���۹��� */
	zip_ebunji VARCHAR2(20), /* ������ */
	zip_seq NUMBER NOT NULL /* ��ȣ */
);

ALTER TABLE s2_zipcode
	ADD
		CONSTRAINT PK_s2_zipcode
		PRIMARY KEY (
			zip_seq
		);

/* ��ǰī�װ� */
CREATE TABLE s1_category (
	cate_no NUMBER NOT NULL, /* ī�װ���ȣ */
	cate_name VARCHAR2(20) NOT NULL /* ī�װ��� */
);

ALTER TABLE s1_category
	ADD
		CONSTRAINT PK_s1_category
		PRIMARY KEY (
			cate_no
		);

/* ��ǰ���� */
CREATE TABLE s1_pd (
	cate_no NUMBER, /* ī�װ���ȣ */
	pd_no NUMBER NOT NULL, /* ��ǰ��ȣ */
	pd_name VARCHAR2(20) NOT NULL, /* ��ǰ�� */
	pd_price NUMBER NOT NULL, /* ��ǰ���� */
	pd_img CLOB /* �̹��� */
);

ALTER TABLE s1_pd
	ADD
		CONSTRAINT PK_s1_pd
		PRIMARY KEY (
			pd_no
		);

/* �������� */
CREATE TABLE s1_to (
	od_number NUMBER, /* �ֹ���ȣ */
	to_total NUMBER NOT NULL, /* �ǸŰ��� */
	to_date DATE NOT NULL, /* �Ǹ����� */
	to_pay VARCHAR2(20) NOT NULL /* �������� */
);

/* �ֹ����� */
CREATE TABLE s1_od (
	od_number NUMBER NOT NULL, /* �ֹ���ȣ */
	od_total NUMBER NOT NULL, /* �ǸŰ��� */
	od_date DATE NOT NULL /* �ֹ����� */
);

ALTER TABLE s1_od
	ADD
		CONSTRAINT PK_s1_od
		PRIMARY KEY (
			od_number
		);

/* �ֹ��������� */
CREATE TABLE s1_oddt (
	od_number NUMBER NOT NULL, /* �ֹ���ȣ */
	pd_no NUMBER NOT NULL, /* ��ǰ��ȣ */
	oddt_cnt NUMBER, /* ���� */
	oddt_io VARCHAR2(2), /* �����̿뿩�� */
	oddt_ice VARCHAR2(2), /* ���� */
	oddt_shot VARCHAR2(2) /* ���߰� */
);

/* ȸ������ */
CREATE TABLE s2_mem (
	mem_no NUMBER NOT NULL, /* ȸ����ȣ */
	mem_name VARCHAR2(20) NOT NULL, /* �̸� */
	mem_id VARCHAR2(20) NOT NULL, /* ID */
	mem_pw VARCHAR2(20) NOT NULL, /* PW */
	mem_birth VARCHAR2(20), /* ������� */
	mem_tel VARCHAR2(30), /* ��ȭ��ȣ */
	mem_add CLOB, /* �ּ� */
	mem_pic CLOB /* �����ʻ��� */
);

ALTER TABLE s2_mem
	ADD
		CONSTRAINT PK_s2_mem
		PRIMARY KEY (
			mem_no
		);

/* ������Ȳ */
CREATE TABLE s1_cal (
	cal_scash NUMBER, /* �����غ�� */
	cal_ecash NUMBER, /* �������� */
	cal_ecard NUMBER, /* ����ī�� */
	cal_sum NUMBER, /* �������� */
	cal_date DATE /* ������ */
);

/* �����ֹ����� */
CREATE TABLE s1_oding (
	od_number NUMBER /* �ֹ���ȣ */
);

/* ���� */
CREATE TABLE s2_store (
	st_no NUMBER NOT NULL, /* ������ȣ */
	st_name VARCHAR(30), /* �̸� */
	st_add CLOB, /* �ּ� */
	st_tel VARCHAR(30), /* ��ȭ��ȣ */
	st_kind VARCHAR(30), /* �������� */
	st_price VARCHAR(30), /* ���ݴ� */
	st_parking VARCHAR(4), /* ���� */
	st_time VARCHAR(30), /* �����ð� */
	st_restday VARCHAR(10), /* ���� */
	st_preview CLOB, /* �Ĵ�Ұ� */
	st_regdate DATE DEFAULT sysdate, /* ����� */
	st_pic CLOB, /* �������� */
	list_no NUMBER /* ����Ʈ��ȣ */
);

ALTER TABLE s2_store
	ADD
		CONSTRAINT PK_s2_store
		PRIMARY KEY (
			st_no
		);

/* �޴� */
CREATE TABLE s2_menu (
	st_no NUMBER, /* ������ȣ */
	menu_name VARCHAR(30), /* �޴��̸� */
	menu_price NUMBER, /* ���� */
	menu_pic CLOB /* �޴����� */
);

/* ���� */
CREATE TABLE s2_review (
	re_no NUMBER NOT NULL, /* �����ȣ */
	st_no NUMBER, /* ������ȣ */
	mem_no NUMBER, /* ȸ����ȣ */
	re_review CLOB, /* ���� */
	re_score NUMBER, /* ���� */
	re_regdate DATE DEFAULT sysdate /* ����� */
);

ALTER TABLE s2_review
	ADD
		CONSTRAINT PK_s2_review
		PRIMARY KEY (
			re_no
		);

/* �����ڸ�Ʈ */
CREATE TABLE s2_coment (
	re_no NUMBER, /* �����ȣ */
	mem_no NUMBER, /* ȸ����ȣ */
	co_coment CLOB, /* �ڸ�Ʈ */
	co_regdate DATE DEFAULT sysdate /* ����� */
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