/**********************************/
/* Table Name: ������ ��� */
/**********************************/
DROP TABLE managerlv CASCADE CONSTRAINTS;
CREATE TABLE managerlv(
      managerlvno                     NUMBER(10)       NOT NULL       PRIMARY KEY,
      managerlv_name                   VARCHAR2(20)       NOT NULL,
      managerlv_pay                   NUMBER(20)       NOT NULL,
      managerlv_do                     CLOB NULL
);

COMMENT ON TABLE managerlv is '������ ���';
COMMENT ON COLUMN managerlv.managerlvno is '������ ��޹�ȣ';
COMMENT ON COLUMN managerlv.managerlv_name is '������ ����̸�';
COMMENT ON COLUMN managerlv.managerlv_pay is '������ ��� �� ����';
COMMENT ON COLUMN managerlv.managerlv_do is '������ ��޾���';

DROP SEQUENCE managerlv_seq;
CREATE SEQUENCE managerlv_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;

INSERT INTO managerlv(managerlvno, managerlv_name, managerlv_pay, managerlv_do)
VALUES(managerlv_seq.nextval, '�Ѱ�å����', 5600, 'ȸ������, QnA �亯, ��ǰ����');

/**********************************/
/* Table Name: ������ */
/**********************************/
DROP TABLE manager CASCADE CONSTRAINTS;
CREATE TABLE manager(
      managerno                           NUMBER(10)       NOT NULL       PRIMARY KEY,
      manager_img                         VARCHAR2(1000)       NULL ,
      manager_id                          VARCHAR2(50)       NOT NULL,
      manager_pw                          VARCHAR2(20)       NOT NULL,
      manager_name                        VARCHAR2(20)       NOT NULL,
      manager_yy                       NUMBER(20)       NOT NULL,
      manager_mm                       NUMBER(20)       NOT NULL,
      manager_dd                       NUMBER(20)       NOT NULL,
      manager_telecom                  VARCHAR2(20)       NOT NULL,
      manager_phone                       NUMBER(20)       NOT NULL,
      manager_email                       VARCHAR2(50)       NOT NULL,
      manager_postcode                    VARCHAR2(20)       NOT NULL,
      manager_address1                    VARCHAR2(80)       NOT NULL,
      manager_address2                    VARCHAR2(80)       NOT NULL,
      joindate                            DATE       NOT NULL,
      managerlvno                     NUMBER(10)       NOT NULL,
  FOREIGN KEY (managerlvno) REFERENCES managerlv (managerlvno)
);

COMMENT ON TABLE manager is '������';
COMMENT ON COLUMN manager.managerno is '������ ��ȣ';
COMMENT ON COLUMN manager.manager_img is '������ ����';
COMMENT ON COLUMN manager.manager_id is '������ ���̵�';
COMMENT ON COLUMN manager.manager_pw is '������ ��й�ȣ';
COMMENT ON COLUMN manager.manager_name is '������ �̸�';
COMMENT ON COLUMN manager.manager_yy is '������ ��';
COMMENT ON COLUMN manager.manager_mm is '������ ��';
COMMENT ON COLUMN manager.manager_dd is '������ ��';
COMMENT ON COLUMN manager.manager_telecom is '������ ��Ż�';
COMMENT ON COLUMN manager.manager_phone is '������ ��ȭ��ȣ';
COMMENT ON COLUMN manager.manager_email is '������ �̸���';
COMMENT ON COLUMN manager.manager_postcode is '������ �����ȣ';
COMMENT ON COLUMN manager.manager_address1 is '������ �ּ�1';
COMMENT ON COLUMN manager.manager_address2 is '������ �ּ�2';
COMMENT ON COLUMN manager.joindate is '�Ի���';
COMMENT ON COLUMN manager.managerlvno is '������ ��޹�ȣ';

DROP SEQUENCE manager_seq;
CREATE SEQUENCE manager_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;  

INSERT INTO manager(managerno, manager_img, manager_id, manager_pw, manager_name,
manager_yy, manager_mm, manager_dd, manager_telecom, manager_phone, manager_email, manager_postcode, manager_address1, manager_address2, joindate, managerlvno)
VALUES(manager_seq.nextval, null,'total_manager', 1234, '��¯��', 01,02,03, 'SKT',01012340000, 'total@naver.com', '12345', '����� ���α� ��ö��', '25-6����', sysdate,1);

/**********************************/
/* Table Name: ȸ�� ��� */
/**********************************/
DROP TABLE memlv CASCADE CONSTRAINTS;
CREATE TABLE memlv(
      memlvno                         NUMBER(10)       NOT NULL       PRIMARY KEY,
      memlv_name                       VARCHAR2(20)       NOT NULL,
      memlv_img                             VARCHAR2(1000)       NULL ,
      memlv_condition                   CLOB NOT NULL,
      memlv_benefit                     CLOB NOT NULL
);

COMMENT ON TABLE memlv is 'ȸ�� ���';
COMMENT ON COLUMN memlv.memlvno is 'ȸ�� ��޹�ȣ';
COMMENT ON COLUMN memlv.memlv_name is 'ȸ�� ����̸�';
COMMENT ON COLUMN memlv.memlv_img is 'ȸ�� ��޷ΰ�';
COMMENT ON COLUMN memlv.memlv_condition is 'ȸ�� �������';
COMMENT ON COLUMN memlv.memlv_benefit is 'ȸ�� �������';

DROP SEQUENCE memlv_seq;
CREATE SEQUENCE memlv_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;  

INSERT INTO memlv(memlvno, memlv_name, memlv_condition ,memlv_benefit)
VALUES(1, '�Ϲ�ȸ��', '�� 30���� �̻� ����' , '����Ʈ5%����');
INSERT INTO memlv(memlvno, memlv_name, memlv_condition ,memlv_benefit)
VALUES(2, 'Silver', '�� 40���� �̻� ����' , '����Ʈ7%����');
INSERT INTO memlv(memlvno, memlv_name, memlv_condition ,memlv_benefit)
VALUES(3, 'Gold', '�� 50���� �̻� ����' , '����Ʈ8%����');

/**********************************/
/* Table Name: ȸ�� */
/**********************************/
DROP TABLE mem CASCADE CONSTRAINTS;
CREATE TABLE mem(
      memno                               NUMBER(10)       NOT NULL       PRIMARY KEY,
      mem_img                             VARCHAR2(1000)       NULL ,
      mem_id                              VARCHAR2(20)       NOT NULL,
      mem_pw                              VARCHAR2(20)       NOT NULL,
      mem_name                            VARCHAR2(20)       NOT NULL,
      mem_yy                              NUMBER(10)       NOT NULL,
      mem_mm                              NUMBER(10)       NOT NULL,
      mem_dd                              NUMBER(10)       NOT NULL,
      mem_telecom                         VARCHAR2(20)       NOT NULL,
      mem_phone                          NUMBER(20)       NOT NULL,
      mem_email                           VARCHAR2(20)       NOT NULL,
      signdate                            DATE       NOT NULL,
      memlvno                         NUMBER(10)       DEFAULT 1       NOT NULL,
  FOREIGN KEY (memlvno) REFERENCES memlv (memlvno)
);

