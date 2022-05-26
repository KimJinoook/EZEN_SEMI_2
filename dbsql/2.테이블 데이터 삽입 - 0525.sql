-- ������ ���� ����
drop sequence s2_list_seq;

create sequence s2_list_seq
increment by 1
start with 14
nocache;

drop sequence s2_mem_seq;

create sequence s2_mem_seq
increment by 1
start with 10
nocache;

drop sequence s2_store_seq;

create sequence s2_store_seq
start with 16
increment by 1
nocache;

drop sequence s2_review_seq;

create sequence s2_review_seq
start with 29
increment by 1
nocache;

drop sequence s2_listgroup_seq;

create sequence s2_listgroup_seq
start with 3
increment by 1
nocache;

drop sequence s2_board_seq;

create sequence s2_board_seq
increment by 1
start with 1
nocache;

drop sequence s2_comment_seq;

create sequence s2_comment_seq
increment by 1
start with 1
nocache;


--����Ʈ �׷� ����
select * from s2_listgroup;
insert into s2_listgroup
values (1,'������');

insert into s2_listgroup
values (2,'������');


--����Ʈ ����
select * from s2_list;

insert into s2_list
values (1,'����','img/list/1.jpg','"���η� �����~ ������ �����~" ���� ���� ����!',1);

insert into s2_list
values (2,'����','img/list/2.jpg','"����, ����, �׸��� ����.." ���� ���� ����!',1);

insert into s2_list
values (3,'���빮','img/list/3.jpg','���빮 ���� ����!',1);

insert into s2_list
values (4,'����','img/list/4.jpg','"���ļۼ� ���Ź!" ���� ���� ����!',1);

insert into s2_list
values (5,'��õ','img/list/5.jpg','"��õ���� ���� ������ �ִٱ�~" ��õ ���� ����!',1);

insert into s2_list
values (6,'�߱�','img/list/6.jpg','"�߱��� ���ڵ峪?" �߱� ���� ����!',1);

insert into s2_list
values (7,'����','img/list/7.jpg','"�ٵ� �̰Ÿ������� �������� ����?" ���� ���� ����!',1);

insert into s2_list
values (8,'����','img/list/8.jpg','���� ���� ����!',1);

insert into s2_list
values (9,'�ѽ�','img/list/9.jpg','�ѱ����� ���!',2);

insert into s2_list
values (10,'�߽�','img/list/10.jpg','����� ��!',2);

insert into s2_list
values (11,'���','img/list/11.jpg','���!',2);

insert into s2_list
values (12,'�Ͻ�','img/list/12.jpg','�Ͻ�!',2);

insert into s2_list
values (13,'������','img/list/13.jpg','������!',2);


-- ��������
select * from s2_store;


