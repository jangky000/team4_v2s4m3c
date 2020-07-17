DROP TABLE itemgrp;

CREATE TABLE itemgrp(
        grpno                             NUMBER(10)     NOT NULL,
        name                              VARCHAR2(100)    NOT NULL,
    visibleno                         NUMBER(7)        NOT NULL,
    visible                               CHAR(1)            DEFAULT 'Y'     NOT NULL,
    rdate                             DATE                 NOT NULL,
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
 
1) �ڷ� ����
INSERT INTO itemgrp(grpno, name, visibleno, visible, rdate)
VALUES(grp_seq.nextval, '��ǰ���κ�', 1, 'Y', sysdate);

INSERT INTO itemgrp(grpno, name, visibleno, visible, rdate)
VALUES(grp_seq.nextval, '�Ǻΰ�κ�', 2, 'Y', sysdate);

INSERT INTO itemgrp(grpno, name, visibleno, visible, rdate)
VALUES(grp_seq.nextval, '�ֿ���Ằ', 3, 'Y', sysdate);

2) ����Ʈ
SELECT grpno, name, visibleno, visible, rdate
FROM itemgrp
ORDER BY grpno ASC;

3) ���̺� 1�� ��ȸ
SELECT grpno, name, visibleno, visible, rdate
FROM itemgrp
WHERE grpno = 1;

4) 1�� ���ڵ� name ����
UPDATE itemgrp
SET name='����', visibleno=5, visible='N'
WHERE grpno = 1;

5) 1�� ���ڵ� seqno ����
UPDATE itemgrp
SET visibleno=5
WHERE grpno=1;

6) 1�� ���ڵ� visible ����
UPDATE itemgrp
SET visible='Y'
WHERE grpno=1;

commit;

7) 1�� ���ڵ� ����
DELETE FROM itemgrp
WHERE grpno=1;

8) ���ڵ� ����
SELECT COUNT(*) as cnt
FROM grpno;
 
9) ��� ���� ����, 10 �� 1
UPDATE itemgrp
SET visibleno = visibleno - 1
WHERE grpno=2;
 
10) ��¼��� ����, 1 �� 10
UPDATE itemgrp
SET visibleno = visibleno + 1
WHERE grpno=2;

commit;