COMMENT ON TABLE mem is 'ȸ��';
COMMENT ON COLUMN mem.memno is 'ȸ����ȣ';
COMMENT ON COLUMN mem.mem_img is 'ȸ�� ����';
COMMENT ON COLUMN mem.mem_id is 'ȸ�� ���̵�';
COMMENT ON COLUMN mem.mem_pw is 'ȸ�� ��й�ȣ';
COMMENT ON COLUMN mem.mem_name is 'ȸ�� �̸�';
COMMENT ON COLUMN mem.mem_yy is 'ȸ�� ��';
COMMENT ON COLUMN mem.mem_mm is 'ȸ�� ��';
COMMENT ON COLUMN mem.mem_dd is 'ȸ�� ��';
COMMENT ON COLUMN mem.mem_telecom is 'ȸ�� ��Ż�';
COMMENT ON COLUMN mem.mem_phone is 'ȸ�� ��ȭ��ȣ';
COMMENT ON COLUMN mem.mem_email is 'ȸ�� �̸���';
COMMENT ON COLUMN mem.signdate is '������';
COMMENT ON COLUMN mem.memlvno is 'ȸ�� ��޹�ȣ';

DROP SEQUENCE mem_seq;
CREATE SEQUENCE mem_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;  
  
-- ���
INSERT INTO mem(memno, mem_id, mem_pw, mem_name, 
mem_yy, mem_mm, mem_dd, mem_telecom, mem_phone, mem_email, signdate)
VALUES(mem_seq.nextval, 'user1', 1234, '������', 99,01,23, 'LG U+',01000000000, 'a@naver.com', sysdate);

INSERT INTO mem(memno, mem_img, mem_id, mem_pw, mem_name,
mem_yy, mem_mm, mem_dd, mem_telecom, mem_phone, mem_email, signdate)
VALUES(mem_seq.nextval, null,'user2', 1234, '����', 01,02,03, 'SKT',01012340000, 'b@naver.com', sysdate);

/**********************************/
/* Table Name: ����� */
/**********************************/
DROP TABLE destination CASCADE CONSTRAINTS;
CREATE TABLE destination(
      destinationno                       NUMBER(10)       NOT NULL       PRIMARY KEY,
      recipient                           VARCHAR2(20)       NOT NULL,
      recipient_phone                     NUMBER(20)       NOT NULL,
      postcode                            NUMBER(10)       NOT NULL,
      address1                            VARCHAR2(80)       NOT NULL,
      address2                            VARCHAR2(80)       NOT NULL,
      basic                               CHAR(1) default 'B' NOT NULL,
      memno                               NUMBER(10)       NOT NULL,
  FOREIGN KEY (memno) REFERENCES mem (memno)
);

COMMENT ON TABLE destination is '�����';
COMMENT ON COLUMN destination.destinationno is '�������ȣ';
COMMENT ON COLUMN destination.recipient is '��۹޴»��';
COMMENT ON COLUMN destination.recipient_phone is '��۹޴»�� ��ȣ';
COMMENT ON COLUMN destination.postcode is '�����ȣ';
COMMENT ON COLUMN destination.address1 is '�ּ�1';
COMMENT ON COLUMN destination.address2 is '�ּ�';
COMMENT ON COLUMN destination.basic is '�⺻�����';
COMMENT ON COLUMN destination.memno is 'ȸ����ȣ';

DROP SEQUENCE destination_seq;
CREATE SEQUENCE destination_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;  

DROP SEQUENCE destination_seq;
CREATE SEQUENCE destination_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;  

/**********************************/
/* Table Name: ��ǰ ī�װ� */
/**********************************/
DROP TABLE itemgrp CASCADE CONSTRAINTS;
CREATE TABLE itemgrp(
        grpno                         		NUMBER(10)		 NOT NULL,
        name                      		    VARCHAR2(100)		 NOT NULL,
		visibleno                 	     	NUMBER(7)		     NOT NULL,
		visible                   	         	CHAR(1)		         DEFAULT 'Y'		 NOT NULL,
		rdate                      		    DATE		             NOT NULL,
        PRIMARY KEY(grpno)
);

COMMENT ON TABLE itemgrp is '��ǰ ī�װ� �׷�';
COMMENT ON COLUMN itemgrp.grpno is 'ī�װ� �׷� ��ȣ';
COMMENT ON COLUMN itemgrp.name is '�׷� �̸�';
COMMENT ON COLUMN itemgrp.visibleno is '��� ����';
COMMENT ON COLUMN itemgrp.visible is '��� ���';
COMMENT ON COLUMN itemgrp.rdate is '�׷� ������';

DROP SEQUENCE grp_seq;
CREATE SEQUENCE grp_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
 
-- 1) �ڷ� ����
INSERT INTO itemgrp(grpno, name, visibleno, visible, rdate)
VALUES(grp_seq.nextval, '����/����', 1, 'Y', sysdate);

INSERT INTO itemgrp(grpno, name, visibleno, visible, rdate)
VALUES(grp_seq.nextval, '�ָ�����/ź��/������', 2, 'Y', sysdate);

INSERT INTO itemgrp(grpno, name, visibleno, visible, rdate)
VALUES(grp_seq.nextval, '���帧 Ʈ����', 3, 'Y', sysdate);

INSERT INTO itemgrp(grpno, name, visibleno, visible, rdate)
VALUES(grp_seq.nextval, '���/����/�����', 4, 'Y', sysdate);

INSERT INTO itemgrp(grpno, name, visibleno, visible, rdate)
VALUES(grp_seq.nextval, '�̹�', 5, 'Y', sysdate);

/**********************************/
/* Table Name: ��ǰ */
/**********************************/
DROP TABLE item CASCADE CONSTRAINTS;
CREATE TABLE item(
      itemno                              NUMBER(10)         NOT NULL            PRIMARY KEY,
      grpno                                NUMBER(10)         NOT NULL ,
      item_name                          VARCHAR2(500)    NOT NULL,
      item_stock                          NUMBER(10)         NOT NULL,
      item_price                           NUMBER(10)         NOT NULL,
      item_cost                            NUMBER(10)         NOT NULL,
      discount_rate                       NUMBER(10)         DEFAULT 0             NOT NULL,
      item_content                       CLOB                   NOT NULL,
      item_type                           VARCHAR2(100)     NOT NULL,
      item_effect                          VARCHAR2(100)    NOT NULL,
      item_origin                          VARCHAR2(50)      DEFAULT '������'      NOT NULL,
      item_visible                         CHAR(1)               DEFAULT 'Y'           NOT NULL,
      item_visibleno                      NUMBER(10)         NOT NULL,
      item_recom                         NUMBER(10)         DEFAULT 0             NOT NULL,
      item_view                           NUMBER(10)          DEFAULT 0             NOT NULL,
      item_rdate                          DATE                   NOT NULL,     
      upfile                                  VARCHAR(100)       NULL,
      thumb                               VARCHAR(100)       NULL,
      fsize                                   NUMBER(10)          DEFAULT 0 NULL,  
    FOREIGN KEY (grpno) REFERENCES itemgrp (grpno)         
);

