DROP TABLE delivery CASCADE CONSTRAINTS;

-- �ֹ� �󼼿� ����� 1:1 ����
-- REST�� ��� ��ü���� ������ ���̺� -> reference ���谡 ���� �� ����. 
-- �����ϴ� ����� �ٸ���
/**********************************/
/* Table Name: ��� */
/**********************************/
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

-- trackingno, porder_company, porderno, porder_detailno, dman, delivery_date, status

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

INSERT INTO delivery(trackingno, porder_company, porderno, porder_detailno, dman, delivery_date, status)
VALUES(delivery_seq.nextval, 'SKINFIT', 1, 1, '�մ���', sysdate, 'O');

INSERT INTO delivery(trackingno, porder_company, porderno, porder_detailno, dman, delivery_date, status)
VALUES(delivery_seq.nextval, 'SKINFIT', 1, 1, '�Ʒι�', sysdate, 'O');

INSERT INTO delivery(trackingno, porder_company, porderno, porder_detailno, dman, delivery_date, status)
VALUES(delivery_seq.nextval, 'SKINFIT', 1, 1, '����', sysdate, 'O');

INSERT INTO delivery(trackingno, porder_company, porderno, porder_detailno, dman, delivery_date, status)
VALUES(delivery_seq.nextval, 'SKINFIT', 1, 1, '�մ���', sysdate, 'C');

INSERT INTO delivery(trackingno, porder_company, porderno, porder_detailno, dman, delivery_date, status)
VALUES(delivery_seq.nextval, 'SKINFIT', 1, 1, '�Ʒι�', sysdate, 'C');

INSERT INTO delivery(trackingno, porder_company, porderno, porder_detailno, dman, delivery_date, status)
VALUES(delivery_seq.nextval, 'SKINFIT', 1, 1, '����', sysdate, 'C');

COMMIT;

-- LIST
SELECT trackingno, porder_company, porderno, porder_detailno, dman, delivery_date, status
FROM delivery
ORDER BY trackingno DESC;

-- ȸ�纰 LIST
SELECT trackingno, porder_company, porderno, porder_detailno, dman, delivery_date, status
FROM delivery
WHERE porder_company = UPPER('skinfit')
ORDER BY trackingno DESC;


-- ��� ���º� cnt
SELECT status, COUNT(*) as cnt
FROM delivery
WHERE porder_company = UPPER('skinfit')
GROUP BY status
ORDER BY status ASC;


-- ������� ���� ��ǰ�� ����
SELECT trackingno, porder_company, porderno, porder_detailno, dman, delivery_date, status
FROM delivery
WHERE status = 'S'
ORDER BY trackingno DESC;

-- ������� ��ǰ�� ����
SELECT trackingno, porder_company, porderno, porder_detailno, dman, delivery_date, status
FROM delivery
WHERE status = 'O'
ORDER BY trackingno DESC;

-- ��� �Ϸ� ��ǰ�� ����
SELECT trackingno, porder_company, porderno, porder_detailno, dman, delivery_date, status
FROM delivery
WHERE status = 'C'
ORDER BY trackingno DESC;

-- READ
-- ������ȣ�� ���� ��� ����
SELECT trackingno, porder_company, porderno, porder_detailno, dman, delivery_date, status
FROM delivery
WHERE trackingno = 1;

--UPDATE
-- �ù��, ����� ����
UPDATE delivery
SET porder_company='��ۿ�ûȸ��', dman='�����', delivery_date=sysdate, status='O' -- �����
WHERE trackingno = 1;

--DELETE
DELETE FROM delivery
WHERE trackingno = 1;

ROLLBACK;