insert into s2_store
values (1,'������ ��Ƴ���','���� ���α� �����3�� 79','0507-1313-7668','ǻ�� �Ͻ�','10,000 ~ 20,000','X','11:30 ~ 21:00','����','������ ��� ����(�����) ��ҿ� �ε��� �Ƴ��� �����ϴ� ���Ŀ� ������ ��� �Ұ��ϰ� �;����ϴ�.',sysdate,'img/store/1.jpg',132,'37.57923147', '126.98207670');
insert into s2_store
values (2,'�鼼Į����','���� ������ ������� 12�� 17','02-362-1085','�ѽ�','10,000','X','10:00 ~ 22:00','����','�鼼Į���� �Դϴ�',sysdate,'img/store/2.png',201,'37.54812902', '126.95485277');
insert into s2_store
values (3,'Ȳ�����','���� ������ �������16�� 9','02-313-2952','�ѽ�','10,000~20,000','X','11:30 ~ 22:00','����','Ȳ����� �Դϴ�',sysdate,'img/store/3.png',505,'37.55096606', '126.95673415');
insert into s2_store
values (4,'�ҹٽĴ�','���� ������ ������9�� 28','02-6013-1552','�Ͻ�','10,000~20,000','X','11:30 ~ 21:00','����','���ɽĻ� �� ���� ���ָ޴��� ����,����,�츮���� �غ� �Ǿ� �ֽ��ϴ�. �⺻������ ���� �ҹٽĴ翡���� �Ļ� �޴��� �����ϳ� ���ῡ�� ȥ���ϱ⿡��, ������ �����ϱ⿡�� �ƴ��� �������� �˷����ֽ��ϴ�.',sysdate,'img/store/4.jpg',404,'37.55514927', '126.91014977');
insert into s2_store
values (5,'Ī��','���� ������ �������24�� 4','02-393-6688','�Ͻ�','10,000~20,000','O','11:30 ~ 00:30','����','��ü��, ����, ����, ���� ���ͳ�, ��/�� ȭ��� ����, ����ȭ��(������), ����ȭ��(ī����), ����ȭ��(�������), ��������, ����������',sysdate,'img/store/5.png',202,'37.55415059', '126.95784479');
insert into s2_store
values (6,'��������','����Ư���� ������ ������6�� 14','02-322-3539','�Ͻ�','���� �̸�','X','11:30 ~ 21:00','����','�޹��� �ν�Ÿ ���� ���� �α� ����������(���γ�����������)�� �̿����ּ��� ��Ű�� ���Դϴ�. ���л����� ���� �����մϴ�.',sysdate,'img/store/6.jpg',456,'37.54747440', '126.91731983');
insert into s2_store
values (7,'��ġ�� ��������','����Ư���� ������ ������ 109 101ȣ','070-7740-0321','�Ͻ�','���� ~ 2����','X','12:00 ~ 21:00','��','���� �ż��ѱ⸧���� �Ѻ��Ѻ� �ֹ������ÿ� �ż��� ���� �ٷ� Ƣ�ܵ帳�ϴ�.',sysdate,'img/store/7.jpg',151,'37.55665855', '126.90454806');
insert into s2_store
values (8,'���','����Ư���� ���빮�� �����15�� 21','02-732-0054','�߽�','���� ~ 5����','X','11:30 ~ 20:00','��','��� �Դϴ�',sysdate,'img/store/8.JPG',515,'37.56838240', '126.93047691');
insert into s2_store
values (9,'����ĭ','����Ư���� ���ı� �ø��ȷ�32�� 37-4 1F','02-422-0900','������','10,000 ~ 15,000','X','17:30 ~ 22:00','��','����ĭ �Դϴ�',sysdate,'img/store/9.JPG',655,'37.51323698', '127.11055330');
insert into s2_store
values (10,'â��43','���� ��õ�� �񵿼��� 159-1 CBS���� 1��','02-2653-0043','�ѽ�','10,000 ~ 15,000','X','11:30 ~ 22:00','����','â��43 �Դϴ�',sysdate,'img/store/10.png',848,'37.52823146', '126.87498891');
insert into s2_store
values (11,'ȣ�� ���','���� ��õ�� �ſ��� 132','02-2604-7789','���','10,000 ~ 15,000','O','11:00 ~ 21:00','����','����, ����, ���, ���� ���ͳ�, ��/�� ȭ��� ����, ��������, ����������',sysdate,'img/store/11.png',545,'37.51654264', '126.83869053');
insert into s2_store
values (12,'���� �常��','����Ư���� �߱� ������12�� 12 1F','02-2272-7577','�߽�','10,000 ~ 20,000','X','17:00 ~ 01:00','��','�߱��� ȫ�� �������� ���̽����� ���̴��� Ÿ�Ľ�. ���� ���ÿ� ��� ������ �ո����̰� �ǰ��� �丮�� �Ļ�� 8,800��-15,800�� ���� ���Ǽ� ������ ��������, ����, ����, ����, ��Ʈ ����Ű, �����, �ñ״��� Ĭ���� �� ���� �ַ� ���� �غ�Ǿ� �ֽ��ϴ�. �߱������ �ѱ��� �߰��� �����ϰ� �ɰ��Դϴ�. ���������� �ູ ',sysdate,'img/store/12.jpg',778,'37.56573559', '126.99105808');
insert into s2_store
values (13,'�Ŵ�������(�Ż���)','����Ư���� ������ ������ 15�� 11 1F','02-542-2420','���','40,000 ~ 50,000','X','12:00 ~ 22:00','����','�Ŵ������� �Դϴ�',sysdate,'img/store/13.jpg',45,'37.51905815', '127.02378201');
insert into s2_store
values (14,'�̶���','����Ư���� ������ ������ 153�� 24 �������� 1F','02-540-0934','�Ͻ�','20,000 ~ 50,000','X','18:00 ~ 01:00','����','�̶��� �Դϴ�',sysdate,'img/store/14.jpg',15,'37.52108310', '127.02617177');
insert into s2_store
values (15,'����ź','����Ư���� ������ ���޷���60�� 29','070-7641-2008','�ѽ�','10,000 ~ 20,000','X','13:00 ~ 24:00','����','����ź �Դϴ�',sysdate,'img/store/15.JPG',215,'37.53090348', '126.86329522');

