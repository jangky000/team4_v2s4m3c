DROP TABLE coupon_use CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: ���� ��� ���� */
/**********************************/
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

-- coupon_useno, porderno, coupon_issueno, rdate, cpstatus

-- CREATE
INSERT INTO coupon_use(coupon_useno, porderno, coupon_issueno, rdate, cpstatus)
VALUES(coupon_use_seq.nextval, 1, 1, sysdate, 'U');

INSERT INTO coupon_use(coupon_useno, porderno, coupon_issueno, rdate, cpstatus)
VALUES(coupon_use_seq.nextval, 2, 2, sysdate, 'U');

INSERT INTO coupon_use(coupon_useno, porderno, coupon_issueno, rdate, cpstatus)
VALUES(coupon_use_seq.nextval, 3, 3, sysdate, 'U');

COMMIT;

-- LIST
SELECT coupon_useno, porderno, coupon_issueno, rdate, cpstatus
FROM coupon_use
ORDER BY coupon_useno DESC;

-- READ
SELECT coupon_useno, porderno, coupon_issueno, rdate, cpstatus
FROM coupon_use
WHERE coupon_useno=1;

-- UPDATE
-- ���� ���
UPDATE coupon_use 
SET cpstatus='C'
WHERE coupon_useno = 1;

-- DELETE
DELETE FROM coupon_use
WHERE coupon_useno = 1;

ROLLBACK;

