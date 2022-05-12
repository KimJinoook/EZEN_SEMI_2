-- 시퀀스 삭제 생성
drop sequence s2_list_seq;

create sequence s2_list_seq
increment by 1
nocache;

drop sequence s2_mem_seq;

create sequence s2_mem_seq
increment by 1
nocache;

drop sequence s2_store_seq;

create sequence s2_store_seq
increment by 1
nocache;

drop sequence s2_review_seq;

create sequence s2_review_seq
increment by 1
nocache;


--리스트 정보
select * from s2_list;

insert into s2_list
values (1,'종로',' ','"종로로 갈까요~ 명동으로 갈까요~" 종로 맛집 선정!');

insert into s2_list
values (2,'마포',' ','"육포, 쥐포, 그리고 마포.." 마포 맛집 선정!');

insert into s2_list
values (3,'서대문',' ','서대문 맛집 선정!');

insert into s2_list
values (4,'송파',' ','"송파송송 계란탁!" 송파 맛집 선정!');

insert into s2_list
values (5,'양천',' ','"양천에도 숨은 맛집이 있다구~" 양천 맛집 선정!');

insert into s2_list
values (6,'중구',' ','"중구가 먹자드나?" 중구 맛집 선정!');

insert into s2_list
values (7,'강남',' ','"다들 이거먹으려고 강남으로 강남?" 강남 맛집 선정!');

insert into s2_list
values (8,'강서',' ','강서 맛집 선정!');


-- 가게정보
select * from s2_store;