-- �޴� ������
select * from s2_menu;

insert into s2_menu
values (1,'��������Ƴø�',9000,'img/menu/1-4.jpg');
insert into s2_menu
values (1,'��������',9000,'img/menu/1-5.jpg');
insert into s2_menu
values (1,'�ᱹ��',11000,'img/menu/1-9.jpg');
insert into s2_menu
values (1,'��ġ�� ������ũ',19000,'img/menu/1-6.jpg');
insert into s2_menu
values (1,'��� ������ũ',14000,'img/menu/1-3.jpg');
insert into s2_menu
values (1,'������ ����',14000,'img/menu/1-7.jpg');
insert into s2_menu
values (1,'���� �����',12000,'img/menu/1-1.jpg');
insert into s2_menu
values (1,'���������',14000,'img/menu/1-2.jpg');
insert into s2_menu
values (2,'�鼼Į����',7000,'img/menu/2-2.png');
insert into s2_menu
values (2,'������Į����',8000,'img/menu/2-2.png');
insert into s2_menu
values (2,'���α�',8000,'img/menu/2-3.png');
insert into s2_menu
values (2,'����',7000,'img/menu/2-3.png');
insert into s2_menu
values (3,'�κ�����',25000,'img/menu/3-4.jpg');
insert into s2_menu
values (3,'¥�ڵκ�',34000,'img/menu/3-3.png');
insert into s2_menu
values (3,'����κ�����',28000,'img/menu/3-3.png');
insert into s2_menu
values (3,'���𰡸� û����',25000,'img/menu/3-4.jpg');
insert into s2_menu
values (4,'�ѿ�üҹ�',16000,'img/menu/4-3.jpg');
insert into s2_menu
values (4,'��ϳüҹ�',14000,'img/menu/4-9.jpg');
insert into s2_menu
values (4,'�����üҹ�',14000,'img/menu/4-8.jpg');
insert into s2_menu
values (4,'�ܻ���üҹ�',13000,'img/menu/4-10.jpg');
insert into s2_menu
values (5,'������',45000,'img/menu/5-2.png');
insert into s2_menu
values (5,'�����ػ�',45000,'img/menu/5-3.png');
insert into s2_menu
values (5,'�ع���������',35000,'img/menu/5-2.png');
insert into s2_menu
values (6,'�丮����ź',9000,'img/menu/6-2.jpg');
insert into s2_menu
values (6,'ī�����ź',9000,'img/menu/6-3.jpg');
insert into s2_menu
values (6,'���� ���',9000,'img/menu/6-4.jpg');
insert into s2_menu
values (6,'�ÿ� ���',9000,'img/menu/6-3.jpg');
insert into s2_menu
values (7,'��ġ���ٵ�',9000,'img/menu/7-2.jpg');
insert into s2_menu
values (7,'�����ٵ�',11000,'img/menu/7-3.jpg');
insert into s2_menu
values (7,'�Ƴ����ٵ�',13000,'img/menu/7-4.jpg');
insert into s2_menu
values (7,'������ٵ�',15000,'img/menu/7-3.jpg');
insert into s2_menu
values (8,'A�ڽ�',25000,'img/menu/8-6.JPG');
insert into s2_menu
values (8,'B�ڽ�',30000,'img/menu/8-6.JPG');
insert into s2_menu
values (8,'C�ڽ�',35000,'img/menu/8-6.JPG');
insert into s2_menu
values (8,'D�ڽ�',40000,'img/menu/8-6.JPG');
insert into s2_menu
values (9,'�����׿�',12000,'img/menu/9-3.JPG');
insert into s2_menu
values (9,'�䳶 ����� ��',12500,'img/menu/9-4.JPG');
insert into s2_menu
values (9,'���ð� ��ǳ',12000,'img/menu/9-5.JPG');
insert into s2_menu
values (9,'���� �����',8500,'img/menu/9-3.JPG');
insert into s2_menu
values (9,'���ġŲ��',14000,'img/menu/9-4.JPG');
insert into s2_menu
values (10,'����������',10000,'img/menu/10-4.png');
insert into s2_menu
values (10,'�ѿ� ���� �̿���',10000,'img/menu/10-4.png');
insert into s2_menu
values (10,'������ȸ�����',12000,'img/menu/10-4.png');
insert into s2_menu
values (10,'����Į����',10000,'img/menu/10-4.png');
insert into s2_menu
values (10,'���� ���κ��',10000,'img/menu/10-4.png');
insert into s2_menu
values (10,'�ſ����',15000,'img/menu/10-4.png');
insert into s2_menu
values (11,'��ɵ�����',8000,'img/menu/11-2.png');
insert into s2_menu
values (11,'�Ƚɵ�����',9000,'img/menu/11-2.png');
insert into s2_menu
values (11,'ġ�����',9000,'img/menu/11-2.png');
insert into s2_menu
values (11,'ȣ����Ʈ',9000,'img/menu/11-3.png');
insert into s2_menu
values (11,'�󵷼�Ʈ',9000,'img/menu/11-3.png');
insert into s2_menu
values (12,'���ֿ���',11800,'img/menu/12-3.jpg');
insert into s2_menu
values (12,'ǥ������',9800,'img/menu/12-4.jpg');
insert into s2_menu
values (12,'���Ｑ',11500,'img/menu/12-5.jpg');
insert into s2_menu
values (12,'����ߺ���',7800,'img/menu/12-6.jpg');
insert into s2_menu
values (12,'���ĵκ�',13800,'img/menu/12-8.jpg');
insert into s2_menu
values (12,'��õ������',13800,'img/menu/12-7.jpg');
insert into s2_menu
values (13,'���۷δ�',35000,'img/menu/13-4.jpg');
insert into s2_menu
values (13,'���Ը�Ÿ',39000,'img/menu/13-3.jpg');
insert into s2_menu
values (13,'�ʸ���',40000,'img/menu/13-5.jpg');
insert into s2_menu
values (13,'��Ʈ��',42000,'img/menu/13-4.jpg');
insert into s2_menu
values (14,'���� ��ù�',39000,'img/menu/14-4.jpg');
insert into s2_menu
values (14,'���',39000,'img/menu/14-5.jpg');
insert into s2_menu
values (14,'������ ġ�� �ƿ�',18000,'img/menu/14-6.jpg');
insert into s2_menu
values (14,'��� �̼Һ� ����',19000,'img/menu/14-4.jpg');
insert into s2_menu
values (14,'ī�Ϲ̼� ũ�� �����',8000,'img/menu/14-5.jpg');
insert into s2_menu
values (14,'īŰ �Ķ���',19000,'img/menu/14-6.jpg');
insert into s2_menu
values (15,'���� �԰��',13000,'img/menu/15-3.JPG');
insert into s2_menu
values (15,'���� ������',10000,'img/menu/15-5.JPG');
insert into s2_menu
values (15,'�ѿ� �ϼ� ��ȸ',10000,'img/menu/15-5.JPG');
insert into s2_menu
values (15,'�ø�',10000,'img/menu/15-3.JPG');
insert into s2_menu
values (15,'��⸸��',6000,'img/menu/15-5.JPG');
commit;

