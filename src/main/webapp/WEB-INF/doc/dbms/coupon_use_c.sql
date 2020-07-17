DROP TABLE coupon_use CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: 쿠폰 사용 내역 */
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

COMMENT ON TABLE coupon_use is '쿠폰 사용 내역';
COMMENT ON COLUMN coupon_use.coupon_useno is '쿠폰 사용no';
COMMENT ON COLUMN coupon_use.porderno is '주문no';
COMMENT ON COLUMN coupon_use.coupon_issueno is '쿠폰발급no';
COMMENT ON COLUMN coupon_use.rdate is '쿠폰 사용일';
COMMENT ON COLUMN coupon_use.cpstatus is '쿠폰상태'; -- 사용:U, 취소:C

DROP SEQUENCE coupon_use_seq;
CREATE SEQUENCE coupon_use_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

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
-- 결제 취소
UPDATE coupon_use 
SET cpstatus='C'
WHERE coupon_useno = 1;

-- DELETE
DELETE FROM coupon_use
WHERE coupon_useno = 1;

ROLLBACK;

