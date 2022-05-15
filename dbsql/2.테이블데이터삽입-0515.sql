-- ������ ���� ����
drop sequence s2_list_seq;

create sequence s2_list_seq
increment by 1
start with 14
nocache;

drop sequence s2_mem_seq;

create sequence s2_mem_seq
increment by 1
nocache;

drop sequence s2_store_seq;

create sequence s2_store_seq
start with 16
increment by 1
nocache;

drop sequence s2_review_seq;

create sequence s2_review_seq
increment by 1
nocache;

drop sequence s2_listgroup_seq;

create sequence s2_listgroup_seq
start with 3
increment by 1
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
values (1,'������ ��Ƴ���','���� ���α� �����3�� 79','0507-1313-7668','ǻ�� �Ͻ�','10,000 ~ 20,000','X','11:30 ~ 21:00','����','������ ��� ����(�����) ��ҿ� �ε��� �Ƴ��� �����ϴ� ���Ŀ� ������ ��� �Ұ��ϰ� �;����ϴ�.',sysdate,'img/store/1.jpg',0,'37.57923147, 126.98207670');
insert into s2_store
values (2,'�鼼Į����','���� ������ ������� 12�� 17','02-362-1085','�ѽ�','10,000','X','10:00 ~ 22:00','����','�鼼Į���� �Դϴ�',sysdate,'img/store/2.png',0,'37.54812902, 126.95485277');
insert into s2_store
values (3,'Ȳ�����','���� ������ �������16�� 9','02-313-2952','�ѽ�','10,000~20,000','X','11:30 ~ 22:00','����','Ȳ����� �Դϴ�',sysdate,'img/store/3.png',0,'37.55096606, 126.95673415');
insert into s2_store
values (4,'�ҹٽĴ�','���� ������ ������9�� 28','02-6013-1552','�Ͻ�','10,000~20,000','X','11:30 ~ 21:00','����','���ɽĻ� �� ���� ���ָ޴��� ����,����,�츮���� �غ� �Ǿ� �ֽ��ϴ�. �⺻������ ���� �ҹٽĴ翡���� �Ļ� �޴��� �����ϳ� ���ῡ�� ȥ���ϱ⿡��, ������ �����ϱ⿡�� �ƴ��� �������� �˷����ֽ��ϴ�.',sysdate,'img/store/4.jpg',0,'37.55514927, 126.91014977');
insert into s2_store
values (5,'Ī��','���� ������ �������24�� 4','02-393-6688','�Ͻ�','10,000~20,000','O','11:30 ~ 00:30','����','��ü��, ����, ����, ���� ���ͳ�, ��/�� ȭ��� ����, ����ȭ��(������), ����ȭ��(ī����), ����ȭ��(�������), ��������, ����������',sysdate,'img/store/5.png',0,'37.55415059, 126.95784479');
insert into s2_store
values (6,'��������','����Ư���� ������ ������6�� 14','02-322-3539','�Ͻ�','���� �̸�','X','11:30 ~ 21:00','����','�޹��� �ν�Ÿ ���� ���� �α� ����������(���γ�����������)�� �̿����ּ��� ��Ű�� ���Դϴ�. ���л����� ���� �����մϴ�.',sysdate,'img/store/6.jpg',0,'37.54747440, 126.91731983');
insert into s2_store
values (7,'��ġ�� ��������','����Ư���� ������ ������ 109 101ȣ','070-7740-0321','�Ͻ�','���� ~ 2����','X','12:00 ~ 21:00','��','���� �ż��ѱ⸧���� �Ѻ��Ѻ� �ֹ������ÿ� �ż��� ���� �ٷ� Ƣ�ܵ帳�ϴ�.',sysdate,'img/store/7.jpg',0,'37.55665855, 126.90454806');
insert into s2_store
values (8,'���','����Ư���� ���빮�� �����15�� 21','02-732-0054','�߽�','���� ~ 5����','X','11:30 ~ 20:00','��','��� �Դϴ�',sysdate,'img/store/8.JPG',0,'37.56838240, 126.93047691');
insert into s2_store
values (9,'����ĭ','����Ư���� ���ı� �ø��ȷ�32�� 37-4 1F','02-422-0900','������','10,000 ~ 15,000','X','17:30 ~ 22:00','��','����ĭ �Դϴ�',sysdate,'img/store/9.JPG',0,'37.51323698, 127.11055330');
insert into s2_store
values (10,'â��43','���� ��õ�� �񵿼��� 159-1 CBS���� 1��','02-2653-0043','�ѽ�','10,000 ~ 15,000','X','11:30 ~ 22:00','����','â��43 �Դϴ�',sysdate,'img/store/10.png',0,'37.52823146, 126.87498891');
insert into s2_store
values (11,'ȣ�� ���','���� ��õ�� �ſ��� 132','02-2604-7789','���','10,000 ~ 15,000','O','11:00 ~ 21:00','����','����, ����, ���, ���� ���ͳ�, ��/�� ȭ��� ����, ��������, ����������',sysdate,'img/store/11.png',0,'37.51654264, 126.83869053');
insert into s2_store
values (12,'���� �常��','����Ư���� �߱� ������12�� 12 1F','02-2272-7577','�߽�','10,000 ~ 20,000','X','17:00 ~ 01:00','��','�߱��� ȫ�� �������� ���̽����� ���̴��� Ÿ�Ľ�. ���� ���ÿ� ��� ������ �ո����̰� �ǰ��� �丮�� �Ļ�� 8,800��-15,800�� ���� ���Ǽ� ������ ��������, ����, ����, ����, ��Ʈ ����Ű, �����, �ñ״��� Ĭ���� �� ���� �ַ� ���� �غ�Ǿ� �ֽ��ϴ�. �߱������ �ѱ��� �߰��� �����ϰ� �ɰ��Դϴ�. ���������� �ູ ',sysdate,'img/store/12.jpg',0,'37.56573559, 126.99105808');
insert into s2_store
values (13,'�Ŵ�������(�Ż���)','����Ư���� ������ ������ 15�� 11 1F','02-542-2420','���','40,000 ~ 50,000','X','12:00 ~ 22:00','����','�Ŵ������� �Դϴ�',sysdate,'img/store/13.jpg',0,'37.51905815, 127.02378201');
insert into s2_store
values (14,'�̶���','����Ư���� ������ ������ 153�� 24 �������� 1F','02-540-0934','�Ͻ�','20,000 ~ 50,000','X','18:00 ~ 01:00','����','�̶��� �Դϴ�',sysdate,'img/store/14.jpg',0,'37.52108310, 127.02617177');
insert into s2_store
values (15,'����ź','����Ư���� ������ ���޷���60�� 29','070-7641-2008','�ѽ�','10,000 ~ 20,000','X','13:00 ~ 24:00','����','����ź �Դϴ�',sysdate,'img/store/15.JPG',0,'37.53090348, 126.86329522');