insert into s2_store
values (1,'마음을 담아내면','서울 종로구 율곡로3길 79','0507-1313-7668','퓨전 일식','10,000 ~ 20,000','X','11:30 ~ 21:00','무휴','마음을 담아 내면(마담면) 평소에 두딸과 아내가 좋아하던 음식에 마음을 담아 소개하고 싶었습니다.',sysdate,'img/store/1.jpg',1,0);
insert into s2_store
values (2,'백세칼국수','서울 마포구 마포대로 12길 17','02-362-1085','한식','10,000','X','10:00 ~ 22:00','무휴','백세칼국수 입니다',sysdate,'img/store/2.png',2,0);
insert into s2_store
values (3,'황금콩밭','서울 마포구 마포대로16길 9','02-313-2952','한식','10,000~20,000','X','11:30 ~ 22:00','무휴','황금콩밭 입니다',sysdate,'img/store/3.png',2,0);
insert into s2_store
values (4,'소바식당','서울 마포구 동교로9길 28','02-6013-1552','일식','10,000~20,000','X','11:30 ~ 21:00','무휴','점심식사 및 저녁 안주메뉴와 소주,맥주,우리술이 준비 되어 있습니다. 기본적으로 저희 소바식당에서는 식사 메뉴가 유명하나 저녁에는 혼술하기에도, 가볍게 한잔하기에도 아늑한 공간으로 알려져있습니다.',sysdate,'img/store/4.jpg',2,0);
insert into s2_store
values (5,'칭닌','서울 마포구 마포대로24길 4','02-393-6688','일식','10,000~20,000','O','11:30 ~ 00:30','무휴','단체석, 주차, 예약, 무선 인터넷, 남/녀 화장실 구분, 지역화폐(지류형), 지역화폐(카드형), 지역화폐(모바일형), 제로페이, 국민지원금',sysdate,'img/store/5.png',2,0);
insert into s2_store
values (6,'오레노라멘','서울특별시 마포구 독막로6길 14','02-322-3539','일식','만원 미만','X','11:30 ~ 21:00','무휴','휴무시 인스타 공지 예정 인근 유료주차장(당인노상공영주차장)을 이용해주세요 노키즈 존입니다. 중학생부터 입장 가능합니다.',sysdate,'img/store/6.jpg',2,0);
insert into s2_store
values (7,'이치젠 망원본점','서울특별시 마포구 포은로 109 101호','070-7740-0321','일식','만원 ~ 2만원','X','12:00 ~ 21:00','월','매일 신선한기름으로 한분한분 주문과동시에 신선한 재료로 바로 튀겨드립니다.',sysdate,'img/store/7.jpg',2,0);
insert into s2_store
values (8,'목란','서울특별시 서대문구 연희로15길 21',' ','중식','만원 ~ 5만원','X','11:30 ~ 20:00','월','목란 입니다',sysdate,'img/store/8.jpg',3,0);
insert into s2_store
values (9,'더마칸','서울특별시 송파구 올림픽로32길 37-4 1F',' ','동남아','10,000 ~ 15,000','X','17:30 ~ 22:00','일','더마칸 입니다',sysdate,'img/store/9.jpg',4,0);
insert into s2_store
values (10,'창고43','서울 양천구 목동서로 159-1 CBS빌딩 1층','02-2653-0043','한식','10,000 ~ 15,000','X','11:30 ~ 22:00','무휴','창고43 입니다',sysdate,'img/store/10.png',5,0);
insert into s2_store
values (11,'호돈 돈까스','서울 양천구 신월로 132','02-2604-7789','양식','10,000 ~ 15,000','O','11:00 ~ 21:00','무휴','주차, 포장, 배달, 무선 인터넷, 남/녀 화장실 구분, 제로페이, 국민지원금',sysdate,'img/store/11.png',5,0);
insert into s2_store
values (12,'을지 장만옥','서울특별시 중구 을지로12길 12 1F','02-2272-7577','중식','10,000 ~ 20,000','X','17:00 ~ 01:00','일','중국과 홍콩 가정식을 베이스로한 차이니즈 타파스. 작은 접시에 담겨 나오는 합리적이고 건강한 요리와 식사는 8,800원-15,800원 으로 즐기실수 있으며 수제맥주, 와인, 고량주, 소주, 몰트 위스키, 진토닉, 시그니쳐 칵테일 등 많은 주류 또한 준비되어 있습니다. 중국본토와 한국의 중간을 경험하게 될것입니다. 작은접시의 행복 ',sysdate,'img/store/12.jpg',6,0);
insert into s2_store
values (13,'매덕스피자(신사점)','서울특별시 강남구 도산대로 15길 11 1F',' ','양식','40,000 ~ 50,000','X','12:00 ~ 22:00','무휴','매덕스피자 입니다',sysdate,'img/store/13.jpg',7,0);
insert into s2_store
values (14,'미라이','서울특별시 강남구 논현로 153길 24 끌레르빌 1F',' ','일식','20,000 ~ 50,000','X','18:00 ~ 01:00','무휴','미라이 입니다',sysdate,'img/store/14.jpg',7,0);
insert into s2_store
values (15,'조연탄','서울특별시 강서구 곰달래로60길 29',' ','한식','10,000 ~ 20,000','X','13:00 ~ 24:00','무휴','미라이 입니다',sysdate,'img/store/15.jpg',8,0);

-- 메뉴 데이터
select * from s2_menu;

