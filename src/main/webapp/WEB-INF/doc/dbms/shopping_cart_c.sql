-- 상품 테이블
/**********************************/
/* Table Name: 상품 */
/**********************************/
DROP TABLE item CASCADE CONSTRAINTS;
CREATE TABLE item(
		itemno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE item is '상품';
COMMENT ON COLUMN item.itemno is '상품no';

DROP SEQUENCE item_seq;
CREATE SEQUENCE item_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

INSERT INTO item(itemno) VALUES (item_seq.nextval);
INSERT INTO item(itemno) VALUES (item_seq.nextval);
INSERT INTO item(itemno) VALUES (item_seq.nextval);

SELECT * FROM item;

/**********************************/
/* Table Name: 회원 */
/**********************************/
DROP TABLE mem CASCADE CONSTRAINTS;
CREATE TABLE mem(
		memno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE mem is '회원';
COMMENT ON COLUMN mem.memno is '회원no';


DROP SEQUENCE mem_seq;
CREATE SEQUENCE mem_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

INSERT INTO mem(memno) VALUES (mem_seq.nextval);
INSERT INTO mem(memno) VALUES (mem_seq.nextval);
INSERT INTO mem(memno) VALUES (mem_seq.nextval);

SELECT * FROM mem;

-- 쇼핑카트 테이블
/**********************************/
/* Table Name: 장바구니 */
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

COMMENT ON TABLE shopping_cart is '장바구니';
COMMENT ON COLUMN shopping_cart.shopping_cartno is '장바구니no';
COMMENT ON COLUMN shopping_cart.memno is '회원번호';
COMMENT ON COLUMN shopping_cart.itemno is '상품no';
COMMENT ON COLUMN shopping_cart.quantity is '수량';

DROP SEQUENCE shopping_cart_seq;
CREATE SEQUENCE shopping_cart_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

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

-- 조인 리스트
-- 순서 -> 장바구니에 있는 것만 조인하면 되므로, 장바구니와 아이템을 가장 먼저 합침
-- 장바구니 + 아이템 + 그룹 -> 근데 그룹에 너무 정보가 없다 굳이 합쳐야 할까..
-- 장바구니 + 아이템
SELECT *
FROM shopping_cart sc, item it
WHERE sc.itemno = it.itemno
ORDER BY shopping_cartno DESC

-- 장바구니 + 아이템 + 그룹
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

-- 장바구니 중복 검사
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




