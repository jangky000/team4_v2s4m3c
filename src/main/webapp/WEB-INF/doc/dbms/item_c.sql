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
 
1) �ڷ� ����           
INSERT INTO item(itemno, grpno, item_name, item_stock, item_price, item_cost, discount_rate, item_content,
                        item_type, item_effect,item_origin, item_visible, item_visibleno, item_recom, item_view, item_rdate, upfile, thumb, fsize)
VALUES(item_seq.nextval, 1, '���ֻ� ��Ų', 10, 11000, 5500, 30, '������ ������ ���� ��Ų', 
           '��Ų', '������ ���� ������ ���ƿ� ���ƿ�', '���ֻ�', 'Y', 1, 0, 0, sysdate, 'mango.png', 'mango_t.png', 23657 );

INSERT INTO item(itemno, grpno, item_name, item_stock, item_price, item_cost, discount_rate, item_content,
                        item_type, item_effect,item_origin, item_visible, item_visibleno, item_recom, item_view, item_rdate, upfile, thumb, fsize)
VALUES(item_seq.nextval, 1, '���ֻ� �μ�', 12, 13000, 5500, 30, '������ ������ ���� ��Ų', 
           '�μ�', '������ ���� ������ ���ƿ� ���ƿ�', '���ֻ�', 'Y', 2, 0, 0, sysdate, 'pineapple.png', 'pineapple_t.png', 23657 );
            
INSERT INTO item(itemno, grpno, item_name, item_stock, item_price, item_cost, discount_rate, item_content,
                        item_type, item_effect,item_origin, item_visible, item_visibleno, item_recom, item_view, item_rdate, upfile, thumb, fsize)
VALUES(item_seq.nextval, 2, '���帧 �μ�', 10, 10000, 5000, 30, '������ ���帧 ���� �μ�', 
           '�μ�', '���帧 ���� ������ ���ƿ� ���ƿ�', 'ȣ�ֻ�', 'Y', 3, 0, 0, sysdate, 'sample.png', 'sample_t.png', 23657 );
           
INSERT INTO item(itemno, grpno, item_name, item_stock, item_price, item_cost, discount_rate, item_content,
                        item_type, item_effect,item_origin, item_visible, item_visibleno, item_recom, item_view, item_rdate, upfile, thumb, fsize)
VALUES(item_seq.nextval, 2, '���帧 ��Ų', 10, 11000, 5500, 30, '������ ���帧 ���� ��Ų', 
           '��Ų', '���帧 ���� ������ ���ƿ� ���ƿ�', 'ȣ�ֻ�', 'Y', 4, 0, 0, sysdate, 'sample.png', 'sample_t.png', 23657 );
           
INSERT INTO item(itemno, grpno, item_name, item_stock, item_price, item_cost, discount_rate, item_content,
                        item_type, item_effect,item_origin, item_visible, item_visibleno, item_recom, item_view, item_rdate, upfile, thumb, fsize)
VALUES(item_seq.nextval, 3, '���� �μ�', 10, 9000, 5000, 30, '������ ���� ���� �μ�', 
           '�μ�', '���� ���� ������ ���ƿ� ���ƿ�', 'ȣ�ֻ�', 'Y', 5, 0, 0, sysdate, 'sample.png', 'sample_t.png', 23657 );
           
INSERT INTO item(itemno, grpno, item_name, item_stock, item_price, item_cost, discount_rate, item_content,
                        item_type, item_effect,item_origin, item_visible, item_visibleno, item_recom, item_view, item_rdate, upfile, thumb, fsize)
VALUES(item_seq.nextval, 3, '���ξ��� ��Ų', 10, 8000, 4000, 30, '������ ���ξ��� ���� ��Ų', 
           '��Ų', '���ξ��� ���� ������ ���ƿ� ���ƿ�', 'ȣ�ֻ�', 'Y', 6, 0, 0, sysdate, 'sample.png', 'sample_t.png', 23657 );           

COMMIT;   

2) ����Ʈ
SELECT itemno, grpno, item_name, item_stock, item_price, item_cost, discount_rate, item_content,
          item_type, item_effect,item_origin, item_visible, item_visibleno, item_recom, item_view, item_rdate, item_rdate, upfile, thumb, fsize
FROM item
ORDER BY itemno ASC;

3) ���̺� 1�� ��ȸ
SELECT itemno, grpno, item_name, item_stock, item_price, item_cost, discount_rate, item_content,
          item_type, item_effect,item_origin, item_recom, item_view, item_rdate, item_rdate, upfile, thumb, fsize
FROM item
WHERE itemno = 3;

4) 1�� ���ڵ� ����
UPDATE item
SET item_name = '���ѻ� �μ�' , item_stock = 12, item_price = 3000, item_cost = 1500, discount_rate=10, item_content='���ѻ� �������μ�', 
      item_type='�μ�', item_effect='ȣ���� ����� ��', item_origin='����'
WHERE itemno = 3;

7) 1�� ���ڵ� ����
DELETE FROM item
WHERE itemno = 3;

8) ���ڵ� ����
SELECT COUNT(*) as cnt
FROM item;
 
9) left outer join
SELECT itemno, i.grpno as i_grpno, g.grpno as g_grpno, name, item_name, item_stock, item_price, item_cost, discount_rate, item_content,
          item_type, item_effect,item_origin, item_recom, item_view, item_rdate, item_rdate, upfile, thumb, fsize
FROM item i, itemgrp g
WHERE i.grpno = g.grpno
ORDER BY itemno ASC;

SELECT  g.grpno as g_grpno, g.name as g_name,
          i.itemno as i_itemno, i.grpno as i_grpno, i.item_name as i_name,
          i.item_stock as i_stock, i.item_price as i_price, i.item_cost as i_cost, 
          i.discount_rate as i_discount_rate,  i.item_content as i_content, 
          i.item_type as i_type, i.item_effect as i_effect,
          i.item_origin as i_origin,  i.item_visible as i_item_visible,
          i.item_recom as i_recom, i.item_view as i_view, i.item_rdate as i_rdate, 
          i.item_rdate as i_rdate, i.upfile as i_upfile, i.thumb as i_thumb, i.fsize as i_fsize
FROM item i, itemgrp g
WHERE i.grpno = g.grpno
ORDER BY i.grpno DESC, i.itemno ASC;


10)  left outer join
SELECT  g.grpno as g_grpno, g.name as g_name,
          i.itemno as i_itemno, i.grpno as i_grpno, i.item_name as i_name,
          i.item_stock as i_stock, i.item_price as i_price, i.item_cost as i_cost, 
          i.discount_rate as i_discount_rate,  i.item_content as i_content, 
          i.item_type as i_type, i.item_effect as i_effect,
          i.item_origin as i_origin,  i.item_visible as i_item_visible,
          i.item_recom as i_recom, i.item_view as i_view, i.item_rdate as i_rdate, 
          i.item_rdate as i_rdate, i.upfile as i_upfile, i.thumb as i_thumb, i.fsize as i_fsize
FROM item i, itemgrp g
WHERE i.grpno = g.grpno  AND i.grpno=1
ORDER BY i.grpno DESC, i.itemno ASC;

commit;