COMMENT ON TABLE item is '��ǰ';
COMMENT ON COLUMN item.itemno is '��ǰ ��� ��ȣ';
COMMENT ON COLUMN item.grpno is '���� ī�װ� ��ȣ';
COMMENT ON COLUMN item.item_name is '��ǰ �̸�';
COMMENT ON COLUMN item.item_stock is '��ǰ ���';
COMMENT ON COLUMN item.item_price is '��ǰ ����';
COMMENT ON COLUMN item.item_cost is '��ǰ ����';
COMMENT ON COLUMN item.discount_rate is '���η�';
COMMENT ON COLUMN item.item_content is '��ǰ ����';
COMMENT ON COLUMN item.item_type is '��ǰ ����';
COMMENT ON COLUMN item.item_effect is '��ǰ �Ǻ� ȿ��';
COMMENT ON COLUMN item.item_origin is '������';
COMMENT ON COLUMN item.item_visible is '���';
COMMENT ON COLUMN item.item_visibleno is '��¼���';
COMMENT ON COLUMN item.item_recom is '��õ��';
COMMENT ON COLUMN item.item_view is '��ȸ��';
COMMENT ON COLUMN item.item_rdate is '��ǰ ��� ��¥';
COMMENT ON COLUMN item.upfile is '���ε� ����';
COMMENT ON COLUMN item.thumb is '����� ����';
COMMENT ON COLUMN item.fsize is '������';

DROP SEQUENCE item_seq;
CREATE SEQUENCE item_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

-- 1) �ڷ� ����           
INSERT INTO item(itemno, grpno, item_name, item_stock, item_price, item_cost, discount_rate, item_content,
                        item_type, item_effect,item_origin, item_visible, item_visibleno, item_recom, item_view, item_rdate, upfile, thumb, fsize)
VALUES(item_seq.nextval, 1, '���ֻ� ��Ų', 10, 11000, 5500, 30, '������ ������ ���� ��Ų', 
           '��Ų', '������ ���� ������ ���ƿ� ���ƿ�', '���ֻ�', 'Y', 1, 0, 0, sysdate, 'spring.jpg', 'spring_t.jpg', 23657 );

INSERT INTO item(itemno, grpno, item_name, item_stock, item_price, item_cost, discount_rate, item_content,
                        item_type, item_effect,item_origin, item_visible, item_visibleno, item_recom, item_view, item_rdate, upfile, thumb, fsize)
VALUES(item_seq.nextval, 1, '���ֻ� �μ�', 12, 13000, 5500, 30, '������ ������ ���� ��Ų', 
           '�μ�', '������ ���� ������ ���ƿ� ���ƿ�', '���ֻ�', 'Y', 2, 0, 0, sysdate, 'spring.jpg', 'spring_t.jpg', 23657 );
            
INSERT INTO item(itemno, grpno, item_name, item_stock, item_price, item_cost, discount_rate, item_content,
                        item_type, item_effect,item_origin, item_visible, item_visibleno, item_recom, item_view, item_rdate, upfile, thumb, fsize)
VALUES(item_seq.nextval, 2, '���帧 �μ�', 10, 10000, 5000, 30, '������ ���帧 ���� �μ�', 
           '�μ�', '���帧 ���� ������ ���ƿ� ���ƿ�', 'ȣ�ֻ�', 'Y', 3, 0, 0, sysdate, 'spring.jpg', 'spring_t.jpg', 23657 );
           
INSERT INTO item(itemno, grpno, item_name, item_stock, item_price, item_cost, discount_rate, item_content,
                        item_type, item_effect,item_origin, item_visible, item_visibleno, item_recom, item_view, item_rdate, upfile, thumb, fsize)
VALUES(item_seq.nextval, 2, '���帧 ��Ų', 10, 11000, 5500, 30, '������ ���帧 ���� ��Ų', 
           '��Ų', '���帧 ���� ������ ���ƿ� ���ƿ�', 'ȣ�ֻ�', 'Y', 4, 0, 0, sysdate, 'spring.jpg', 'spring_t.jpg', 23657 );
           
INSERT INTO item(itemno, grpno, item_name, item_stock, item_price, item_cost, discount_rate, item_content,
                        item_type, item_effect,item_origin, item_visible, item_visibleno, item_recom, item_view, item_rdate, upfile, thumb, fsize)
VALUES(item_seq.nextval, 3, '���� �μ�', 10, 9000, 5000, 30, '������ ���� ���� �μ�', 
           '�μ�', '���� ���� ������ ���ƿ� ���ƿ�', 'ȣ�ֻ�', 'Y', 5, 0, 0, sysdate, 'spring.jpg', 'spring_t.jpg', 23657 );
           
INSERT INTO item(itemno, grpno, item_name, item_stock, item_price, item_cost, discount_rate, item_content,
                        item_type, item_effect,item_origin, item_visible, item_visibleno, item_recom, item_view, item_rdate, upfile, thumb, fsize)
VALUES(item_seq.nextval, 3, '���ξ��� ��Ų', 10, 8000, 4000, 30, '������ ���ξ��� ���� ��Ų', 
           '��Ų', '���ξ��� ���� ������ ���ƿ� ���ƿ�', 'ȣ�ֻ�', 'Y', 6, 0, 0, sysdate, 'spring.jpg', 'spring_t.jpg', 23657 );           

/**********************************/
/* Table Name: ����� */
/**********************************/
DROP TABLE thumbnail CASCADE CONSTRAINTS;
CREATE TABLE thumbnail(
        thumbno                     NUMBER(10)         NOT NULL         PRIMARY KEY,
        itemno                        NUMBER(10)         NULL ,
        fname                         VARCHAR2(100)     NULL,
        fupname                      VARCHAR2(100)     NULL,
        thumb                         VARCHAR2(100)     NULL ,
        fsize                            NUMBER(10)         DEFAULT 0         NOT NULL,
        rdate                           DATE                  NOT NULL,
  FOREIGN KEY (itemno) REFERENCES item (itemno)
);

COMMENT ON TABLE thumbnail is '�����';
COMMENT ON COLUMN thumbnail.thumbno is '����� ��ȣ';
COMMENT ON COLUMN thumbnail.itemno is '��ǰ ��� ��ȣ';
COMMENT ON COLUMN thumbnail.fname is '���� ���ϸ�';
COMMENT ON COLUMN thumbnail.fupname is '���ε� ���ϸ�';
COMMENT ON COLUMN thumbnail.thumb is 'Thumb ���ϸ�';
COMMENT ON COLUMN thumbnail.fsize is '���� ������';
COMMENT ON COLUMN thumbnail.rdate is '�����';

DROP SEQUENCE thumb_seq;
CREATE SEQUENCE thumb_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
-- 1) ���
INSERT INTO thumbnail(thumbno, itemno, fname, fupname, thumb, fsize, rdate)
VALUES(thumb_seq.nextval, 1, 'lotion.jpg', 'lotion_1.jpg', 'lotion_t.jpg', 1000, sysdate);

