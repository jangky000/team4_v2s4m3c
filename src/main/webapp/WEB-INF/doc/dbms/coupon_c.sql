DROP TABLE coupon CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: �̺�Ʈ���� */
/**********************************/
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

COMMIT;

-- LIST
SELECT couponno, cpimg, cpupimg, cpthumb, cpname, cpdiscount, cpstock, cpcate
FROM coupon
ORDER BY couponno DESC;

-- ����¡
-- list_by_couponno_paging
SELECT couponno, cpimg, cpupimg, cpthumb, cpname, cpdiscount, cpstock, cpcate, r
FROM (
           SELECT couponno, cpimg, cpupimg, cpthumb, cpname, cpdiscount, cpstock, cpcate, rownum as r
           FROM (
                     SELECT couponno, cpimg, cpupimg, cpthumb, cpname, cpdiscount, cpstock, cpcate
                     FROM coupon
                     ORDER BY couponno DESC
           )          
)
WHERE r >= 11 AND r <=20;


-- READ
SELECT couponno, cpimg, cpupimg, cpthumb, cpname, cpdiscount, cpstock, cpcate
FROM coupon
WHERE couponno = 1;

-- UPDATE
-- ���� ����
UPDATE coupon 
SET cpstock=cpstock-1
WHERE couponno = 1;

-- �̹��� ����
UPDATE coupon 
SET cpimg='./sample2.png'
WHERE couponno = 1;

-- ���� �̸�, ���� �ݾ�, ���, ��밡�� ī�װ� ����
UPDATE coupon 
SET cpname='10000�� ���� ����', cpdiscount=10000, cpstock=100, cpcate='1|2|3|4|5'
WHERE couponno = 1;

-- DELETE
DELETE FROM coupon
WHERE couponno = 1;

ROLLBACK;