--����Ʈ-���� ����
select * from s2_listcon;

insert into s2_listcon
values (1,1);
insert into s2_listcon
values (2,2);
insert into s2_listcon
values (3,2);
insert into s2_listcon
values (4,2);
insert into s2_listcon
values (5,2);
insert into s2_listcon
values (6,2);
insert into s2_listcon
values (7,2);
insert into s2_listcon
values (8,3);
insert into s2_listcon
values (9,4);
insert into s2_listcon
values (10,5);
insert into s2_listcon
values (11,5);
insert into s2_listcon
values (12,6);
insert into s2_listcon
values (13,7);
insert into s2_listcon
values (14,7);
insert into s2_listcon
values (15,8);
insert into s2_listcon
values (1,9);
insert into s2_listcon
values (2,9);
insert into s2_listcon
values (3,9);
insert into s2_listcon
values (4,12);
insert into s2_listcon
values (5,10);
insert into s2_listcon
values (6,13);
insert into s2_listcon
values (7,12);
insert into s2_listcon
values (8,10);
insert into s2_listcon
values (9,13);
insert into s2_listcon
values (10,9);
insert into s2_listcon
values (11,11);
insert into s2_listcon
values (12,10);
insert into s2_listcon
values (13,11);
insert into s2_listcon
values (14,12);
insert into s2_listcon
values (15,9);