INSERT INTO thumbnail(thumbno, itemno, fname, fupname, thumb, fsize, rdate)
VALUES(thumb_seq.nextval, 2, 'skin.jpg', 'sskin_1.jpg', 'skin_t.jpg', 1000, sysdate);

INSERT INTO thumbnail(thumbno, itemno, fname, fupname, thumb, fsize, rdate)
VALUES(thumb_seq.nextval, 3, 'pack.jpg', 'pack_1.jpg', 'pack_t.jpg', 1000, sysdate);

COMMIT;

/**********************************/
/* Table Name: ȭ��ǰ ��õ */
/**********************************/
DROP TABLE recommand CASCADE CONSTRAINTS;
CREATE TABLE recommand(
      recomno                             NUMBER(10)       NOT NULL      PRIMARY KEY,
      grpno                                NUMBER(10)         NOT NULL ,
      itemno                              NUMBER(10)       NOT NULL,
      testresult_type                     VARCHAR2(50)        NOT NULL,
      testresult_recom                    CLOB                  NOT NULL,
      recom_price                         NUMBER(10)       DEFAULT 0       NOT NULL,
      FOREIGN KEY (itemno) REFERENCES item (itemno)  
);

COMMENT ON TABLE recommand is 'ȭ��ǰ ��õ';
COMMENT ON COLUMN recommand.recomno is '��õ ��Ʈ ��ȣ';
COMMENT ON COLUMN recommand.grpno is '���� ī�װ� ��ȣ';
COMMENT ON COLUMN recommand.itemno is '��ǰ ��� ��ȣ';
COMMENT ON COLUMN recommand.testresult_type is '�Ǻ�Ÿ�� ���';
COMMENT ON COLUMN recommand.testresult_recom is '����� ȭ��ǰ��õ';
COMMENT ON COLUMN recommand.recom_price is '��õ ��Ʈ ����';

DROP SEQUENCE recom_seq;
CREATE SEQUENCE recom_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
 
-- 1) �ڷ� ���� C
INSERT INTO recommand(recomno, itemno, grpno, testresult_type, testresult_recom, recom_price)
VALUES(recom_seq.nextval, 1, 1, '�Ǽ�', '������ �μ��� ��õ�մϴ�.', 50000);

INSERT INTO recommand(recomno, itemno, grpno, testresult_type, testresult_recom, recom_price)
VALUES(recom_seq.nextval, 2, 1, '����', '���бⰡ ���� �μ��� ��õ�մϴ�.', 29000);

INSERT INTO recommand(recomno, itemno, grpno, testresult_type, testresult_recom, recom_price)
VALUES(recom_seq.nextval, 3, 1, '�ΰ���', '������ ��ǰ�� ��õ�մϴ�.', 39000);

/**********************************/
/* Table Name: �̺�Ʈ */
/**********************************/
DROP TABLE event CASCADE CONSTRAINTS;
CREATE TABLE event(
		eventno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		event_title                   		VARCHAR2(200)		 NOT NULL,
		event_content                 		CLOB		 NOT NULL,
		event_img                     		VARCHAR2(1000)		 NULL ,
		event_timg                        VARCHAR2(1000)     NULL ,
		event_due                     		VARCHAR2(500)		 NOT NULL,
		event_view                    		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		event_seqno                   		NUMBER(10)		 DEFAULT 1		 NOT NULL,
		event_visible                 		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		event_rdate                   		DATE		 NOT NULL,
		event_passwd                  		VARCHAR2(10)		 NOT NULL
);

COMMENT ON TABLE event is '�̺�Ʈ';
COMMENT ON COLUMN event.eventno is '�̺�Ʈ��ȣ';
COMMENT ON COLUMN event.event_title is '�̺�Ʈ ����';
COMMENT ON COLUMN event.event_content is '�̺�Ʈ����';
COMMENT ON COLUMN event.event_img is '�̺�Ʈ�̹���';
COMMENT ON COLUMN event.event_timg is '�̺�Ʈthumb�̹���';
COMMENT ON COLUMN event.event_due is '�̺�Ʈ�Ⱓ';
COMMENT ON COLUMN event.event_view is '�̺�Ʈ��ȸ��';
COMMENT ON COLUMN event.event_seqno is '�̺�Ʈ��¼���';
COMMENT ON COLUMN event.event_visible is '��¸��';
COMMENT ON COLUMN event.event_rdate is '�����';
COMMENT ON COLUMN event.event_passwd is '�̺�Ʈ���';

DROP SEQUENCE event_seq;
CREATE SEQUENCE event_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

--���
INSERT INTO event(eventno, event_title, event_content, event_due, event_seqno, event_visible, event_passwd, event_rdate)
VALUES(event_seq.nextval, '����', '����', '2020-05-18', '1','Y','1234',sysdate);

INSERT INTO event(eventno, event_title, event_content, event_due, event_seqno, event_visible, event_passwd, event_rdate)
VALUES(event_seq.nextval, '����2', '����2','2020-05-18','2','Y','1234',sysdate);

INSERT INTO event(eventno, event_title, event_content, event_due, event_seqno, event_visible, event_passwd, event_rdate)
VALUES(event_seq.nextval, '����2', '����2','2020-05-18','2','Y','1234',sysdate);

/**********************************/
/* Table Name: �̺�Ʈ��� */
/**********************************/
DROP TABLE reply CASCADE CONSTRAINTS;

CREATE TABLE reply(
        replyno                                NUMBER(10)         NOT NULL         PRIMARY KEY,
        eventno                           NUMBER(10)    NOT     NULL ,
        memno                            NUMBER(6)         NOT NULL ,
        content                               VARCHAR2(1000)         NOT NULL,
        passwd                                VARCHAR2(20)         NOT NULL,
        rdate                                  DATE NOT NULL,
  FOREIGN KEY (eventno) REFERENCES event (eventno),
  FOREIGN KEY (memno) REFERENCES mem (memno)
);

COMMENT ON TABLE reply is '���';
COMMENT ON COLUMN reply.replyno is '��۹�ȣ';
COMMENT ON COLUMN reply.eventno is '��������ȣ';
COMMENT ON COLUMN reply.memno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN reply.content is '����';
COMMENT ON COLUMN reply.passwd is '��й�ȣ';
COMMENT ON COLUMN reply.rdate is '�����';

DROP SEQUENCE reply_seq;
CREATE SEQUENCE reply_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

--���
INSERT INTO reply(replyno, eventno, memno, content, passwd, rdate)
VALUES(reply_seq.nextval, 1, 1, '���1', '1234', sysdate);

INSERT INTO reply(replyno, eventno, memno, content, passwd, rdate)
VALUES(reply_seq.nextval, 1, 1, '���2', '1234', sysdate);

INSERT INTO reply(replyno, eventno, memno, content, passwd, rdate)
VALUES(reply_seq.nextval, 1, 1, '���3', '1234', sysdate);             

