DROP TABLE coupon_issue CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: 쿠폰발급내역 */
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

COMMENT ON TABLE coupon_issue is '쿠폰발급내역';
COMMENT ON COLUMN coupon_issue.coupon_issueno is '쿠폰발급no';
COMMENT ON COLUMN coupon_issue.memno is '회원no';
COMMENT ON COLUMN coupon_issue.couponno is '쿠폰no';
COMMENT ON COLUMN coupon_issue.cpcnt is '쿠폰발급수량';
COMMENT ON COLUMN coupon_issue.cpissue is '쿠폰발급일';
COMMENT ON COLUMN coupon_issue.cpexpired is '쿠폰만료일';
COMMENT ON COLUMN coupon_issue.cpstatus is '쿠폰상태'; -- I: issue 발급, U: used 사용완료, C:calceled 발급취소

DROP SEQUENCE coupon_issue_seq;
CREATE SEQUENCE coupon_issue_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

-- coupon_issueno, memno, couponno, cpcnt, cpissue, cpexpired, cpstatus

-- CREATE
-- 취소시 재발급
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
-- 금방 만료되는 쿠폰이 우선, 만료된 쿠폰 제거
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
-- 사용 완료
UPDATE coupon_issue 
SET cpstatus='U'
WHERE coupon_issueno = 1;

-- 수량 변경
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