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
        
ALTER TABLE s2_board
	DROP
		CONSTRAINT FK_s2_boardType_TO_s2_board
		CASCADE;

ALTER TABLE s2_comment
	DROP
		CONSTRAINT FK_s2_board_TO_s2_comment
		CASCADE;
        
ALTER TABLE s2_board
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE s2_boardType
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE s2_comment
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

/* 리스트 */
DROP TABLE s2_list 
	CASCADE CONSTRAINTS;

/* 회원정보 */
DROP TABLE s2_mem 
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

/* 주소정보 */
DROP TABLE s2_zipcode 
	CASCADE CONSTRAINTS;

/* 가게좋아요 */
DROP TABLE s2_storelike 
	CASCADE CONSTRAINTS;

/* 리뷰좋아요 */
DROP TABLE s2_reviewlike 
	CASCADE CONSTRAINTS;

/* 방문자수 */
DROP TABLE s2_visit 
	CASCADE CONSTRAINTS;

/* 리스트연결 */
DROP TABLE s2_listcon 
	CASCADE CONSTRAINTS;

/* 리스트그룹 */
DROP TABLE s2_listgroup 
	CASCADE CONSTRAINTS;
    
DROP TABLE s2_board 
	CASCADE CONSTRAINTS;

/* 게시판 타입 */
DROP TABLE s2_boardType 
	CASCADE CONSTRAINTS;

/* 댓글 */
DROP TABLE s2_comment 
	CASCADE CONSTRAINTS;

/* 리스트 */
CREATE TABLE s2_list (
	list_no NUMBER NOT NULL, /* 리스트번호 */
	list_name VARCHAR2(60), /* 리스트이름 */
	list_pic CLOB, /* 지역사진 */
	list_comment CLOB, /* 코멘트 */
	group_no NUMBER /* 그룹번호 */
);

ALTER TABLE s2_list
	ADD
		CONSTRAINT PK_s2_list
		PRIMARY KEY (
			list_no
		);

/* 회원정보 */
CREATE TABLE s2_mem (
	mem_no NUMBER NOT NULL, /* 회원번호 */
	mem_name VARCHAR2(20) NOT NULL, /* 이름 */
	mem_id VARCHAR2(20) NOT NULL, /* ID */
	mem_pw VARCHAR2(20) NOT NULL, /* PW */
	mem_birth VARCHAR2(20), /* 생년월일 */
	mem_tel VARCHAR2(30), /* 전화번호 */
    mem_zipcode varchar2(20), /* 우편번호 */
	mem_add CLOB, /* 주소 */
    mem_add2 varchar2(100), /* 상세주소*/
	mem_pic CLOB, /* 프로필사진 */
    mem_manager VARCHAR2(6) /*관리자*/
);

ALTER TABLE s2_mem
	ADD
		CONSTRAINT PK_s2_mem
		PRIMARY KEY (
			mem_no
		);

/* 맛집 */
CREATE TABLE s2_store (
	st_no NUMBER NOT NULL, /* 맛집번호 */
	st_name VARCHAR2(200), /* 이름 */
	st_add CLOB, /* 주소 */
	st_tel VARCHAR2(30), /* 전화번호 */
	st_kind VARCHAR2(100), /* 음식종류 */
	st_price VARCHAR2(30), /* 가격대 */
	st_parking VARCHAR2(4), /* 주차 */
	st_time VARCHAR(30), /* 영업시간 */
	st_restday VARCHAR(10), /* 휴일 */
	st_preview CLOB, /* 식당소개 */
	st_regdate DATE DEFAULT sysdate, /* 등록일 */
	st_pic CLOB, /* 맛집사진 */
	st_like NUMBER, /* 좋아요 */
	st_locationlati VARCHAR2(50), /* 위도 */
    st_locationlongi VARCHAR(50) /* 경도 */
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
	menu_name VARCHAR2(30), /* 메뉴이름 */
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
	re_regdate DATE DEFAULT sysdate, /* 등록일 */
	re_like NUMBER /* 좋아요 */
);

