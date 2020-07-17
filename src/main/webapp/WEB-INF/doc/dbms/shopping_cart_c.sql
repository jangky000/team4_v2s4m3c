-- ��ǰ ���̺�
/**********************************/
/* Table Name: ��ǰ */
/**********************************/
DROP TABLE item CASCADE CONSTRAINTS;
CREATE TABLE item(
		itemno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE item is '��ǰ';
COMMENT ON COLUMN item.itemno is '��ǰno';

DROP SEQUENCE item_seq;
CREATE SEQUENCE item_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

INSERT INTO item(itemno) VALUES (item_seq.nextval);
INSERT INTO item(itemno) VALUES (item_seq.nextval);
INSERT INTO item(itemno) VALUES (item_seq.nextval);

SELECT * FROM item;

/**********************************/
/* Table Name: ȸ�� */
/**********************************/
DROP TABLE mem CASCADE CONSTRAINTS;
CREATE TABLE mem(
		memno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE mem is 'ȸ��';
COMMENT ON COLUMN mem.memno is 'ȸ��no';


DROP SEQUENCE mem_seq;
CREATE SEQUENCE mem_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

INSERT INTO mem(memno) VALUES (mem_seq.nextval);
INSERT INTO mem(memno) VALUES (mem_seq.nextval);
INSERT INTO mem(memno) VALUES (mem_seq.nextval);

SELECT * FROM mem;

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

COMMIT;

-- LIST
SELECT shopping_cartno, memno, itemno, quantity
FROM shopping_cart
ORDER BY shopping_cartno DESC;

-- ���� ����Ʈ
-- ���� -> ��ٱ��Ͽ� �ִ� �͸� �����ϸ� �ǹǷ�, ��ٱ��Ͽ� �������� ���� ���� ��ħ
-- ��ٱ��� + ������ + �׷� -> �ٵ� �׷쿡 �ʹ� ������ ���� ���� ���ľ� �ұ�..
-- ��ٱ��� + ������
SELECT *
FROM shopping_cart sc, item it
WHERE sc.itemno = it.itemno
ORDER BY shopping_cartno DESC

-- ��ٱ��� + ������ + �׷�
SELECT ig.grpno, ig.name as grpname, 
            si.itemno, si.item_name, si.item_price, si.discount_rate, si.item_type, si.item_origin, si.upfile, si.thumb,
             si.shopping_cartno, si.memno, si.quantity
FROM itemgrp ig, (SELECT it.itemno, it.grpno, it.item_name, it.item_price, it.discount_rate, it.item_type, it.item_origin, it.upfile, it.thumb,
                            sc.shopping_cartno, sc.memno, sc.quantity
                            FROM shopping_cart sc, item it
                            WHERE sc.itemno = it.itemno AND sc.memno = 1
                            ORDER BY shopping_cartno DESC) si
WHERE ig.grpno = si.grpno

-- READ
SELECT shopping_cartno, memno, itemno, quantity
FROM shopping_cart
WHERE shopping_cartno=1;

-- ��ٱ��� �ߺ� �˻�
--shopping_cart_check
SELECT shopping_cartno
FROM shopping_cart
WHERE memno=2 AND itemno=1;

-- UPDATE
-- quantity_up
UPDATE shopping_cart
SET quantity=quantity + 1
WHERE shopping_cartno = 1;

-- quantity_down
UPDATE shopping_cart
SET quantity=quantity - 1
WHERE shopping_cartno = 1;

-- DELETE
DELETE FROM shopping_cart
WHERE shopping_cartno=3;

COMMIT;