select * from s2_mem;
insert into s2_mem
values(99,'������','manager','1234','1234','11111111111','','','','','Y');

insert into s2_mem
values(98,'�Ϲ�','member','1234','1234','11111111111','','','','','');

insert into s2_mem
values(1,'������','kimjin0132','1234','941215','01030843045','','','','img/mem/1.jpg','');
insert into s2_mem
values(2,'������2','������','1234','941215','01030843045','','','','img/mem/2.jpg','');
insert into s2_mem
values(3,'�̼Ҹ�','�̼Ҹ�','1234','1234','11111111111','','','','','');
insert into s2_mem
values(4,'�̻���','�̻���','1234','1234','11111111111','','','','','');
insert into s2_mem
values(5,'���ؼ�','���ؼ�','1234','1234','11111111111','','','','','');
insert into s2_mem
values(6,'�ּ�â','�ּ�â','1234','1234','11111111111','','','','','');
insert into s2_mem
values(7,'��������','��������','1234','1234','11111111111','','','','','');

select * from s2_review;
insert into s2_review
values(1,1,1,'�Ƶ� �����η�',5,sysdate,5);
insert into s2_review
values(2,1,2,'������',5,sysdate,5);
insert into s2_review
values(3,1,3,'�信�� �������Խ��ϴ�..',5,sysdate,5);
insert into s2_review
values(4,1,5,'������� �߻�����',5,sysdate,5);
insert into s2_review
values(5,1,4,'�̱��� �д� ���� ����� �ֺ� 5���� �Ȱ��� �ۼ��� ������ �մϴ�. �׷��� ������ ������ ���� ���Ұ˴ϴ�',5,sysdate,5);
insert into s2_review
values(6,1,6,'���� �Դ� �ϳ��� �׾ �����',5,sysdate,5);
insert into s2_review
values(7,1,7,'�ֽ� ����Ʈ�� �������� ���� �ΰ� �˴ϴ� vi.ko.',5,sysdate,5);

insert into s2_review
values(8,2,1,'�Ƶ� �����η�',5,sysdate,5);
insert into s2_review
values(9,2,2,'������',5,sysdate,5);
insert into s2_review
values(10,2,3,'�信�� �������Խ��ϴ�..',5,sysdate,5);
insert into s2_review
values(11,2,5,'������� �߻�����',5,sysdate,5);
insert into s2_review
values(12,2,4,'�̱��� �д� ���� ����� �ֺ� 5���� �Ȱ��� �ۼ��� ������ �մϴ�. �׷��� ������ ������ ���� ���Ұ˴ϴ�',5,sysdate,5);
insert into s2_review
values(13,2,6,'���� �Դ� �ϳ��� �׾ �����',5,sysdate,5);
insert into s2_review
values(14,2,7,'�ֽ� ����Ʈ�� �������� ���� �ΰ� �˴ϴ� vi.ko.',5,sysdate,5);

insert into s2_review
values(15,3,1,'�Ƶ� �����η�',5,sysdate,5);
insert into s2_review
values(16,3,2,'������',5,sysdate,5);
insert into s2_review
values(17,3,3,'�信�� �������Խ��ϴ�..',5,sysdate,5);
insert into s2_review
values(18,3,5,'������� �߻�����',5,sysdate,5);
insert into s2_review
values(19,3,4,'�̱��� �д� ���� ����� �ֺ� 5���� �Ȱ��� �ۼ��� ������ �մϴ�. �׷��� ������ ������ ���� ���Ұ˴ϴ�',5,sysdate,5);
insert into s2_review
values(20,3,6,'���� �Դ� �ϳ��� �׾ �����',5,sysdate,5);
insert into s2_review
values(21,3,7,'�ֽ� ����Ʈ�� �������� ���� �ΰ� �˴ϴ� vi.ko.',5,sysdate,5);

