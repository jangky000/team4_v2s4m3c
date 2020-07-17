DROP TABLE porder_detail CASCADE CONSTRAINTS;
DROP TABLE porder CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: �ֹ��� */
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

COMMIT;

-- LIST
-- ������
SELECT porder_detailno,porderno,itemno,quantity,item_price_sum,item_discount_sum, payment_price, porder_detail_status, trackingno
FROM porder_detail
ORDER BY porder_detailno DESC;

-- �����
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
-- ����� ���
UPDATE porder_detail
SET trackingno = 1
WHERE porder_detailno = 1;

-- ����� ����
UPDATE porder_detail
SET trackingno = null
WHERE porder_detailno = 1;

-- ���� ���� ����
UPDATE porder_detail
SET porder_detail_status = 'C'
WHERE porder_detailno = 1;

-- �ֹ� ���, ���� ����
UPDATE porder_detail
SET quantity=1, item_price_sum=100, item_discount_sum=10, payment_price=90, porder_detail_status='R'
WHERE porder_detailno = 1;

-- DELETE
DELETE FROM porder_detail
WHERE porder_detailno = 1;

ROLLBACK;
