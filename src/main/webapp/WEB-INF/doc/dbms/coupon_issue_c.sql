DROP TABLE coupon_issue CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: �����߱޳��� */
/**********************************/
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

COMMIT;

--List
SELECT coupon_issueno, memno, couponno, cpcnt, cpissue, cpexpired, cpstatus
FROM coupon_issue
ORDER BY coupon_issueno DESC;

-- list_by_memno_join_coupon_not_used
-- �ݹ� ����Ǵ� ������ �켱, ����� ���� ����
SELECT c.couponno as ccouponno, c.cpthumb as ccpthumb, c.cpname as ccpname, c.cpdiscount as ccpdiscount, c.cpcate as ccpcate,
            ci.coupon_issueno as cicoupon_issueno, ci.memno as cimemno, ci.couponno as cicouponno, ci.cpcnt as cicpcnt, ci.cpissue as cicpissue, ci.cpexpired as cicpexpired, ci.cpstatus as cicpstatus
FROM coupon c, coupon_issue ci
WHERE memno = 1 AND ci.couponno = c.couponno AND ci.cpstatus = 'I' AND ci.cpexpired >= sysdate
ORDER BY cpexpired ASC;

-- READ
SELECT coupon_issueno, memno, couponno, cpcnt, cpissue, cpexpired, cpstatus
FROM coupon_issue
WHERE coupon_issueno=1;

-- UPDATE
-- ��� �Ϸ�
UPDATE coupon_issue 
SET cpstatus='U'
WHERE coupon_issueno = 1;

-- ���� ����
UPDATE coupon_issue 
SET cpcnt=2
WHERE coupon_issueno = 1;

-- DELETE
DELETE FROM coupon_issue
WHERE coupon_issueno = 1;

ROLLBACK;

-- JOIN
SELECT *
FROM coupon cp, coupon_issue cpi
WHERE cp.couponno = cpi.couponno;