/**********************************/
/* Table Name: �������� */
/**********************************/
DROP TABLE testq CASCADE CONSTRAINTS;
CREATE TABLE testq(
		testqno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		testq_seqno                   		NUMBER(10)		 DEFAULT 1        NOT NULL,
		testq_content                 		VARCHAR2(1000)		 NOT NULL,
		testq_img                     		VARCHAR2(1000)		 NULL ,
		testq_timg                    		VARCHAR2(1000)		 NULL ,
		testq_tot                     		NUMBER(10)		 DEFAULT 0		 NOT NULL
);

COMMENT ON TABLE testq is '��������';
COMMENT ON COLUMN testq.testqno is '�ڰ�����������ȣ';
COMMENT ON COLUMN testq.testq_seqno  is '��¼���';
COMMENT ON COLUMN testq.testq_content is '������������';
COMMENT ON COLUMN testq.testq_img is '�̹���';
COMMENT ON COLUMN testq.testq_timg is 't�̹���';
COMMENT ON COLUMN testq.testq_tot is '������';

DROP SEQUENCE testq_seq;
CREATE SEQUENCE testq_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

--���
INSERT INTO testq(testqno,testq_seqno,testq_content, testq_tot)
VALUES(testq_seq.nextval,1, '1. �Ǻΰ� ���� ���̴�',0);

INSERT INTO testq(testqno,testq_seqno,testq_content, testq_tot)
VALUES(testq_seq.nextval,2, '2. ���ָ��� ����',0);

INSERT INTO testq(testqno,testq_seqno,testq_content, testq_tot)
VALUES(testq_seq.nextval,3, '3. �Ǻΰ� ���� ����������',0);

INSERT INTO testq(testqno,testq_seqno,testq_content, testq_tot)
VALUES(testq_seq.nextval,4, '4. �ܿ￡ ���� ������ �߻��Ѵ�',0);

INSERT INTO testq(testqno,testq_seqno,testq_content, testq_tot)
VALUES(testq_seq.nextval,5, '5. �չ��� ���� ư��',0);

INSERT INTO testq(testqno,testq_seqno,testq_content, testq_tot)
VALUES(testq_seq.nextval,6, '6. U���� �����ϰ� T���� ����Ÿ���',0);

INSERT INTO testq(testqno,testq_seqno,testq_content, testq_tot)
VALUES(testq_seq.nextval,7, '7. ����� �д� ',0);

INSERT INTO testq(testqno,testq_seqno,testq_content, testq_tot)
VALUES(testq_seq.nextval,8, '8. �Ϸ����� ����',0);

INSERT INTO testq(testqno,testq_seqno,testq_content, testq_tot)
VALUES(testq_seq.nextval,9, '9. �Ǻΰ� �޺� ���⿡ �Ӿ�����',0);

INSERT INTO testq(testqno,testq_seqno,testq_content, testq_tot)
VALUES(testq_seq.nextval,10, '10. �������� ���ϴ�',0);

INSERT INTO testq(testqno,testq_seqno,testq_content, testq_tot)
VALUES(testq_seq.nextval,11, '11. ȭ��ǰ�� �ٲٸ� Ʈ������ �ö�´�',0);

INSERT INTO testq(testqno,testq_seqno,testq_content, testq_tot)
VALUES(testq_seq.nextval,12, '12. ���� ���� �Ӿ�����',0);

INSERT INTO testq(testqno,testq_seqno,testq_content, testq_tot)
VALUES(testq_seq.nextval, 13, '13. ������ȭ�� �ΰ��ϴ�',0);

/**********************************/
/* Table Name: ���������׸�*/
/**********************************/
DROP TABLE testo CASCADE CONSTRAINTS;
CREATE TABLE testo(
		testono                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		testo_content                 		VARCHAR2(500)		 NOT NULL,
		testo_img                     		VARCHAR2(1000)		 NULL ,
        testo_tmg                     		VARCHAR2(1000)		 NULL ,
		testo_seqno                   		NUMBER(10)		 DEFAULT 1		 NOT NULL,
		testqno                       		NUMBER(10)		 NULL ,
        testo_cnt                            NUMBER(10)		 NULL ,
  FOREIGN KEY (testqno) REFERENCES testq (testqno)
);

COMMENT ON TABLE testo is '�����׸�';
COMMENT ON COLUMN testo.testono is '�����׸��ȣ';
COMMENT ON COLUMN testo.testo_content is '�����׸񳻿�';
COMMENT ON COLUMN testo.testo_img is '�̹���';
COMMENT ON COLUMN testo.testo_seqno is '��¼���';
COMMENT ON COLUMN testo.testqno is '�ڰ�����������ȣ';

DROP SEQUENCE testo_seq;
CREATE SEQUENCE testo_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

--���
INSERT INTO testo(testono, testqno, testo_content, testo_seqno)
VALUES(testo_seq.nextval, 1, '��',1);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 1, '����',2);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 1, '�ƴϿ�',3);

INSERT INTO testo(testono, testqno, testo_content, testo_seqno)
VALUES(testo_seq.nextval, 2, '��',1);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 2, '����',2);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 2, '�ƴϿ�',3);

INSERT INTO testo(testono, testqno, testo_content, testo_seqno)
VALUES(testo_seq.nextval, 3, '��',1);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 3, '����',2);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 3, '�ƴϿ�',3);

INSERT INTO testo(testono, testqno, testo_content, testo_seqno)
VALUES(testo_seq.nextval, 4, '��',1);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 4, '����',2);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 4, '�ƴϿ�',3);

INSERT INTO testo(testono, testqno, testo_content, testo_seqno)
VALUES(testo_seq.nextval, 5, '��',1);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 5, '����',2);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 5, '�ƴϿ�',3);

INSERT INTO testo(testono, testqno, testo_content, testo_seqno)
VALUES(testo_seq.nextval, 6, '��',1);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 6, '����',2);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 6, '�ƴϿ�',3);

INSERT INTO testo(testono, testqno, testo_content, testo_seqno)
VALUES(testo_seq.nextval, 7, '��',1);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 7, '����',2);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 7, '�ƴϿ�',3);

INSERT INTO testo(testono, testqno, testo_content, testo_seqno)
VALUES(testo_seq.nextval, 8, '��',1);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 8, '����',2);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 8, '�ƴϿ�',3);

INSERT INTO testo(testono, testqno, testo_content, testo_seqno)
VALUES(testo_seq.nextval, 9, '��',1);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 9, '����',2);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 9, '�ƴϿ�',3);

INSERT INTO testo(testono, testqno, testo_content, testo_seqno)
VALUES(testo_seq.nextval, 10, '��',1);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 10, '����',2);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 10, '�ƴϿ�',3);

INSERT INTO testo(testono, testqno, testo_content, testo_seqno)
VALUES(testo_seq.nextval, 11, '��',1);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 11, '����',2);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 11, '�ƴϿ�',3);

INSERT INTO testo(testono, testqno, testo_content, testo_seqno)
VALUES(testo_seq.nextval, 12, '��',1);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 12, '����',2);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 12, '�ƴϿ�',3);

