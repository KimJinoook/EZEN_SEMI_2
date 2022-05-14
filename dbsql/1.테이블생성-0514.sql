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

ALTER TABLE s2_list
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

ALTER TABLE s2_zipcode
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;
        


/* ��������Ʈ */
DROP TABLE s2_list 
	CASCADE CONSTRAINTS;

/* ȸ������ */
DROP TABLE s2_mem 
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

/* �ּ����� */
DROP TABLE s2_zipcode 
	CASCADE CONSTRAINTS;
    
DROP TABLE s2_storelike
	CASCADE CONSTRAINTS;
    
DROP TABLE s2_reviewlike
	CASCADE CONSTRAINTS;
    
DROP TABLE s2_visit
	CASCADE CONSTRAINTS;

/* ��������Ʈ */
CREATE TABLE s2_list (
	list_no NUMBER NOT NULL, /* ����Ʈ��ȣ */
	list_name VARCHAR(60), /* ����Ʈ�̸� */
	list_pic CLOB, /* �������� */
	list_coment CLOB /* �ڸ�Ʈ */
);

ALTER TABLE s2_list
	ADD
		CONSTRAINT PK_s2_list
		PRIMARY KEY (
			list_no
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
	list_no NUMBER, /* ����Ʈ��ȣ */
	st_like NUMBER, /* ���ƿ� */
    st_location VARCHAR(50) /* �����浵 */
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
	re_regdate DATE DEFAULT sysdate, /* ����� */
	re_like NUMBER /* ���ƿ� */
);

ALTER TABLE s2_review
	ADD
		CONSTRAINT PK_s2_review
		PRIMARY KEY (
			re_no
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

CREATE TABLE s2_storelike (
    mem_no NUMBER,
    st_no NUMBER
);

CREATE TABLE s2_reviewlike (
    mem_no NUMBER,
    re_no NUMBER
);

CREATE TABLE s2_visit (
    visit_date DATE
);

ALTER TABLE s2_zipcode
	ADD
		CONSTRAINT PK_s2_zipcode
		PRIMARY KEY (
			zip_seq
		);

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