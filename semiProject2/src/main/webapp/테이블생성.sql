ALTER TABLE s2_list
	DROP
		CONSTRAINT FK_s2_zipcode_TO_s2_list
		CASCADE;

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

DROP INDEX PK_s2_list;

DROP INDEX PK_s2_zipcode;

DROP INDEX PK_s1_category;

DROP INDEX PK_s1_pd;

DROP INDEX PK_s1_od;

DROP INDEX PK_s2_mem;

DROP INDEX PK_s2_store;

DROP INDEX PK_s2_review;

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
	list_pic CLOB, /* �������� */
	zip_seq NUMBER /* ��ȣ */
);

COMMENT ON TABLE s2_list IS '��������Ʈ';

COMMENT ON COLUMN s2_list.list_no IS '����Ʈ��ȣ';

COMMENT ON COLUMN s2_list.list_name IS '����Ʈ�̸�';

COMMENT ON COLUMN s2_list.list_pic IS '��������';

COMMENT ON COLUMN s2_list.zip_seq IS '��ȣ';

CREATE UNIQUE INDEX PK_s2_list
	ON s2_list (
		list_no ASC
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

COMMENT ON TABLE s2_zipcode IS '�ּ�����';

COMMENT ON COLUMN s2_zipcode.zip_code IS '�����ȣ';

COMMENT ON COLUMN s2_zipcode.zip_si IS '��';

COMMENT ON COLUMN s2_zipcode.zip_gugun IS '����';

COMMENT ON COLUMN s2_zipcode.zip_dong IS '��';

COMMENT ON COLUMN s2_zipcode.zip_sbunji IS '���۹���';

COMMENT ON COLUMN s2_zipcode.zip_ebunji IS '������';

COMMENT ON COLUMN s2_zipcode.zip_seq IS '��ȣ';

CREATE UNIQUE INDEX PK_s2_zipcode
	ON s2_zipcode (
		zip_seq ASC
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

COMMENT ON TABLE s1_category IS '��ǰī�װ�';

COMMENT ON COLUMN s1_category.cate_no IS 'ī�װ���ȣ';

COMMENT ON COLUMN s1_category.cate_name IS 'ī�װ���';

CREATE UNIQUE INDEX PK_s1_category
	ON s1_category (
		cate_no ASC
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

COMMENT ON TABLE s1_pd IS '��ǰ����';

COMMENT ON COLUMN s1_pd.cate_no IS 'ī�װ���ȣ';

COMMENT ON COLUMN s1_pd.pd_no IS '��ǰ��ȣ';

COMMENT ON COLUMN s1_pd.pd_name IS '��ǰ��';

COMMENT ON COLUMN s1_pd.pd_price IS '��ǰ����';

COMMENT ON COLUMN s1_pd.pd_img IS '�̹���';

CREATE UNIQUE INDEX PK_s1_pd
	ON s1_pd (
		pd_no ASC
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

COMMENT ON TABLE s1_to IS '��������';

COMMENT ON COLUMN s1_to.od_number IS '�ֹ���ȣ';

COMMENT ON COLUMN s1_to.to_total IS '�ǸŰ���';

COMMENT ON COLUMN s1_to.to_date IS '�Ǹ�����';

COMMENT ON COLUMN s1_to.to_pay IS '��������';

/* �ֹ����� */
CREATE TABLE s1_od (
	od_number NUMBER NOT NULL, /* �ֹ���ȣ */
	od_total NUMBER NOT NULL, /* �ǸŰ��� */
	od_date DATE NOT NULL /* �ֹ����� */
);

COMMENT ON TABLE s1_od IS '�ֹ�����';

COMMENT ON COLUMN s1_od.od_number IS '�ֹ���ȣ';

COMMENT ON COLUMN s1_od.od_total IS '�ǸŰ���';

COMMENT ON COLUMN s1_od.od_date IS '�ֹ�����';

CREATE UNIQUE INDEX PK_s1_od
	ON s1_od (
		od_number ASC
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

COMMENT ON TABLE s1_oddt IS '�ֹ���������';

COMMENT ON COLUMN s1_oddt.od_number IS '�ֹ���ȣ';

COMMENT ON COLUMN s1_oddt.pd_no IS '��ǰ��ȣ';

COMMENT ON COLUMN s1_oddt.oddt_cnt IS '����';

COMMENT ON COLUMN s1_oddt.oddt_io IS '�����̿뿩��';

COMMENT ON COLUMN s1_oddt.oddt_ice IS '����';

COMMENT ON COLUMN s1_oddt.oddt_shot IS '���߰�';

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

COMMENT ON TABLE s2_mem IS 'ȸ������';

COMMENT ON COLUMN s2_mem.mem_no IS 'ȸ����ȣ';

COMMENT ON COLUMN s2_mem.mem_name IS '�̸�';

COMMENT ON COLUMN s2_mem.mem_id IS 'ID';

COMMENT ON COLUMN s2_mem.mem_pw IS 'PW';

COMMENT ON COLUMN s2_mem.mem_birth IS '�������';

COMMENT ON COLUMN s2_mem.mem_tel IS '��ȭ��ȣ';

COMMENT ON COLUMN s2_mem.mem_add IS '�ּ�';

COMMENT ON COLUMN s2_mem.mem_pic IS '�����ʻ���';

CREATE UNIQUE INDEX PK_s2_mem
	ON s2_mem (
		mem_no ASC
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

COMMENT ON TABLE s1_cal IS '������Ȳ';

COMMENT ON COLUMN s1_cal.cal_scash IS '�����غ��';

COMMENT ON COLUMN s1_cal.cal_ecash IS '��������';

COMMENT ON COLUMN s1_cal.cal_ecard IS '����ī��';

COMMENT ON COLUMN s1_cal.cal_sum IS '��������';

COMMENT ON COLUMN s1_cal.cal_date IS '������';

/* �����ֹ����� */
CREATE TABLE s1_oding (
	od_number NUMBER /* �ֹ���ȣ */
);

COMMENT ON TABLE s1_oding IS '�����ֹ�����';

COMMENT ON COLUMN s1_oding.od_number IS '�ֹ���ȣ';

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

COMMENT ON TABLE s2_store IS '����';

COMMENT ON COLUMN s2_store.st_no IS '������ȣ';

COMMENT ON COLUMN s2_store.st_name IS '�̸�';

COMMENT ON COLUMN s2_store.st_add IS '�ּ�';

COMMENT ON COLUMN s2_store.st_tel IS '��ȭ��ȣ';

COMMENT ON COLUMN s2_store.st_kind IS '��������';

COMMENT ON COLUMN s2_store.st_price IS '���ݴ�';

COMMENT ON COLUMN s2_store.st_parking IS '����';

COMMENT ON COLUMN s2_store.st_time IS '�����ð�';

COMMENT ON COLUMN s2_store.st_restday IS '����';

COMMENT ON COLUMN s2_store.st_preview IS '�Ĵ�Ұ�';

COMMENT ON COLUMN s2_store.st_regdate IS '�����';

COMMENT ON COLUMN s2_store.st_pic IS '��������';

COMMENT ON COLUMN s2_store.list_no IS '����Ʈ��ȣ';

CREATE UNIQUE INDEX PK_s2_store
	ON s2_store (
		st_no ASC
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

COMMENT ON TABLE s2_menu IS '�޴�';

COMMENT ON COLUMN s2_menu.st_no IS '������ȣ';

COMMENT ON COLUMN s2_menu.menu_name IS '�޴��̸�';

COMMENT ON COLUMN s2_menu.menu_price IS '����';

COMMENT ON COLUMN s2_menu.menu_pic IS '�޴�����';

/* ���� */
CREATE TABLE s2_review (
	re_no NUMBER NOT NULL, /* �����ȣ */
	st_no NUMBER, /* ������ȣ */
	mem_no NUMBER, /* ȸ����ȣ */
	re_review CLOB, /* ���� */
	re_score NUMBER, /* ���� */
	re_regdate DATE DEFAULT sysdate /* ����� */
);

COMMENT ON TABLE s2_review IS '����';

COMMENT ON COLUMN s2_review.re_no IS '�����ȣ';

COMMENT ON COLUMN s2_review.st_no IS '������ȣ';

COMMENT ON COLUMN s2_review.mem_no IS 'ȸ����ȣ';

COMMENT ON COLUMN s2_review.re_review IS '����';

COMMENT ON COLUMN s2_review.re_score IS '����';

COMMENT ON COLUMN s2_review.re_regdate IS '�����';

CREATE UNIQUE INDEX PK_s2_review
	ON s2_review (
		re_no ASC
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

COMMENT ON TABLE s2_coment IS '�����ڸ�Ʈ';

COMMENT ON COLUMN s2_coment.re_no IS '�����ȣ';

COMMENT ON COLUMN s2_coment.mem_no IS 'ȸ����ȣ';

COMMENT ON COLUMN s2_coment.co_coment IS '�ڸ�Ʈ';

COMMENT ON COLUMN s2_coment.co_regdate IS '�����';

ALTER TABLE s2_list
	ADD
		CONSTRAINT FK_s2_zipcode_TO_s2_list
		FOREIGN KEY (
			zip_seq
		)
		REFERENCES s2_zipcode (
			zip_seq
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