INSERT INTO testo(testono, testqno, testo_content, testo_seqno)
VALUES(testo_seq.nextval, 13, '��',1);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 13, '����',2);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 13, '�ƴϿ�',3);


/**********************************/
/* Table Name: �������� */
/**********************************/
DROP TABLE note CASCADE CONSTRAINTS;
CREATE TABLE note(
    noteno                         NUMBER(10)  NOT NULL  PRIMARY KEY,
    notecate                       VARCHAR2(50)  NOT NULL,
    note_title                      VARCHAR2(50)  NOT NULL,
    note_content                 CLOB  NOT NULL,
    note_seqno                    NUMBER(10)  NOT NULL,
    note_manager                VARCHAR2(50)  NOT NULL,
    note_pass                      VARCHAR2(20)  NOT NULL,
    note_date                      DATE  NOT NULL
);

COMMENT ON TABLE note is '��������';
COMMENT ON COLUMN note.noteno is '�������׹�ȣ';
COMMENT ON COLUMN note.notecate is '�������� ī�װ�';
COMMENT ON COLUMN note.note_title is '�������� ����';
COMMENT ON COLUMN note.note_content is '�������� ����';
COMMENT ON COLUMN note.note_seqno is '�������� ��¼���';
COMMENT ON COLUMN note.note_manager is '�������� �ۼ���';
COMMENT ON COLUMN note.note_pass is '�������� �н�����';
COMMENT ON COLUMN note.note_date is '�����';

DROP SEQUENCE note_seq;
CREATE SEQUENCE note_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ��

-- 1) �� ���
INSERT INTO note(noteno, notecate , note_title, note_content, note_seqno, note_manager, note_pass, note_date)
VALUES(note_seq.nextval,  '����ȭ��ǰ ���ΰ���' , '��Ų�μ� ����', '��Ų�μ� ��Ʈ �ִ� ���� 40% ', 1 , '������' , '1234' ,sysdate);

INSERT INTO note(noteno, notecate , note_title, note_content, note_seqno, note_manager,note_pass, note_date)
VALUES(note_seq.nextval,  '����ũ�� ���ΰ���' , '��,�Ŀ�� ����', '��, �Ŀ�� ���� 20% ', 2 ,'������' , '1234' , sysdate);
            
INSERT INTO note(noteno, notecate , note_title, note_content, note_seqno, note_manager, note_pass ,note_date)
VALUES(note_seq.nextval,  '���� �� �������� �ȳ�' , '������ 1+1 �̺�Ʈ �մϴ�.', '������ 1�� ��� 1�� �� !  ', 3 , '������' , '1234', sysdate);

/**********************************/
/* Table Name: Qna */
/**********************************/
DROP TABLE qna CASCADE CONSTRAINTS;
CREATE TABLE qna(
      qnano                               NUMBER(10)           NOT NULL PRIMARY KEY,
      qnacate                             VARCHAR2(50)        NOT NULL,
      qna_title                            VARCHAR2(100)       NOT NULL,
      qna_content                       CLOB                     NOT NULL,   
      qna_name                          VARCHAR2(20)        NOT NULL,
      qna_pass                           VARCHAR2(20)         NOT NULL,
      upfile                                VARCHAR(100)         NULL,
      thumb                              VARCHAR(100)          NULL,
      fsize                                 NUMBER(10)            DEFAULT 0 NULL,  
      qna_date                           DATE                      NOT NULL      
);

COMMENT ON TABLE qna is 'qna';
COMMENT ON COLUMN qna.qnano is 'Qna��Ϲ�ȣ';
COMMENT ON COLUMN qna.qnacate is'�������� ī�װ�';
COMMENT ON COLUMN qna.qna_title is 'Qna����';
COMMENT ON COLUMN qna.qna_content is 'Qna���ǳ���';
COMMENT ON COLUMN qna.qna_name is 'Qna�ۼ���';
COMMENT ON COLUMN qna.qna_pass  is 'Qna��Ϻ�й�ȣ';
COMMENT ON COLUMN qna.upfile is '���� �̹���';
COMMENT ON COLUMN qna.thumb is '���� �̹��� Preview';
COMMENT ON COLUMN qna.fsize is ' ���� �̹��� ũ��';
COMMENT ON COLUMN qna.qna_date is 'Qna�����';

DROP SEQUENCE qna_seq;
CREATE SEQUENCE qna_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

-- ���
INSERT INTO qna(qnano, qnacate,qna_title, qna_content, qna_name,qna_pass, upfile, thumb, fsize, qna_date)
VALUES(qna_seq.nextval, '��ǰ��',  'ȭ��ǰ' , 'ȭ��ǰ ������� �˷��ּ���', '������' , '1234', '0','0','0',sysdate);

INSERT INTO qna(qnano, qnacate, qna_title, qna_content, qna_name,qna_pass, upfile, thumb, fsize, qna_date )
VALUES(qna_seq.nextval, '��۹���', '����ũ�� ����' , 'ȭ��ǰ ������� �˷��ּ���', '������' , '1234','0','0','0',sysdate);
-- ����īƮ ���̺�
/**********************************/
/* Table Name: ��ٱ��� */
/**********************************/
--Shopping_cartno, productno, memberno, quantity, 
DROP TABLE shopping_cart CASCADE CONSTRAINTS;
CREATE TABLE shopping_cart(
        shopping_cartno             NUMBER(10)          NOT NULL      PRIMARY KEY,
		memno                         NUMBER(10)		NOT NULL,
		itemno                     	    NUMBER(10)		    NOT NULL,
		quantity                         NUMBER(10)		    DEFAULT 1   	 NOT NULL,
        FOREIGN KEY (memno) REFERENCES mem(memno),
        FOREIGN KEY (itemno) REFERENCES item(itemno)
);

COMMENT ON TABLE shopping_cart is '��ٱ���';
COMMENT ON COLUMN shopping_cart.shopping_cartno is '��ٱ���no';
COMMENT ON COLUMN shopping_cart.memno is 'ȸ����ȣ';
COMMENT ON COLUMN shopping_cart.itemno is '��ǰno';
COMMENT ON COLUMN shopping_cart.quantity is '����';

DROP SEQUENCE shopping_cart_seq;
CREATE SEQUENCE shopping_cart_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

-- CREATE
INSERT INTO shopping_cart(shopping_cartno, memno, itemno, quantity)
VALUES(shopping_cart_seq.nextval, 1, 1, 1);
INSERT INTO shopping_cart(shopping_cartno, memno, itemno, quantity)
VALUES(shopping_cart_seq.nextval, 1, 2, 2);
INSERT INTO shopping_cart(shopping_cartno, memno, itemno, quantity)
VALUES(shopping_cart_seq.nextval, 1, 3, 3);

