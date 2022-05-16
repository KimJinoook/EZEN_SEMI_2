ALTER TABLE s2_list
	DROP
		CONSTRAINT FK_s2_listgroup_TO_s2_list
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

ALTER TABLE s2_storelike
	DROP
		CONSTRAINT FK_s2_mem_TO_s2_storelike
		CASCADE;

ALTER TABLE s2_storelike
	DROP
		CONSTRAINT FK_s2_store_TO_s2_storelike
		CASCADE;

ALTER TABLE s2_reviewlike
	DROP
		CONSTRAINT FK_s2_mem_TO_s2_reviewlike
		CASCADE;

ALTER TABLE s2_reviewlike
	DROP
		CONSTRAINT FK_s2_review_TO_s2_reviewlike
		CASCADE;

ALTER TABLE s2_listcon
	DROP
		CONSTRAINT FK_s2_store_TO_s2_listcon
		CASCADE;

ALTER TABLE s2_listcon
	DROP
		CONSTRAINT FK_s2_list_TO_s2_listcon
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

ALTER TABLE s2_listgroup
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

/* ����Ʈ */
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

/* �������ƿ� */
DROP TABLE s2_storelike 
	CASCADE CONSTRAINTS;

/* �������ƿ� */
DROP TABLE s2_reviewlike 
	CASCADE CONSTRAINTS;

/* �湮�ڼ� */
DROP TABLE s2_visit 
	CASCADE CONSTRAINTS;

/* ����Ʈ���� */
DROP TABLE s2_listcon 
	CASCADE CONSTRAINTS;

/* ����Ʈ�׷� */
DROP TABLE s2_listgroup 
	CASCADE CONSTRAINTS;

/* ����Ʈ */
CREATE TABLE s2_list (
	list_no NUMBER NOT NULL, /* ����Ʈ��ȣ */
	list_name VARCHAR(60), /* ����Ʈ�̸� */
	list_pic CLOB, /* �������� */
	list_comment CLOB, /* �ڸ�Ʈ */
	group_no NUMBER /* �׷��ȣ */
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
    mem_zipcode varchar2(20), /* �����ȣ */
	mem_add CLOB, /* �ּ� */
    mem_add2 varchar2(50), /* ���ּ�*/
	mem_pic CLOB, /* �����ʻ��� */
    mem_manager VARCHAR2(6) /*������*/
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
	st_like NUMBER, /* ���ƿ� */
	st_locationlati VARCHAR(50), /* ���� */
    st_locationlongi VARCHAR(50) /* �浵 */
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

ALTER TABLE s2_zipcode
	ADD
		CONSTRAINT PK_s2_zipcode
		PRIMARY KEY (
			zip_seq
		);

/* �������ƿ� */
CREATE TABLE s2_storelike (
	mem_no NUMBER, /* ȸ����ȣ */
	st_no NUMBER /* ������ȣ */
);

/* �������ƿ� */
CREATE TABLE s2_reviewlike (
	mem_no NUMBER, /* ȸ����ȣ */
	re_no NUMBER /* �����ȣ */
);

/* �湮�ڼ� */
CREATE TABLE s2_visit (
	visit_date DATE /* �湮�ð� */
);

/* ����Ʈ���� */
CREATE TABLE s2_listcon (
	st_no NUMBER, /* ������ȣ */
	list_no NUMBER /* ����Ʈ��ȣ */
);

/* ����Ʈ�׷� */
CREATE TABLE s2_listgroup (
	group_no NUMBER NOT NULL, /* �׷��ȣ */
	group_name VARCHAR(60) /* �׷��̸� */
);

ALTER TABLE s2_listgroup
	ADD
		CONSTRAINT PK_s2_listgroup
		PRIMARY KEY (
			group_no
		);

ALTER TABLE s2_list
	ADD
		CONSTRAINT FK_s2_listgroup_TO_s2_list
		FOREIGN KEY (
			group_no
		)
		REFERENCES s2_listgroup (
			group_no
		);

ALTER TABLE s2_menu
	ADD
		CONSTRAINT FK_s2_store_TO_s2_menu
		FOREIGN KEY (
			st_no
		)
		REFERENCES s2_store (
			st_no
		) on delete cascade;

ALTER TABLE s2_review
	ADD
		CONSTRAINT FK_s2_store_TO_s2_review
		FOREIGN KEY (
			st_no
		)
		REFERENCES s2_store (
			st_no
		) on delete cascade;

ALTER TABLE s2_review
	ADD
		CONSTRAINT FK_s2_mem_TO_s2_review
		FOREIGN KEY (
			mem_no
		)
		REFERENCES s2_mem (
			mem_no
		) on delete cascade;

ALTER TABLE s2_storelike
	ADD
		CONSTRAINT FK_s2_mem_TO_s2_storelike
		FOREIGN KEY (
			mem_no
		)
		REFERENCES s2_mem (
			mem_no
		) on delete cascade;

ALTER TABLE s2_storelike
	ADD
		CONSTRAINT FK_s2_store_TO_s2_storelike
		FOREIGN KEY (
			st_no
		)
		REFERENCES s2_store (
			st_no
		) on delete cascade;

ALTER TABLE s2_reviewlike
	ADD
		CONSTRAINT FK_s2_mem_TO_s2_reviewlike
		FOREIGN KEY (
			mem_no
		)
		REFERENCES s2_mem (
			mem_no
		) on delete cascade;

ALTER TABLE s2_reviewlike
	ADD
		CONSTRAINT FK_s2_review_TO_s2_reviewlike
		FOREIGN KEY (
			re_no
		)
		REFERENCES s2_review (
			re_no
		) on delete cascade;

ALTER TABLE s2_listcon
	ADD
		CONSTRAINT FK_s2_store_TO_s2_listcon
		FOREIGN KEY (
			st_no
		)
		REFERENCES s2_store (
			st_no
		) on delete cascade;

ALTER TABLE s2_listcon
	ADD
		CONSTRAINT FK_s2_list_TO_s2_listcon
		FOREIGN KEY (
			list_no
		)
		REFERENCES s2_list (
			list_no
		) on delete cascade;
        