-- �޴� ������
select * from s2_menu;

insert into s2_menu
values (1,'��������Ƴø�',9000,' ');
insert into s2_menu
values (1,'��������',9000,' ');
insert into s2_menu
values (1,'�ᱹ��',11000,' ');
insert into s2_menu
values (1,'��ġ�� ������ũ',19000,' ');
insert into s2_menu
values (1,'��� ������ũ',14000,' ');
insert into s2_menu
values (1,'������ ����',14000,' ');
insert into s2_menu
values (1,'���� �����',12000,' ');
insert into s2_menu
values (1,'���������',14000,' ');
insert into s2_menu
values (2,'�鼼Į����',7000,' ');
insert into s2_menu
values (2,'������Į����',8000,' ');
insert into s2_menu
values (2,'���α�',8000,' ');
insert into s2_menu
values (2,'����',7000,' ');
insert into s2_menu
values (3,'�κ�����',25000,' ');
insert into s2_menu
values (3,'¥�ڵκ�',34000,' ');
insert into s2_menu
values (3,'����κ�����',28000,' ');
insert into s2_menu
values (3,'���𰡸� û����',25000,' ');
insert into s2_menu
values (4,'�ѿ�üҹ�',16000,' ');
insert into s2_menu
values (4,'��ϳüҹ�',14000,' ');
insert into s2_menu
values (4,'�����üҹ�',14000,' ');
insert into s2_menu
values (4,'�ܻ���üҹ�',13000,' ');
insert into s2_menu
values (5,'������',45000,' ');
insert into s2_menu
values (5,'�����ػ�',45000,' ');
insert into s2_menu
values (5,'�ع���������',35000,' ');
insert into s2_menu
values (6,'�丮����ź',9000,' ');
insert into s2_menu
values (6,'ī�����ź',9000,' ');
insert into s2_menu
values (6,'���� ���',9000,' ');
insert into s2_menu
values (6,'�ÿ� ���',9000,' ');
insert into s2_menu
values (7,'��ġ���ٵ�',9000,' ');
insert into s2_menu
values (7,'�����ٵ�',11000,' ');
insert into s2_menu
values (7,'�Ƴ����ٵ�',13000,' ');
insert into s2_menu
values (7,'������ٵ�',15000,' ');
insert into s2_menu
values (8,'A�ڽ�',25000,' ');
insert into s2_menu
values (8,'B�ڽ�',30000,' ');
insert into s2_menu
values (8,'C�ڽ�',35000,' ');
insert into s2_menu
values (8,'D�ڽ�',40000,' ');
insert into s2_menu
values (9,'�����׿�',12000,' ');
insert into s2_menu
values (9,'�䳶 ����� ��',12500,' ');
insert into s2_menu
values (9,'���ð� ��ǳ',12000,' ');
insert into s2_menu
values (9,'���� �����',8500,' ');
insert into s2_menu
values (9,'���ġŲ��',14000,' ');
insert into s2_menu
values (10,'����������',10000,' ');
insert into s2_menu
values (10,'�ѿ� ���� �̿���',10000,' ');
insert into s2_menu
values (10,'������ȸ�����',12000,' ');
insert into s2_menu
values (10,'����Į����',10000,' ');
insert into s2_menu
values (10,'���� ���κ��',10000,' ');
insert into s2_menu
values (10,'�ſ����',15000,' ');
insert into s2_menu
values (11,'��ɵ�����',8000,' ');
insert into s2_menu
values (11,'�Ƚɵ�����',9000,' ');
insert into s2_menu
values (11,'ġ�����',9000,' ');
insert into s2_menu
values (11,'ȣ����Ʈ',9000,' ');
insert into s2_menu
values (11,'�󵷼�Ʈ',9000,' ');
insert into s2_menu
values (12,'���ֿ���',11800,' ');
insert into s2_menu
values (12,'ǥ������',9800,' ');
insert into s2_menu
values (12,'���Ｑ',11500,' ');
insert into s2_menu
values (12,'����ߺ���',7800,' ');
insert into s2_menu
values (12,'���ĵκ�',13800,' ');
insert into s2_menu
values (12,'��õ������',13800,' ');
insert into s2_menu
values (13,'���۷δ�',35000,' ');
insert into s2_menu
values (13,'���Ը�Ÿ',39000,' ');
insert into s2_menu
values (13,'�ʸ���',40000,' ');
insert into s2_menu
values (13,'��Ʈ��',42000,' ');
insert into s2_menu
values (14,'���� ��ù�',39000,' ');
insert into s2_menu
values (14,'���',39000,' ');
insert into s2_menu
values (14,'������ ġ�� �ƿ�',18000,' ');
insert into s2_menu
values (14,'��� �̼Һ� ����',19000,' ');
insert into s2_menu
values (14,'ī�Ϲ̼� ũ�� �����',8000,' ');
insert into s2_menu
values (14,'īŰ �Ķ���',19000,' ');
insert into s2_menu
values (15,'���� �԰��',13000,' ');
insert into s2_menu
values (15,'���� ������',10000,' ');
insert into s2_menu
values (15,'�ѿ� �ϼ� ��ȸ',10000,' ');
insert into s2_menu
values (15,'�ø�',10000,' ');
insert into s2_menu
values (15,'��⸸��',6000,' ');
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

commit;