/**********************************/
/* Table Name: �ֹ� */
/**********************************/
DROP TABLE porder CASCADE CONSTRAINTS;
CREATE TABLE porder(
		porderno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memno                         		NUMBER(10)		 NOT NULL,
		rdate                         		    DATE		             NOT NULL,
		item_price_sum                		NUMBER(10)		 NOT NULL,
		item_discount_sum                NUMBER(10)		 NOT NULL,
		coupon_discount_sum           	NUMBER(10)		 NOT NULL,
		delivery_fee                  		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		payment_price                 		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		porder_status                 		CHAR(1)		         NOT NULL,
        porder_zip_code                   NUMBER(10)	     NOT NULL,
		porder_address                		VARCHAR2(1000)	 NOT NULL,
        porder_delivery_request          VARCHAR2(1000),
    FOREIGN KEY (memno) REFERENCES mem(memno)
);

COMMENT ON TABLE porder is '�ֹ�';
COMMENT ON COLUMN porder.porderno is '�ֹ�no';
COMMENT ON COLUMN porder.memno is 'ȸ��no';
COMMENT ON COLUMN porder.rdate is '�ֹ���¥';
COMMENT ON COLUMN porder.item_price_sum is '�ǸŰ��Ѿ�';
COMMENT ON COLUMN porder.item_discount_sum is '�����Ѿ�';
COMMENT ON COLUMN porder.coupon_discount_sum is '��������';
COMMENT ON COLUMN porder.delivery_fee is '��ۺ�';
COMMENT ON COLUMN porder.payment_price is '���������ݾ�';
COMMENT ON COLUMN porder.porder_status is '���� ����';
COMMENT ON COLUMN porder.porder_zip_code is '�����ȣ';
COMMENT ON COLUMN porder.porder_address is '�����';
COMMENT ON COLUMN porder.porder_delivery_request is '��ۿ�û����';

DROP SEQUENCE porder_seq;
CREATE SEQUENCE porder_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

-- CREATE
INSERT INTO porder(porderno, memno, rdate, item_price_sum, item_discount_sum, coupon_discount_sum, delivery_fee, payment_price, porder_status, porder_zip_code, porder_address, porder_delivery_request)
VALUES(porder_seq.nextval, 1, sysdate, 10000, 1000, 1000, 2500, 5500, 'R', 1111, '����Ư���� ������', '���տ��ΰ�����');
INSERT INTO porder(porderno, memno, rdate, item_price_sum, item_discount_sum, coupon_discount_sum, delivery_fee, payment_price, porder_status, porder_zip_code, porder_address, porder_delivery_request)
VALUES(porder_seq.nextval, 2, sysdate, 20000, 1000, 1000, 2500, 15500, 'R', 2222, '����Ư���� ���ı�', '���ǿ� �ð��ּ���');

/**********************************/
/* Table Name: �ֹ��� */
/**********************************/
DROP TABLE porder_detail CASCADE CONSTRAINTS;  
CREATE TABLE porder_detail(
		porder_detailno               		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		porderno                      		NUMBER(10)		 NOT NULL,
		itemno                        		NUMBER(10)		 NOT NULL,
		quantity                      		NUMBER(10)		 DEFAULT 1		 NOT NULL,
		item_price_sum                		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		item_discount_sum             		NUMBER(10)		 NOT NULL,
		payment_price                 		NUMBER(10)		 NOT NULL,
        porder_detail_status                 CHAR(1)		 NOT NULL,
        trackingno                    		NUMBER(10)		 NULL,
  FOREIGN KEY (itemno) REFERENCES item (itemno),
  FOREIGN KEY (porderno) REFERENCES porder (porderno)
);

COMMENT ON TABLE porder_detail is '�ֹ���';
COMMENT ON COLUMN porder_detail.porder_detailno is '�ֹ���no';
COMMENT ON COLUMN porder_detail.porderno is '�ֹ�no';
COMMENT ON COLUMN porder_detail.itemno is '��ǰno';
COMMENT ON COLUMN porder_detail.quantity is '����';
COMMENT ON COLUMN porder_detail.item_price_sum is '�ǸŰ��Ѿ�';
COMMENT ON COLUMN porder_detail.item_discount_sum is '�����Ѿ�';
COMMENT ON COLUMN porder_detail.payment_price is '����������';
COMMENT ON COLUMN porder_detail.porder_detail_status is '�ֹ��󼼽��λ���';
COMMENT ON COLUMN porder_detail.trackingno is '������ȣ';

DROP SEQUENCE porder_detail_seq;
CREATE SEQUENCE porder_detail_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

-- CREATE
INSERT INTO porder_detail(porder_detailno,porderno,itemno,quantity,item_price_sum,item_discount_sum, payment_price, porder_detail_status)
VALUES(porder_detail_seq.nextval, 1, 1, 10, 1000, 100, 900, 'R');

INSERT INTO porder_detail(porder_detailno,porderno,itemno,quantity,item_price_sum,item_discount_sum, payment_price, porder_detail_status)
VALUES(porder_detail_seq.nextval, 1, 2, 10, 1000, 100, 900, 'R');

INSERT INTO porder_detail(porder_detailno,porderno,itemno,quantity,item_price_sum,item_discount_sum, payment_price, porder_detail_status)
VALUES(porder_detail_seq.nextval, 1, 3, 10, 1000, 100, 900, 'R');

/**********************************/
/* Table Name: �̺�Ʈ���� */
/**********************************/
DROP TABLE coupon CASCADE CONSTRAINTS;
CREATE TABLE coupon(
		couponno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		cpimg                         		VARCHAR2(100)		 NULL,
        cpupimg                         		VARCHAR2(100)		 NULL,
        cpthumb                         		VARCHAR2(100)		 NULL,
		cpname                        		VARCHAR2(200)		 NOT NULL,
		cpdiscount                    		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		cpstock                       		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		cpcate                        		VARCHAR2(100)		 NULL 
);

COMMENT ON TABLE coupon is '�̺�Ʈ����';
COMMENT ON COLUMN coupon.couponno is '����no';
COMMENT ON COLUMN coupon.cpimg is '�����̹���';
COMMENT ON COLUMN coupon.cpupimg is '�������ε����ϸ��̹���';
COMMENT ON COLUMN coupon.cpthumb is '�����̹��������';
COMMENT ON COLUMN coupon.cpname is '�����̸�';
COMMENT ON COLUMN coupon.cpdiscount is '�������αݾ�';
COMMENT ON COLUMN coupon.cpstock is '�������';
COMMENT ON COLUMN coupon.cpcate is '��밡��ī�װ�';

DROP SEQUENCE coupon_seq;
CREATE SEQUENCE coupon_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

-- couponno, cpimg, cpupimg, cpthumb, cpname, cpdiscount, cpstock, cpcate

-- CREATE
INSERT INTO coupon(couponno, cpimg, cpupimg, cpthumb, cpname, cpdiscount, cpstock, cpcate)
VALUES(coupon_seq.nextval, 'sample.jpg', 'sample1.jpg', 'sample_t.jpg', '1000�� ���� ����', 1000, 100, '��Ų');

INSERT INTO coupon(couponno, cpimg, cpupimg, cpthumb, cpname, cpdiscount, cpstock, cpcate)
VALUES(coupon_seq.nextval, 'sample.jpg', 'sample1.jpg', 'sample_t.jpg', '2000�� ���� ����', 2000, 100, '�μ�');