insert into s2_review
values(22,4,1,'�Ƶ� �����η�',5,sysdate,5);
insert into s2_review
values(23,4,2,'������',5,sysdate,5);
insert into s2_review
values(24,4,3,'�信�� �������Խ��ϴ�..',5,sysdate,5);
insert into s2_review
values(25,4,5,'������� �߻�����',5,sysdate,5);
insert into s2_review
values(26,4,4,'�̱��� �д� ���� ����� �ֺ� 5���� �Ȱ��� �ۼ��� ������ �մϴ�. �׷��� ������ ������ ���� ���Ұ˴ϴ�',5,sysdate,5);
insert into s2_review
values(27,4,6,'���� �Դ� �ϳ��� �׾ �����',5,sysdate,5);
insert into s2_review
values(28,4,7,'�ֽ� ����Ʈ�� �������� ���� �ΰ� �˴ϴ� vi.ko.',5,sysdate,5);

insert into s2_review
values(s2_review_seq.nextval,5,1,'�Ƶ� �����η�',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,5,2,'������',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,5,3,'�信�� �������Խ��ϴ�..',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,5,5,'������� �߻�����',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,5,4,'�̱��� �д� ���� ����� �ֺ� 5���� �Ȱ��� �ۼ��� ������ �մϴ�. �׷��� ������ ������ ���� ���Ұ˴ϴ�',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,5,6,'���� �Դ� �ϳ��� �׾ �����',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,5,7,'�ֽ� ����Ʈ�� �������� ���� �ΰ� �˴ϴ� vi.ko.',5,sysdate,5);

insert into s2_review
values(s2_review_seq.nextval,6,1,'�Ƶ� �����η�',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,6,2,'������',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,6,3,'�信�� �������Խ��ϴ�..',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,6,5,'������� �߻�����',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,6,4,'�̱��� �д� ���� ����� �ֺ� 5���� �Ȱ��� �ۼ��� ������ �մϴ�. �׷��� ������ ������ ���� ���Ұ˴ϴ�',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,6,6,'���� �Դ� �ϳ��� �׾ �����',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,6,7,'�ֽ� ����Ʈ�� �������� ���� �ΰ� �˴ϴ� vi.ko.',5,sysdate,5);

insert into s2_review
values(s2_review_seq.nextval,7,1,'�Ƶ� �����η�',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,7,2,'������',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,7,3,'�信�� �������Խ��ϴ�..',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,7,5,'������� �߻�����',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,7,4,'�̱��� �д� ���� ����� �ֺ� 5���� �Ȱ��� �ۼ��� ������ �մϴ�. �׷��� ������ ������ ���� ���Ұ˴ϴ�',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,7,6,'���� �Դ� �ϳ��� �׾ �����',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,7,7,'�ֽ� ����Ʈ�� �������� ���� �ΰ� �˴ϴ� vi.ko.',5,sysdate,5);

insert into s2_review
values(s2_review_seq.nextval,8,1,'�Ƶ� �����η�',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,8,2,'������',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,8,3,'�信�� �������Խ��ϴ�..',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,8,5,'������� �߻�����',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,8,4,'�̱��� �д� ���� ����� �ֺ� 5���� �Ȱ��� �ۼ��� ������ �մϴ�. �׷��� ������ ������ ���� ���Ұ˴ϴ�',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,8,6,'���� �Դ� �ϳ��� �׾ �����',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,8,7,'�ֽ� ����Ʈ�� �������� ���� �ΰ� �˴ϴ� vi.ko.',5,sysdate,5);

insert into s2_review
values(s2_review_seq.nextval,9,1,'�Ƶ� �����η�',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,9,2,'������',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,9,3,'�信�� �������Խ��ϴ�..',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,9,5,'������� �߻�����',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,9,4,'�̱��� �д� ���� ����� �ֺ� 5���� �Ȱ��� �ۼ��� ������ �մϴ�. �׷��� ������ ������ ���� ���Ұ˴ϴ�',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,9,6,'���� �Դ� �ϳ��� �׾ �����',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,9,7,'�ֽ� ����Ʈ�� �������� ���� �ΰ� �˴ϴ� vi.ko.',5,sysdate,5);

