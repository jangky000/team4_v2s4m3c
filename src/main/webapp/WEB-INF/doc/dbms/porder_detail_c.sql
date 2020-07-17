DROP TABLE porder_detail CASCADE CONSTRAINTS;
DROP TABLE porder CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: 주문상세 */
/**********************************/
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

COMMENT ON TABLE porder_detail is '주문상세';
COMMENT ON COLUMN porder_detail.porder_detailno is '주문상세no';
COMMENT ON COLUMN porder_detail.porderno is '주문no';
COMMENT ON COLUMN porder_detail.itemno is '상품no';
COMMENT ON COLUMN porder_detail.quantity is '수량';
COMMENT ON COLUMN porder_detail.item_price_sum is '판매가총액';
COMMENT ON COLUMN porder_detail.item_discount_sum is '할인총액';
COMMENT ON COLUMN porder_detail.payment_price is '최종결제액';
COMMENT ON COLUMN porder_detail.porder_detail_status is '주문상세승인상태';
COMMENT ON COLUMN porder_detail.trackingno is '운송장번호';

DROP SEQUENCE porder_detail_seq;
CREATE SEQUENCE porder_detail_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

-- CREATE
INSERT INTO porder_detail(porder_detailno,porderno,itemno,quantity,item_price_sum,item_discount_sum, payment_price, porder_detail_status)
VALUES(porder_detail_seq.nextval, 1, 1, 10, 1000, 100, 900, 'R');

INSERT INTO porder_detail(porder_detailno,porderno,itemno,quantity,item_price_sum,item_discount_sum, payment_price, porder_detail_status)
VALUES(porder_detail_seq.nextval, 1, 2, 10, 1000, 100, 900, 'R');

INSERT INTO porder_detail(porder_detailno,porderno,itemno,quantity,item_price_sum,item_discount_sum, payment_price, porder_detail_status)
VALUES(porder_detail_seq.nextval, 1, 3, 10, 1000, 100, 900, 'R');

COMMIT;

-- LIST
-- 관리자
SELECT porder_detailno,porderno,itemno,quantity,item_price_sum,item_discount_sum, payment_price, porder_detail_status, trackingno
FROM porder_detail
ORDER BY porder_detailno DESC;

-- 사용자
-- list_by_porderno
SELECT porder_detailno,porderno,itemno,quantity,item_price_sum,item_discount_sum, payment_price, porder_detail_status, trackingno
FROM porder_detail
WHERE porderno = 1
ORDER BY porder_detailno DESC;

-- list_by_porderno_join_item
SELECT it.itemno, it.grpno, it.item_name, it.item_price, it.item_cost, it.discount_rate, it.item_content, it.item_type, it.item_effect, it.item_origin, it.item_visible, it.item_visibleno, it.item_recom, it.item_view, it.item_rdate, it.upfile, it.thumb, it.fsize
FROM item it, (SELECT porder_detailno,porderno,itemno,quantity,item_price_sum,item_discount_sum, payment_price, porder_detail_status, trackingno
                    FROM porder_detail
                    WHERE porderno = 1
                    ORDER BY porder_detailno DESC) pd
WHERE it.itemno = pd.itemno;

-- READ
SELECT porder_detailno,porderno,itemno,quantity,item_price_sum,item_discount_sum, payment_price, porder_detail_status, trackingno
FROM porder_detail
WHERE porder_detailno = 1;

COMMIT;

-- UPDATE
-- 운송장 등록
UPDATE porder_detail
SET trackingno = 1
WHERE porder_detailno = 1;

-- 운송장 삭제
UPDATE porder_detail
SET trackingno = null
WHERE porder_detailno = 1;

-- 승인 상태 변경
UPDATE porder_detail
SET porder_detail_status = 'C'
WHERE porder_detailno = 1;

-- 주문 취소, 수량 변경
UPDATE porder_detail
SET quantity=1, item_price_sum=100, item_discount_sum=10, payment_price=90, porder_detail_status='R'
WHERE porder_detailno = 1;

-- DELETE
DELETE FROM porder_detail
WHERE porder_detailno = 1;

ROLLBACK;