ALTER TABLE s2_review
	ADD
		CONSTRAINT PK_s2_review
		PRIMARY KEY (
			re_no
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

/* 가게좋아요 */
CREATE TABLE s2_storelike (
	mem_no NUMBER, /* 회원번호 */
	st_no NUMBER /* 맛집번호 */
);

/* 리뷰좋아요 */
CREATE TABLE s2_reviewlike (
	mem_no NUMBER, /* 회원번호 */
	re_no NUMBER /* 리뷰번호 */
);

/* 방문자수 */
CREATE TABLE s2_visit (
	visit_date DATE /* 방문시간 */
);

/* 리스트연결 */
CREATE TABLE s2_listcon (
	st_no NUMBER, /* 맛집번호 */
	list_no NUMBER /* 리스트번호 */
);

/* 리스트그룹 */
CREATE TABLE s2_listgroup (
	group_no NUMBER NOT NULL, /* 그룹번호 */
	group_name VARCHAR2(60) /* 그룹이름 */
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
		) on delete cascade;

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
        
/* 게시판 타입 */
CREATE TABLE s2_boardType (
	btype NUMBER NOT NULL, /* 타입 번호 */
	btype_name VARCHAR2(100) /* 타입 이름 */
);

ALTER TABLE s2_boardType
	ADD
		CONSTRAINT PK_s2_boardType
		PRIMARY KEY (
			btype
		);
        
create table s2_board
(
    no         number		primary key,      --번호
    id         varchar2(20)      not null,            --아이디    
    pwd        varchar2(20)	 not null,             --비밀번호
    title       varchar2(100)	not  null,            --제목
    regdate      date			default  sysdate,      --작성일
    readcount  number		default 0     null,      --조회수
    content      clob			null,			--내용
	groupNo  	number      	default 0,       	--그룹번호
	step	   	number       	default 0,	  	--글의 단계 
	sortNo 	number       	default 0,   	--글의 정렬순서
	delFlag    	char			default 'N',	 --삭제 Flag  
    btype number
);



CREATE TABLE s2_comment (
    no             number        primary key,    --번호
    id           varchar2(20)    not null,            --이름    
    pwd             varchar2(20)    not null,            --비밀번호
    regdate         date        default  sysdate,    --작성일
    content         varchar2(2000)         null,            --내용
    bdNo            number references s2_board(no) on delete cascade not null        --원본 게시판 글번호    
    --boardName	varchar2(50)		null	-- 게시판이름 : reboard, upboard
);


ALTER TABLE s2_board
	ADD
		CONSTRAINT FK_s2_boardType_TO_s2_board
		FOREIGN KEY (
			btype
		)
		REFERENCES s2_boardType (
			btype
		);


create or replace procedure s2_boardDelete 
(
--매개변수
    p_groupNo number,
    p_step    number,
    p_no  number
)
is
--변수선언부
cnt number;

begin
    --[1] 원본글인 경우
    if p_step=0 then
        --답변이 존재하는지 체크
        select count(*) into cnt 
        from s2_board
        where groupno=p_groupNo;
        
        --1) 답변이 존재하면
        if cnt>1 then
            update s2_board 
            set delflag='Y'
            where no=p_no;
        else --2) 답변이 없으면
            delete from s2_board --삭제 
            where no=p_no;
        end if;
    else --[2] 답변글인 경우
        delete from s2_board
        where no=p_no;
        
        --답변을 삭제 후 남아있는 글이 1개인지 체크
        select count(*) into cnt 
        from s2_board 
        where groupno=p_groupNo;    
        
        if cnt=1 then
        /*
        --남아있는 글인가? 삭제 가능한 글인가?
        if cnt=1 then 
            --남아있는 글이 원본글이면서 삭제된 글이라면
            select count(*) into cnt from reboard
            where groupno=p_groupNo and delflag='Y' and step=0;
            
            if cnt=1 then
                --원본글도 delete
                 delete from reboard
                 where groupno=p_groupNo;
            end if;
            */
            delete from s2_board a
            where exists(select 1 from s2_board b
                            where a.no=b.no
                             and groupno=p_groupNo and delflag='Y' and step=0);
            
         end if;
    end if;
    
    commit;

EXCEPTION
    WHEN OTHERS THEN
        raise_application_error(-20001, '답변형 게시판 글삭제 실패!');
        ROLLBACK;
end;