INSERT INTO coupon(couponno, cpimg, cpupimg, cpthumb, cpname, cpdiscount, cpstock)
VALUES(coupon_seq.nextval, 'sample.jpg', 'sample_1.jpg', 'sample_t.jpg', '��۷� ���� ����', 2500, 100);

/**********************************/
/* Table Name: �����߱޳��� */
/**********************************/
DROP TABLE coupon_issue CASCADE CONSTRAINTS;
CREATE TABLE coupon_issue(
		coupon_issueno                		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memno                         		NUMBER(10)		 NOT NULL,
		couponno                      		NUMBER(10)		 NOT NULL ,
		cpcnt                           		NUMBER(10)		 NOT NULL,
		cpissue                        		DATE		 NOT NULL,
		cpexpired                      		DATE		 NOT NULL,
		cpstatus                 		CHAR(1)		 NOT NULL ,
	FOREIGN KEY (memno) REFERENCES mem(memno),
    FOREIGN KEY (couponno) REFERENCES coupon (couponno)
);

COMMENT ON TABLE coupon_issue is '�����߱޳���';
COMMENT ON COLUMN coupon_issue.coupon_issueno is '�����߱�no';
COMMENT ON COLUMN coupon_issue.memno is 'ȸ��no';
COMMENT ON COLUMN coupon_issue.couponno is '����no';
COMMENT ON COLUMN coupon_issue.cpcnt is '�����߱޼���';
COMMENT ON COLUMN coupon_issue.cpissue is '�����߱���';
COMMENT ON COLUMN coupon_issue.cpexpired is '����������';
COMMENT ON COLUMN coupon_issue.cpstatus is '��������'; -- I: issue �߱�, U: used ���Ϸ�, C:calceled �߱����

DROP SEQUENCE coupon_issue_seq;
CREATE SEQUENCE coupon_issue_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

-- coupon_issueno, memno, couponno, cpcnt, cpissue, cpexpired, cpstatus

-- CREATE
-- ��ҽ� ��߱�
INSERT INTO coupon_issue(coupon_issueno, memno, couponno, cpcnt, cpissue, cpexpired, cpstatus)
VALUES(coupon_issue_seq.nextval, 1, 1, 1, sysdate, add_months(sysdate,1), 'I');
INSERT INTO coupon_issue(coupon_issueno, memno, couponno, cpcnt, cpissue, cpexpired, cpstatus)
VALUES(coupon_issue_seq.nextval, 1, 2, 1, sysdate, add_months(sysdate,1), 'I');
INSERT INTO coupon_issue(coupon_issueno, memno, couponno, cpcnt, cpissue, cpexpired, cpstatus)
VALUES(coupon_issue_seq.nextval, 1, 3, 1, sysdate, add_months(sysdate,1), 'I');

INSERT INTO coupon_issue(coupon_issueno, memno, couponno, cpcnt, cpissue, cpexpired, cpstatus)
VALUES(coupon_issue_seq.nextval, 1, 3, 1, sysdate, add_months(sysdate,-1), 'I');

INSERT INTO coupon_issue(coupon_issueno, memno, couponno, cpcnt, cpissue, cpexpired, cpstatus)
VALUES(coupon_issue_seq.nextval, 1, 3, 1, sysdate, sysdate, 'I');

/**********************************/
/* Table Name: ���� ��� ���� */
/**********************************/
DROP TABLE coupon_use CASCADE CONSTRAINTS;
CREATE TABLE coupon_use(
		coupon_useno                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		porderno                      		NUMBER(10)		 NOT NULL ,
		coupon_issueno                		NUMBER(10)		 NOT NULL ,
		rdate                         		DATE		 NOT NULL,
        cpstatus                 		CHAR(1)		 NOT NULL ,
  FOREIGN KEY (porderno) REFERENCES porder (porderno),
  FOREIGN KEY (coupon_issueno) REFERENCES coupon_issue (coupon_issueno)
);

COMMENT ON TABLE coupon_use is '���� ��� ����';
COMMENT ON COLUMN coupon_use.coupon_useno is '���� ���no';
COMMENT ON COLUMN coupon_use.porderno is '�ֹ�no';
COMMENT ON COLUMN coupon_use.coupon_issueno is '�����߱�no';
COMMENT ON COLUMN coupon_use.rdate is '���� �����';
COMMENT ON COLUMN coupon_use.cpstatus is '��������'; -- ���:U, ���:C

DROP SEQUENCE coupon_use_seq;
CREATE SEQUENCE coupon_use_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

-- CREATE
INSERT INTO coupon_use(coupon_useno, porderno, coupon_issueno, rdate, cpstatus)
VALUES(coupon_use_seq.nextval, 1, 1, sysdate, 'U');

INSERT INTO coupon_use(coupon_useno, porderno, coupon_issueno, rdate, cpstatus)
VALUES(coupon_use_seq.nextval, 2, 2, sysdate, 'U');


-- �ֹ� �󼼿� ����� 1:1 ����
-- REST�� ��� ��ü���� ������ ���̺� -> reference ���谡 ���� �� ����. 
-- �����ϴ� ����� �ٸ���
/**********************************/
/* Table Name: ��� */
/**********************************/
DROP TABLE delivery CASCADE CONSTRAINTS;
CREATE TABLE delivery(
		trackingno                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
        porder_company                      		VARCHAR2(100)		 NULL ,
        porderno                    		NUMBER(10)		 NULL,
        porder_detailno                    		NUMBER(10)		 NULL,
		dman                          		VARCHAR2(30)		 NULL ,
		delivery_date                 		DATE		 NULL ,
		status                        		CHAR(1)		 NULL
);

COMMENT ON TABLE delivery is '���';
COMMENT ON COLUMN delivery.trackingno is '������ȣ';
COMMENT ON COLUMN delivery.porder_company is '��ۿ�ûȸ��';
COMMENT ON COLUMN delivery.porderno is '�ֹ���ȣ';
COMMENT ON COLUMN delivery.porder_detailno is '�ֹ��󼼹�ȣ';
COMMENT ON COLUMN delivery.dman is '�����';
COMMENT ON COLUMN delivery.delivery_date is '��ۻ�������ó����';
COMMENT ON COLUMN delivery.status is '��ۻ���'; -- �غ���(R), �������(S), �����(O), ��ۿϷ�(C), ��ǰ(R) ??

-- ������
DROP SEQUENCE delivery_seq;
CREATE SEQUENCE delivery_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

-- CREATE
INSERT INTO delivery(trackingno, porder_company, porderno, porder_detailno, dman, delivery_date, status)
VALUES(delivery_seq.nextval, 'SKINFIT', 1, 1, '�մ���', sysdate, 'S');

INSERT INTO delivery(trackingno, porder_company, porderno, porder_detailno, dman, delivery_date, status)
VALUES(delivery_seq.nextval, 'SKINFIT', 1, 1, '�Ʒι�', sysdate, 'S');

INSERT INTO delivery(trackingno, porder_company, porderno, porder_detailno, dman, delivery_date, status)
VALUES(delivery_seq.nextval, 'SKINFIT', 1, 1, '����', sysdate, 'S');