insert into s2_menu
values (1,'마음을담아냉면',9000,' ');
insert into s2_menu
values (1,'마담비빔면',9000,' ');
insert into s2_menu
values (1,'콩국수',11000,' ');
insert into s2_menu
values (1,'살치살 스테이크',19000,' ');
insert into s2_menu
values (1,'목살 스테이크',14000,' ');
insert into s2_menu
values (1,'생연어 덮밥',14000,' ');
insert into s2_menu
values (1,'꼬막 비빔밥',12000,' ');
insert into s2_menu
values (1,'간장새우장',14000,' ');
insert into s2_menu
values (2,'백세칼국수',7000,' ');
insert into s2_menu
values (2,'바지락칼국수',8000,' ');
insert into s2_menu
values (2,'만두국',8000,' ');
insert into s2_menu
values (2,'떡국',7000,' ');
insert into s2_menu
values (3,'두부젓국',25000,' ');
insert into s2_menu
values (3,'짜박두부',34000,' ');
insert into s2_menu
values (3,'냄비두부조림',28000,' ');
insert into s2_menu
values (3,'오모가리 청국장',25000,' ');
insert into s2_menu
values (4,'한우냉소바',16000,' ');
insert into s2_menu
values (4,'우니냉소바',14000,' ');
insert into s2_menu
values (4,'전복냉소바',14000,' ');
insert into s2_menu
values (4,'단새우냉소바',13000,' ');
insert into s2_menu
values (5,'전가복',45000,' ');
insert into s2_menu
values (5,'오륜해삼',45000,' ');
insert into s2_menu
values (5,'해물누룽지탕',35000,' ');
insert into s2_menu
values (6,'토리빠이탄',9000,' ');
insert into s2_menu
values (6,'카라빠이탄',9000,' ');
insert into s2_menu
values (6,'쇼유 라멘',9000,' ');
insert into s2_menu
values (6,'시오 라멘',9000,' ');
insert into s2_menu
values (7,'이치젠텐동',9000,' ');
insert into s2_menu
values (7,'에비텐동',11000,' ');
insert into s2_menu
values (7,'아나고텐동',13000,' ');
insert into s2_menu
values (7,'스페셜텐동',15000,' ');
insert into s2_menu
values (8,'A코스',25000,' ');
insert into s2_menu
values (8,'B코스',30000,' ');
insert into s2_menu
values (8,'C코스',35000,' ');
insert into s2_menu
values (8,'D코스',40000,' ');
insert into s2_menu
values (9,'차퀘테오',12000,' ');
insert into s2_menu
values (9,'페낭 프라운 미',12500,' ');
insert into s2_menu
values (9,'나시고랭 깜풍',12000,' ');
insert into s2_menu
values (9,'깡꿍 블라찬',8500,' ');
insert into s2_menu
values (9,'사바치킨윙',14000,' ');
insert into s2_menu
values (10,'궁중육개장',10000,' ');
insert into s2_menu
values (10,'한우 궁중 미역국',10000,' ');
insert into s2_menu
values (10,'유자육회비빔밥',12000,' ');
insert into s2_menu
values (10,'어탕칼국수',10000,' ');
insert into s2_menu
values (10,'버섯 순두부찌개',10000,' ');
insert into s2_menu
values (10,'매운갈비찜',15000,' ');
insert into s2_menu
values (11,'등심돈가스',8000,' ');
insert into s2_menu
values (11,'안심돈가스',9000,' ');
insert into s2_menu
values (11,'치즈돈가스',9000,' ');
insert into s2_menu
values (11,'호돈세트',9000,' ');
insert into s2_menu
values (11,'라돈세트',9000,' ');
insert into s2_menu
values (12,'진주완자',11800,' ');
insert into s2_menu
values (12,'표고슈마이',9800,' ');
insert into s2_menu
values (12,'지삼선',11500,' ');
insert into s2_menu
values (12,'양배추볶음',7800,' ');
insert into s2_menu
values (12,'마파두부',13800,' ');
insert into s2_menu
values (12,'사천라즈지',13800,' ');
insert into s2_menu
values (13,'페퍼로니',35000,' ');
insert into s2_menu
values (13,'마게리타',39000,' ');
insert into s2_menu
values (13,'초리조',40000,' ');
insert into s2_menu
values (13,'미트볼',42000,' ');
insert into s2_menu
values (14,'계절 사시미',39000,' ');
insert into s2_menu
values (14,'우니',39000,' ');
insert into s2_menu
values (14,'마구로 치즈 아에',18000,' ');
insert into s2_menu
values (14,'사바 이소베 마끼',19000,' ');
insert into s2_menu
values (14,'카니미소 크림 고로케',8000,' ');
insert into s2_menu
values (14,'카키 후라이',19000,' ');
insert into s2_menu
values (15,'제주 먹고기',13000,' ');
insert into s2_menu
values (15,'제주 껍데기',10000,' ');
insert into s2_menu
values (15,'한우 암소 육회',10000,' ');
insert into s2_menu
values (15,'냉면',10000,' ');
insert into s2_menu
values (15,'고기만두',6000,' ');
commit;