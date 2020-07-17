DROP TABLE itemgrp;

CREATE TABLE itemgrp(
        grpno                             NUMBER(10)     NOT NULL,
        name                              VARCHAR2(100)    NOT NULL,
    visibleno                         NUMBER(7)        NOT NULL,
    visible                               CHAR(1)            DEFAULT 'Y'     NOT NULL,
    rdate                             DATE                 NOT NULL,
        PRIMARY KEY(grpno)
);

COMMENT ON TABLE itemgrp is '상품 카테고리 그룹';
COMMENT ON COLUMN itemgrp.grpno is '카테고리 그룹 번호';
COMMENT ON COLUMN itemgrp.name is '그룹 이름';
COMMENT ON COLUMN itemgrp.visibleno is '출력 순서';
COMMENT ON COLUMN itemgrp.visible is '출력 모드';
COMMENT ON COLUMN itemgrp.rdate is '그룹 생성일';

DROP SEQUENCE grp_seq;
CREATE SEQUENCE grp_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
 
1) 자료 삽입
INSERT INTO itemgrp(grpno, name, visibleno, visible, rdate)
VALUES(grp_seq.nextval, '제품라인별', 1, 'Y', sysdate);

INSERT INTO itemgrp(grpno, name, visibleno, visible, rdate)
VALUES(grp_seq.nextval, '피부고민별', 2, 'Y', sysdate);

INSERT INTO itemgrp(grpno, name, visibleno, visible, rdate)
VALUES(grp_seq.nextval, '주요원료별', 3, 'Y', sysdate);

2) 리스트
SELECT grpno, name, visibleno, visible, rdate
FROM itemgrp
ORDER BY grpno ASC;

3) 테이블 1개 조회
SELECT grpno, name, visibleno, visible, rdate
FROM itemgrp
WHERE grpno = 1;

4) 1번 레코드 name 수정
UPDATE itemgrp
SET name='샘플', visibleno=5, visible='N'
WHERE grpno = 1;

5) 1번 레코드 seqno 수정
UPDATE itemgrp
SET visibleno=5
WHERE grpno=1;

6) 1번 레코드 visible 수정
UPDATE itemgrp
SET visible='Y'
WHERE grpno=1;

commit;

7) 1번 레코드 삭제
DELETE FROM itemgrp
WHERE grpno=1;

8) 레코드 갯수
SELECT COUNT(*) as cnt
FROM grpno;
 
9) 출력 순서 상향, 10 ▷ 1
UPDATE itemgrp
SET visibleno = visibleno - 1
WHERE grpno=2;
 
10) 출력순서 하향, 1 ▷ 10
UPDATE itemgrp
SET visibleno = visibleno + 1
WHERE grpno=2;

commit;