insert into s2_review
values(s2_review_seq.nextval,10,1,'�Ƶ� �����η�',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,10,2,'������',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,10,3,'�信�� �������Խ��ϴ�..',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,10,5,'������� �߻�����',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,10,4,'�̱��� �д� ���� ����� �ֺ� 5���� �Ȱ��� �ۼ��� ������ �մϴ�. �׷��� ������ ������ ���� ���Ұ˴ϴ�',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,10,6,'���� �Դ� �ϳ��� �׾ �����',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,10,7,'�ֽ� ����Ʈ�� �������� ���� �ΰ� �˴ϴ� vi.ko.',5,sysdate,5);

insert into s2_review
values(s2_review_seq.nextval,11,1,'�Ƶ� �����η�',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,11,2,'������',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,11,3,'�信�� �������Խ��ϴ�..',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,11,5,'������� �߻�����',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,11,4,'�̱��� �д� ���� ����� �ֺ� 5���� �Ȱ��� �ۼ��� ������ �մϴ�. �׷��� ������ ������ ���� ���Ұ˴ϴ�',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,11,6,'���� �Դ� �ϳ��� �׾ �����',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,11,7,'�ֽ� ����Ʈ�� �������� ���� �ΰ� �˴ϴ� vi.ko.',5,sysdate,5);

insert into s2_review
values(s2_review_seq.nextval,12,1,'�Ƶ� �����η�',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,12,2,'������',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,12,3,'�信�� �������Խ��ϴ�..',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,12,5,'������� �߻�����',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,12,4,'�̱��� �д� ���� ����� �ֺ� 5���� �Ȱ��� �ۼ��� ������ �մϴ�. �׷��� ������ ������ ���� ���Ұ˴ϴ�',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,12,6,'���� �Դ� �ϳ��� �׾ �����',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,12,7,'�ֽ� ����Ʈ�� �������� ���� �ΰ� �˴ϴ� vi.ko.',5,sysdate,5);

insert into s2_review
values(s2_review_seq.nextval,13,1,'�Ƶ� �����η�',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,13,2,'������',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,13,3,'�信�� �������Խ��ϴ�..',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,13,5,'������� �߻�����',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,13,4,'�̱��� �д� ���� ����� �ֺ� 5���� �Ȱ��� �ۼ��� ������ �մϴ�. �׷��� ������ ������ ���� ���Ұ˴ϴ�',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,13,6,'���� �Դ� �ϳ��� �׾ �����',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,13,7,'�ֽ� ����Ʈ�� �������� ���� �ΰ� �˴ϴ� vi.ko.',5,sysdate,5);

insert into s2_review
values(s2_review_seq.nextval,14,1,'�Ƶ� �����η�',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,14,2,'������',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,14,3,'�信�� �������Խ��ϴ�..',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,14,5,'������� �߻�����',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,14,4,'�̱��� �д� ���� ����� �ֺ� 5���� �Ȱ��� �ۼ��� ������ �մϴ�. �׷��� ������ ������ ���� ���Ұ˴ϴ�',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,14,6,'���� �Դ� �ϳ��� �׾ �����',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,14,7,'�ֽ� ����Ʈ�� �������� ���� �ΰ� �˴ϴ� vi.ko.',5,sysdate,5);

insert into s2_review
values(s2_review_seq.nextval,15,1,'�Ƶ� �����η�',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,15,2,'������',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,15,3,'�信�� �������Խ��ϴ�..',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,15,5,'������� �߻�����',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,15,4,'�̱��� �д� ���� ����� �ֺ� 5���� �Ȱ��� �ۼ��� ������ �մϴ�. �׷��� ������ ������ ���� ���Ұ˴ϴ�',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,15,6,'���� �Դ� �ϳ��� �׾ �����',5,sysdate,5);
insert into s2_review
values(s2_review_seq.nextval,15,7,'�ֽ� ����Ʈ�� �������� ���� �ΰ� �˴ϴ� vi.ko.',5,sysdate,5);

insert into s2_boardtype
values(1,'��������');
insert into s2_boardtype
values(2,'������õ');
insert into s2_boardtype
values(3,'�����Խ���');
insert into s2_boardtype
values(4,'QNA');

commit;

commit;