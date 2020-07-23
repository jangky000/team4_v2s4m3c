/**********************************/
/* Table Name: 관리자 등급 */
/**********************************/
DROP TABLE managerlv CASCADE CONSTRAINTS;
CREATE TABLE managerlv(
      managerlvno                     NUMBER(10)       NOT NULL       PRIMARY KEY,
      managerlv_name                   VARCHAR2(20)       NOT NULL,
      managerlv_pay                   NUMBER(20)       NOT NULL,
      managerlv_do                     CLOB NULL
);

COMMENT ON TABLE managerlv is '관리자 등급';
COMMENT ON COLUMN managerlv.managerlvno is '관리자 등급번호';
COMMENT ON COLUMN managerlv.managerlv_name is '관리자 등급이름';
COMMENT ON COLUMN managerlv.managerlv_pay is '관리자 등급 별 연봉';
COMMENT ON COLUMN managerlv.managerlv_do is '관리자 등급업무';

DROP SEQUENCE managerlv_seq;
CREATE SEQUENCE managerlv_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;

INSERT INTO managerlv(managerlvno, managerlv_name, managerlv_pay, managerlv_do)
VALUES(managerlv_seq.nextval, '총괄책임자', 5600, '회원관리, QnA 답변, 상품관리');

/**********************************/
/* Table Name: 관리자 */
/**********************************/
DROP TABLE manager CASCADE CONSTRAINTS;
CREATE TABLE manager(
      managerno                           NUMBER(10)       NOT NULL       PRIMARY KEY,
      manager_img                         VARCHAR2(1000)       NULL ,
      manager_id                          VARCHAR2(50)       NOT NULL,
      manager_pw                          VARCHAR2(20)       NOT NULL,
      manager_name                        VARCHAR2(20)       NOT NULL,
      manager_yy                       NUMBER(20)       NOT NULL,
      manager_mm                       NUMBER(20)       NOT NULL,
      manager_dd                       NUMBER(20)       NOT NULL,
      manager_telecom                  VARCHAR2(20)       NOT NULL,
      manager_phone                       NUMBER(20)       NOT NULL,
      manager_email                       VARCHAR2(50)       NOT NULL,
      manager_postcode                    VARCHAR2(20)       NOT NULL,
      manager_address1                    VARCHAR2(80)       NOT NULL,
      manager_address2                    VARCHAR2(80)       NOT NULL,
      joindate                            DATE       NOT NULL,
      managerlvno                     NUMBER(10)       NOT NULL,
  FOREIGN KEY (managerlvno) REFERENCES managerlv (managerlvno)
);

COMMENT ON TABLE manager is '관리자';
COMMENT ON COLUMN manager.managerno is '관리자 번호';
COMMENT ON COLUMN manager.manager_img is '관리자 사진';
COMMENT ON COLUMN manager.manager_id is '관리자 아이디';
COMMENT ON COLUMN manager.manager_pw is '관리자 비밀번호';
COMMENT ON COLUMN manager.manager_name is '관리자 이름';
COMMENT ON COLUMN manager.manager_yy is '관리자 년';
COMMENT ON COLUMN manager.manager_mm is '관리자 월';
COMMENT ON COLUMN manager.manager_dd is '관리자 일';
COMMENT ON COLUMN manager.manager_telecom is '관리자 통신사';
COMMENT ON COLUMN manager.manager_phone is '관리자 전화번호';
COMMENT ON COLUMN manager.manager_email is '관리자 이메일';
COMMENT ON COLUMN manager.manager_postcode is '관리자 우편번호';
COMMENT ON COLUMN manager.manager_address1 is '관리자 주소1';
COMMENT ON COLUMN manager.manager_address2 is '관리자 주소2';
COMMENT ON COLUMN manager.joindate is '입사일';
COMMENT ON COLUMN manager.managerlvno is '관리자 등급번호';

DROP SEQUENCE manager_seq;
CREATE SEQUENCE manager_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;  

INSERT INTO manager(managerno, manager_img, manager_id, manager_pw, manager_name,
manager_yy, manager_mm, manager_dd, manager_telecom, manager_phone, manager_email, manager_postcode, manager_address1, manager_address2, joindate, managerlvno)
VALUES(manager_seq.nextval, null,'total_manager', 1234, '김짱구', 01,02,03, 'SKT',01012340000, 'total@naver.com', '12345', '서울시 종로구 관철동', '25-6번지', sysdate,1);

/**********************************/
/* Table Name: 회원 등급 */
/**********************************/
DROP TABLE memlv CASCADE CONSTRAINTS;
CREATE TABLE memlv(
      memlvno                         NUMBER(10)       NOT NULL       PRIMARY KEY,
      memlv_name                       VARCHAR2(20)       NOT NULL,
      memlv_img                             VARCHAR2(1000)       NULL ,
      memlv_condition                   CLOB NOT NULL,
      memlv_benefit                     CLOB NOT NULL
);

COMMENT ON TABLE memlv is '회원 등급';
COMMENT ON COLUMN memlv.memlvno is '회원 등급번호';
COMMENT ON COLUMN memlv.memlv_name is '회원 등급이름';
COMMENT ON COLUMN memlv.memlv_img is '회원 등급로고';
COMMENT ON COLUMN memlv.memlv_condition is '회원 등급조건';
COMMENT ON COLUMN memlv.memlv_benefit is '회원 등급혜택';

DROP SEQUENCE memlv_seq;
CREATE SEQUENCE memlv_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;  

INSERT INTO memlv(memlvno, memlv_name, memlv_condition ,memlv_benefit)
VALUES(1, '일반회원', '년 30만원 이상 구매' , '포인트5%적립');
INSERT INTO memlv(memlvno, memlv_name, memlv_condition ,memlv_benefit)
VALUES(2, 'Silver', '년 40만원 이상 구매' , '포인트7%적립');
INSERT INTO memlv(memlvno, memlv_name, memlv_condition ,memlv_benefit)
VALUES(3, 'Gold', '년 50만원 이상 구매' , '포인트8%적립');

/**********************************/
/* Table Name: 회원 */
/**********************************/
DROP TABLE mem CASCADE CONSTRAINTS;
CREATE TABLE mem(
      memno                               NUMBER(10)       NOT NULL       PRIMARY KEY,
      mem_img                             VARCHAR2(1000)       NULL ,
      mem_id                              VARCHAR2(20)       NOT NULL,
      mem_pw                              VARCHAR2(20)       NOT NULL,
      mem_name                            VARCHAR2(20)       NOT NULL,
      mem_yy                              NUMBER(10)       NOT NULL,
      mem_mm                              NUMBER(10)       NOT NULL,
      mem_dd                              NUMBER(10)       NOT NULL,
      mem_telecom                         VARCHAR2(20)       NOT NULL,
      mem_phone                          NUMBER(20)       NOT NULL,
      mem_email                           VARCHAR2(20)       NOT NULL,
      signdate                            DATE       NOT NULL,
      memlvno                         NUMBER(10)       DEFAULT 1       NOT NULL,
  FOREIGN KEY (memlvno) REFERENCES memlv (memlvno)
);

COMMENT ON TABLE mem is '회원';
COMMENT ON COLUMN mem.memno is '회원번호';
COMMENT ON COLUMN mem.mem_img is '회원 사진';
COMMENT ON COLUMN mem.mem_id is '회원 아이디';
COMMENT ON COLUMN mem.mem_pw is '회원 비밀번호';
COMMENT ON COLUMN mem.mem_name is '회원 이름';
COMMENT ON COLUMN mem.mem_yy is '회원 년';
COMMENT ON COLUMN mem.mem_mm is '회원 월';
COMMENT ON COLUMN mem.mem_dd is '회원 일';
COMMENT ON COLUMN mem.mem_telecom is '회원 통신사';
COMMENT ON COLUMN mem.mem_phone is '회원 전화번호';
COMMENT ON COLUMN mem.mem_email is '회원 이메일';
COMMENT ON COLUMN mem.signdate is '가입일';
COMMENT ON COLUMN mem.memlvno is '회원 등급번호';

DROP SEQUENCE mem_seq;
CREATE SEQUENCE mem_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;  
  
-- 등록
INSERT INTO mem(memno, mem_id, mem_pw, mem_name, 
mem_yy, mem_mm, mem_dd, mem_telecom, mem_phone, mem_email, signdate)
VALUES(mem_seq.nextval, 'user1', 1234, '윌리엄', 99,01,23, 'LG U+',01000000000, 'a@naver.com', sysdate);

INSERT INTO mem(memno, mem_img, mem_id, mem_pw, mem_name,
mem_yy, mem_mm, mem_dd, mem_telecom, mem_phone, mem_email, signdate)
VALUES(mem_seq.nextval, null,'user2', 1234, '건후', 01,02,03, 'SKT',01012340000, 'b@naver.com', sysdate);

/**********************************/
/* Table Name: 배송지 */
/**********************************/
DROP TABLE destination CASCADE CONSTRAINTS;
CREATE TABLE destination(
      destinationno                       NUMBER(10)       NOT NULL       PRIMARY KEY,
      recipient                           VARCHAR2(20)       NOT NULL,
      recipient_phone                     NUMBER(20)       NOT NULL,
      postcode                            NUMBER(10)       NOT NULL,
      address1                            VARCHAR2(80)       NOT NULL,
      address2                            VARCHAR2(80)       NOT NULL,
      basic                               CHAR(1) default 'B' NOT NULL,
      memno                               NUMBER(10)       NOT NULL,
  FOREIGN KEY (memno) REFERENCES mem (memno)
);

COMMENT ON TABLE destination is '배송지';
COMMENT ON COLUMN destination.destinationno is '배송지번호';
COMMENT ON COLUMN destination.recipient is '배송받는사람';
COMMENT ON COLUMN destination.recipient_phone is '배송받는사람 번호';
COMMENT ON COLUMN destination.postcode is '우편번호';
COMMENT ON COLUMN destination.address1 is '주소1';
COMMENT ON COLUMN destination.address2 is '주소';
COMMENT ON COLUMN destination.basic is '기본배송지';
COMMENT ON COLUMN destination.memno is '회원번호';

DROP SEQUENCE destination_seq;
CREATE SEQUENCE destination_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;  

DROP SEQUENCE destination_seq;
CREATE SEQUENCE destination_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;  

/**********************************/
/* Table Name: 상품 카테고리 */
/**********************************/
DROP TABLE itemgrp CASCADE CONSTRAINTS;
CREATE TABLE itemgrp(
        grpno                         		NUMBER(10)		 NOT NULL,
        name                      		    VARCHAR2(100)		 NOT NULL,
		visibleno                 	     	NUMBER(7)		     NOT NULL,
		visible                   	         	CHAR(1)		         DEFAULT 'Y'		 NOT NULL,
		rdate                      		    DATE		             NOT NULL,
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
 
-- 1) 자료 삽입
INSERT INTO itemgrp(grpno, name, visibleno, visible, rdate)
VALUES(grp_seq.nextval, '수분/보습', 1, 'Y', sysdate);

INSERT INTO itemgrp(grpno, name, visibleno, visible, rdate)
VALUES(grp_seq.nextval, '주름개선/탄력/리프팅', 2, 'Y', sysdate);

INSERT INTO itemgrp(grpno, name, visibleno, visible, rdate)
VALUES(grp_seq.nextval, '여드름 트러블', 3, 'Y', sysdate);

INSERT INTO itemgrp(grpno, name, visibleno, visible, rdate)
VALUES(grp_seq.nextval, '모공/피지/블랙헤드', 4, 'Y', sysdate);

INSERT INTO itemgrp(grpno, name, visibleno, visible, rdate)
VALUES(grp_seq.nextval, '미백', 5, 'Y', sysdate);

/**********************************/
/* Table Name: 상품 */
/**********************************/
DROP TABLE item CASCADE CONSTRAINTS;
CREATE TABLE item(
      itemno                              NUMBER(10)         NOT NULL            PRIMARY KEY,
      grpno                                NUMBER(10)         NOT NULL ,
      item_name                          VARCHAR2(500)    NOT NULL,
      item_stock                          NUMBER(10)         NOT NULL,
      item_price                           NUMBER(10)         NOT NULL,
      item_cost                            NUMBER(10)         NOT NULL,
      discount_rate                       NUMBER(10)         DEFAULT 0             NOT NULL,
      item_content                       CLOB                   NOT NULL,
      item_type                           VARCHAR2(100)     NOT NULL,
      item_effect                          VARCHAR2(100)    NOT NULL,
      item_origin                          VARCHAR2(50)      DEFAULT '국내산'      NOT NULL,
      item_visible                         CHAR(1)               DEFAULT 'Y'           NOT NULL,
      item_visibleno                      NUMBER(10)         NOT NULL,
      item_recom                         NUMBER(10)         DEFAULT 0             NOT NULL,
      item_view                           NUMBER(10)          DEFAULT 0             NOT NULL,
      item_rdate                          DATE                   NOT NULL,     
      upfile                                  VARCHAR(100)       NULL,
      thumb                               VARCHAR(100)       NULL,
      fsize                                   NUMBER(10)          DEFAULT 0 NULL,  
    FOREIGN KEY (grpno) REFERENCES itemgrp (grpno)         
);

COMMENT ON TABLE item is '상품';
COMMENT ON COLUMN item.itemno is '상품 등록 번호';
COMMENT ON COLUMN item.grpno is '메인 카테고리 번호';
COMMENT ON COLUMN item.item_name is '상품 이름';
COMMENT ON COLUMN item.item_stock is '상품 재고';
COMMENT ON COLUMN item.item_price is '상품 정가';
COMMENT ON COLUMN item.item_cost is '상품 원가';
COMMENT ON COLUMN item.discount_rate is '할인률';
COMMENT ON COLUMN item.item_content is '상품 설명';
COMMENT ON COLUMN item.item_type is '상품 유형';
COMMENT ON COLUMN item.item_effect is '상품 피부 효과';
COMMENT ON COLUMN item.item_origin is '원산지';
COMMENT ON COLUMN item.item_visible is '출력';
COMMENT ON COLUMN item.item_visibleno is '출력순서';
COMMENT ON COLUMN item.item_recom is '추천수';
COMMENT ON COLUMN item.item_view is '조회수';
COMMENT ON COLUMN item.item_rdate is '상품 등록 날짜';
COMMENT ON COLUMN item.upfile is '업로드 파일';
COMMENT ON COLUMN item.thumb is '썸네일 파일';
COMMENT ON COLUMN item.fsize is '사이즈';

DROP SEQUENCE item_seq;
CREATE SEQUENCE item_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

-- 1) 자료 삽입           
INSERT INTO item(itemno, grpno, item_name, item_stock, item_price, item_cost, discount_rate, item_content,
                        item_type, item_effect,item_origin, item_visible, item_visibleno, item_recom, item_view, item_rdate, upfile, thumb, fsize)
VALUES(item_seq.nextval, 1, '제주산 스킨', 10, 11000, 5500, 30, '굉장히 성능이 좋은 스킨', 
           '스킨', '수분이 아주 좋아짐 좋아요 좋아요', '제주산', 'Y', 1, 0, 0, sysdate, 'spring.jpg', 'spring_t.jpg', 23657 );

INSERT INTO item(itemno, grpno, item_name, item_stock, item_price, item_cost, discount_rate, item_content,
                        item_type, item_effect,item_origin, item_visible, item_visibleno, item_recom, item_view, item_rdate, upfile, thumb, fsize)
VALUES(item_seq.nextval, 1, '제주산 로션', 12, 13000, 5500, 30, '굉장히 성능이 좋은 스킨', 
           '로션', '수분이 아주 좋아짐 좋아요 좋아요', '제주산', 'Y', 2, 0, 0, sysdate, 'spring.jpg', 'spring_t.jpg', 23657 );
            
INSERT INTO item(itemno, grpno, item_name, item_stock, item_price, item_cost, discount_rate, item_content,
                        item_type, item_effect,item_origin, item_visible, item_visibleno, item_recom, item_view, item_rdate, upfile, thumb, fsize)
VALUES(item_seq.nextval, 2, '여드름 로션', 10, 10000, 5000, 30, '굉장히 여드름 좋은 로션', 
           '로션', '여드름 아주 좋아짐 좋아요 좋아요', '호주산', 'Y', 3, 0, 0, sysdate, 'spring.jpg', 'spring_t.jpg', 23657 );
           
INSERT INTO item(itemno, grpno, item_name, item_stock, item_price, item_cost, discount_rate, item_content,
                        item_type, item_effect,item_origin, item_visible, item_visibleno, item_recom, item_view, item_rdate, upfile, thumb, fsize)
VALUES(item_seq.nextval, 2, '여드름 스킨', 10, 11000, 5500, 30, '굉장히 여드름 좋은 스킨', 
           '스킨', '여드름 아주 좋아짐 좋아요 좋아요', '호주산', 'Y', 4, 0, 0, sysdate, 'spring.jpg', 'spring_t.jpg', 23657 );
           
INSERT INTO item(itemno, grpno, item_name, item_stock, item_price, item_cost, discount_rate, item_content,
                        item_type, item_effect,item_origin, item_visible, item_visibleno, item_recom, item_view, item_rdate, upfile, thumb, fsize)
VALUES(item_seq.nextval, 3, '망고 로션', 10, 9000, 5000, 30, '굉장히 망고 좋은 로션', 
           '로션', '망고 아주 좋아짐 좋아요 좋아요', '호주산', 'Y', 5, 0, 0, sysdate, 'spring.jpg', 'spring_t.jpg', 23657 );
           
INSERT INTO item(itemno, grpno, item_name, item_stock, item_price, item_cost, discount_rate, item_content,
                        item_type, item_effect,item_origin, item_visible, item_visibleno, item_recom, item_view, item_rdate, upfile, thumb, fsize)
VALUES(item_seq.nextval, 3, '파인애플 스킨', 10, 8000, 4000, 30, '굉장히 파인애플 좋은 스킨', 
           '스킨', '파인애플 아주 좋아짐 좋아요 좋아요', '호주산', 'Y', 6, 0, 0, sysdate, 'spring.jpg', 'spring_t.jpg', 23657 );           

/**********************************/
/* Table Name: 썸네일 */
/**********************************/
DROP TABLE thumbnail CASCADE CONSTRAINTS;
CREATE TABLE thumbnail(
        thumbno                     NUMBER(10)         NOT NULL         PRIMARY KEY,
        itemno                        NUMBER(10)         NULL ,
        fname                         VARCHAR2(100)     NULL,
        fupname                      VARCHAR2(100)     NULL,
        thumb                         VARCHAR2(100)     NULL ,
        fsize                            NUMBER(10)         DEFAULT 0         NOT NULL,
        rdate                           DATE                  NOT NULL,
  FOREIGN KEY (itemno) REFERENCES item (itemno)
);

COMMENT ON TABLE thumbnail is '썸네일';
COMMENT ON COLUMN thumbnail.thumbno is '썸네일 번호';
COMMENT ON COLUMN thumbnail.itemno is '상품 등록 번호';
COMMENT ON COLUMN thumbnail.fname is '원본 파일명';
COMMENT ON COLUMN thumbnail.fupname is '업로드 파일명';
COMMENT ON COLUMN thumbnail.thumb is 'Thumb 파일명';
COMMENT ON COLUMN thumbnail.fsize is '파일 사이즈';
COMMENT ON COLUMN thumbnail.rdate is '등록일';

DROP SEQUENCE thumb_seq;
CREATE SEQUENCE thumb_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
-- 1) 등록
INSERT INTO thumbnail(thumbno, itemno, fname, fupname, thumb, fsize, rdate)
VALUES(thumb_seq.nextval, 1, 'lotion.jpg', 'lotion_1.jpg', 'lotion_t.jpg', 1000, sysdate);

INSERT INTO thumbnail(thumbno, itemno, fname, fupname, thumb, fsize, rdate)
VALUES(thumb_seq.nextval, 2, 'skin.jpg', 'sskin_1.jpg', 'skin_t.jpg', 1000, sysdate);

INSERT INTO thumbnail(thumbno, itemno, fname, fupname, thumb, fsize, rdate)
VALUES(thumb_seq.nextval, 3, 'pack.jpg', 'pack_1.jpg', 'pack_t.jpg', 1000, sysdate);

COMMIT;

/**********************************/
/* Table Name: 화장품 추천 */
/**********************************/
DROP TABLE recommand CASCADE CONSTRAINTS;
CREATE TABLE recommand(
      recomno                             NUMBER(10)       NOT NULL      PRIMARY KEY,
      grpno                                NUMBER(10)         NOT NULL ,
      itemno                              NUMBER(10)       NOT NULL,
      testresult_type                     VARCHAR2(50)        NOT NULL,
      testresult_recom                    CLOB                  NOT NULL,
      recom_price                         NUMBER(10)       DEFAULT 0       NOT NULL,
      FOREIGN KEY (itemno) REFERENCES item (itemno)  
);

COMMENT ON TABLE recommand is '화장품 추천';
COMMENT ON COLUMN recommand.recomno is '추천 세트 번호';
COMMENT ON COLUMN recommand.grpno is '메인 카테고리 번호';
COMMENT ON COLUMN recommand.itemno is '상품 등록 번호';
COMMENT ON COLUMN recommand.testresult_type is '피부타입 결과';
COMMENT ON COLUMN recommand.testresult_recom is '결과별 화장품추천';
COMMENT ON COLUMN recommand.recom_price is '추천 세트 가격';

DROP SEQUENCE recom_seq;
CREATE SEQUENCE recom_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
 
-- 1) 자료 삽입 C
INSERT INTO recommand(recomno, itemno, grpno, testresult_type, testresult_recom, recom_price)
VALUES(recom_seq.nextval, 1, 1, '건성', '촉촉한 로션을 추천합니다.', 50000);

INSERT INTO recommand(recomno, itemno, grpno, testresult_type, testresult_recom, recom_price)
VALUES(recom_seq.nextval, 2, 1, '지성', '유분기가 적은 로션을 추천합니다.', 29000);

INSERT INTO recommand(recomno, itemno, grpno, testresult_type, testresult_recom, recom_price)
VALUES(recom_seq.nextval, 3, 1, '민감성', '오가닉 상품을 추천합니다.', 39000);

/**********************************/
/* Table Name: 이벤트 */
/**********************************/
DROP TABLE event CASCADE CONSTRAINTS;
CREATE TABLE event(
		eventno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		event_title                   		VARCHAR2(200)		 NOT NULL,
		event_content                 		CLOB		 NOT NULL,
		event_img                     		VARCHAR2(1000)		 NULL ,
		event_timg                        VARCHAR2(1000)     NULL ,
		event_due                     		VARCHAR2(500)		 NOT NULL,
		event_view                    		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		event_seqno                   		NUMBER(10)		 DEFAULT 1		 NOT NULL,
		event_visible                 		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		event_rdate                   		DATE		 NOT NULL,
		event_passwd                  		VARCHAR2(10)		 NOT NULL
);

COMMENT ON TABLE event is '이벤트';
COMMENT ON COLUMN event.eventno is '이벤트번호';
COMMENT ON COLUMN event.event_title is '이벤트 제목';
COMMENT ON COLUMN event.event_content is '이벤트내용';
COMMENT ON COLUMN event.event_img is '이벤트이미지';
COMMENT ON COLUMN event.event_timg is '이벤트thumb이미지';
COMMENT ON COLUMN event.event_due is '이벤트기간';
COMMENT ON COLUMN event.event_view is '이벤트조회수';
COMMENT ON COLUMN event.event_seqno is '이벤트출력순서';
COMMENT ON COLUMN event.event_visible is '출력모드';
COMMENT ON COLUMN event.event_rdate is '등록일';
COMMENT ON COLUMN event.event_passwd is '이벤트비번';

DROP SEQUENCE event_seq;
CREATE SEQUENCE event_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

--등록
INSERT INTO event(eventno, event_title, event_content, event_due, event_seqno, event_visible, event_passwd, event_rdate)
VALUES(event_seq.nextval, '제목', '내용', '2020-05-18', '1','Y','1234',sysdate);

INSERT INTO event(eventno, event_title, event_content, event_due, event_seqno, event_visible, event_passwd, event_rdate)
VALUES(event_seq.nextval, '제목2', '내용2','2020-05-18','2','Y','1234',sysdate);

INSERT INTO event(eventno, event_title, event_content, event_due, event_seqno, event_visible, event_passwd, event_rdate)
VALUES(event_seq.nextval, '제목2', '내용2','2020-05-18','2','Y','1234',sysdate);

/**********************************/
/* Table Name: 이벤트댓글 */
/**********************************/
DROP TABLE reply CASCADE CONSTRAINTS;

CREATE TABLE reply(
        replyno                                NUMBER(10)         NOT NULL         PRIMARY KEY,
        eventno                           NUMBER(10)    NOT     NULL ,
        memno                            NUMBER(6)         NOT NULL ,
        content                               VARCHAR2(1000)         NOT NULL,
        passwd                                VARCHAR2(20)         NOT NULL,
        rdate                                  DATE NOT NULL,
  FOREIGN KEY (eventno) REFERENCES event (eventno),
  FOREIGN KEY (memno) REFERENCES mem (memno)
);

COMMENT ON TABLE reply is '댓글';
COMMENT ON COLUMN reply.replyno is '댓글번호';
COMMENT ON COLUMN reply.eventno is '컨텐츠번호';
COMMENT ON COLUMN reply.memno is '회원 번호';
COMMENT ON COLUMN reply.content is '내용';
COMMENT ON COLUMN reply.passwd is '비밀번호';
COMMENT ON COLUMN reply.rdate is '등록일';

DROP SEQUENCE reply_seq;
CREATE SEQUENCE reply_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

--등록
INSERT INTO reply(replyno, eventno, memno, content, passwd, rdate)
VALUES(reply_seq.nextval, 1, 1, '댓글1', '1234', sysdate);

INSERT INTO reply(replyno, eventno, memno, content, passwd, rdate)
VALUES(reply_seq.nextval, 1, 1, '댓글2', '1234', sysdate);

INSERT INTO reply(replyno, eventno, memno, content, passwd, rdate)
VALUES(reply_seq.nextval, 1, 1, '댓글3', '1234', sysdate);             

/**********************************/
/* Table Name: 진단질문 */
/**********************************/
DROP TABLE testq CASCADE CONSTRAINTS;
CREATE TABLE testq(
		testqno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		testq_seqno                   		NUMBER(10)		 DEFAULT 1        NOT NULL,
		testq_content                 		VARCHAR2(1000)		 NOT NULL,
		testq_img                     		VARCHAR2(1000)		 NULL ,
		testq_timg                    		VARCHAR2(1000)		 NULL ,
		testq_tot                     		NUMBER(10)		 DEFAULT 0		 NOT NULL
);

COMMENT ON TABLE testq is '진단질문';
COMMENT ON COLUMN testq.testqno is '자가진단질문번호';
COMMENT ON COLUMN testq.testq_seqno  is '출력순서';
COMMENT ON COLUMN testq.testq_content is '진단질문내용';
COMMENT ON COLUMN testq.testq_img is '이미지';
COMMENT ON COLUMN testq.testq_timg is 't이미지';
COMMENT ON COLUMN testq.testq_tot is '질문수';

DROP SEQUENCE testq_seq;
CREATE SEQUENCE testq_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

--등록
INSERT INTO testq(testqno,testq_seqno,testq_content, testq_tot)
VALUES(testq_seq.nextval,1, '1. 피부가 얇은 편이다',0);

INSERT INTO testq(testqno,testq_seqno,testq_content, testq_tot)
VALUES(testq_seq.nextval,2, '2. 잔주름이 많다',0);

INSERT INTO testq(testqno,testq_seqno,testq_content, testq_tot)
VALUES(testq_seq.nextval,3, '3. 피부가 쉽게 건조해진다',0);

INSERT INTO testq(testqno,testq_seqno,testq_content, testq_tot)
VALUES(testq_seq.nextval,4, '4. 겨울에 심한 각질이 발생한다',0);

INSERT INTO testq(testqno,testq_seqno,testq_content, testq_tot)
VALUES(testq_seq.nextval,5, '5. 손발이 쉽게 튼다',0);

INSERT INTO testq(testqno,testq_seqno,testq_content, testq_tot)
VALUES(testq_seq.nextval,6, '6. U존은 건조하고 T존은 번들거린다',0);

INSERT INTO testq(testqno,testq_seqno,testq_content, testq_tot)
VALUES(testq_seq.nextval,7, '7. 모공이 넓다 ',0);

INSERT INTO testq(testqno,testq_seqno,testq_content, testq_tot)
VALUES(testq_seq.nextval,8, '8. 뾰루지가 난다',0);

INSERT INTO testq(testqno,testq_seqno,testq_content, testq_tot)
VALUES(testq_seq.nextval,9, '9. 피부가 햇빛 노출에 붉어진다',0);

INSERT INTO testq(testqno,testq_seqno,testq_content, testq_tot)
VALUES(testq_seq.nextval,10, '10. 가려움이 심하다',0);

INSERT INTO testq(testqno,testq_seqno,testq_content, testq_tot)
VALUES(testq_seq.nextval,11, '11. 화장품을 바꾸면 트러블이 올라온다',0);

INSERT INTO testq(testqno,testq_seqno,testq_content, testq_tot)
VALUES(testq_seq.nextval,12, '12. 얼굴이 쉽게 붉어진다',0);

INSERT INTO testq(testqno,testq_seqno,testq_content, testq_tot)
VALUES(testq_seq.nextval, 13, '13. 계절변화에 민감하다',0);

/**********************************/
/* Table Name: 진단질문항목*/
/**********************************/
DROP TABLE testo CASCADE CONSTRAINTS;
CREATE TABLE testo(
		testono                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		testo_content                 		VARCHAR2(500)		 NOT NULL,
		testo_img                     		VARCHAR2(1000)		 NULL ,
        testo_tmg                     		VARCHAR2(1000)		 NULL ,
		testo_seqno                   		NUMBER(10)		 DEFAULT 1		 NOT NULL,
		testqno                       		NUMBER(10)		 NULL ,
        testo_cnt                            NUMBER(10)		 NULL ,
  FOREIGN KEY (testqno) REFERENCES testq (testqno)
);

COMMENT ON TABLE testo is '진단항목';
COMMENT ON COLUMN testo.testono is '진단항목번호';
COMMENT ON COLUMN testo.testo_content is '진단항목내용';
COMMENT ON COLUMN testo.testo_img is '이미지';
COMMENT ON COLUMN testo.testo_seqno is '출력순서';
COMMENT ON COLUMN testo.testqno is '자가진단질문번호';

DROP SEQUENCE testo_seq;
CREATE SEQUENCE testo_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

--등록
INSERT INTO testo(testono, testqno, testo_content, testo_seqno)
VALUES(testo_seq.nextval, 1, '네',1);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 1, '보통',2);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 1, '아니요',3);

INSERT INTO testo(testono, testqno, testo_content, testo_seqno)
VALUES(testo_seq.nextval, 2, '네',1);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 2, '보통',2);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 2, '아니요',3);

INSERT INTO testo(testono, testqno, testo_content, testo_seqno)
VALUES(testo_seq.nextval, 3, '네',1);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 3, '보통',2);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 3, '아니요',3);

INSERT INTO testo(testono, testqno, testo_content, testo_seqno)
VALUES(testo_seq.nextval, 4, '네',1);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 4, '보통',2);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 4, '아니요',3);

INSERT INTO testo(testono, testqno, testo_content, testo_seqno)
VALUES(testo_seq.nextval, 5, '네',1);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 5, '보통',2);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 5, '아니요',3);

INSERT INTO testo(testono, testqno, testo_content, testo_seqno)
VALUES(testo_seq.nextval, 6, '네',1);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 6, '보통',2);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 6, '아니요',3);

INSERT INTO testo(testono, testqno, testo_content, testo_seqno)
VALUES(testo_seq.nextval, 7, '네',1);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 7, '보통',2);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 7, '아니요',3);

INSERT INTO testo(testono, testqno, testo_content, testo_seqno)
VALUES(testo_seq.nextval, 8, '네',1);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 8, '보통',2);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 8, '아니요',3);

INSERT INTO testo(testono, testqno, testo_content, testo_seqno)
VALUES(testo_seq.nextval, 9, '네',1);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 9, '보통',2);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 9, '아니요',3);

INSERT INTO testo(testono, testqno, testo_content, testo_seqno)
VALUES(testo_seq.nextval, 10, '네',1);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 10, '보통',2);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 10, '아니요',3);

INSERT INTO testo(testono, testqno, testo_content, testo_seqno)
VALUES(testo_seq.nextval, 11, '네',1);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 11, '보통',2);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 11, '아니요',3);

INSERT INTO testo(testono, testqno, testo_content, testo_seqno)
VALUES(testo_seq.nextval, 12, '네',1);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 12, '보통',2);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 12, '아니요',3);

INSERT INTO testo(testono, testqno, testo_content, testo_seqno)
VALUES(testo_seq.nextval, 13, '네',1);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 13, '보통',2);

INSERT INTO testo(testono, testqno, testo_content,testo_seqno)
VALUES(testo_seq.nextval, 13, '아니요',3);


/**********************************/
/* Table Name: 공지사항 */
/**********************************/
DROP TABLE note CASCADE CONSTRAINTS;
CREATE TABLE note(
    noteno                         NUMBER(10)  NOT NULL  PRIMARY KEY,
    notecate                       VARCHAR2(50)  NOT NULL,
    note_title                      VARCHAR2(50)  NOT NULL,
    note_content                 CLOB  NOT NULL,
    note_seqno                    NUMBER(10)  NOT NULL,
    note_manager                VARCHAR2(50)  NOT NULL,
    note_pass                      VARCHAR2(20)  NOT NULL,
    note_date                      DATE  NOT NULL
);

COMMENT ON TABLE note is '공지사항';
COMMENT ON COLUMN note.noteno is '공지사항번호';
COMMENT ON COLUMN note.notecate is '공지사항 카테고리';
COMMENT ON COLUMN note.note_title is '공지사항 제목';
COMMENT ON COLUMN note.note_content is '공지사항 내용';
COMMENT ON COLUMN note.note_seqno is '공지사항 출력순서';
COMMENT ON COLUMN note.note_manager is '공지사항 작성자';
COMMENT ON COLUMN note.note_pass is '공지사항 패스워드';
COMMENT ON COLUMN note.note_date is '등록일';

DROP SEQUENCE note_seq;
CREATE SEQUENCE note_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방

-- 1) 글 등록
INSERT INTO note(noteno, notecate , note_title, note_content, note_seqno, note_manager, note_pass, note_date)
VALUES(note_seq.nextval,  '기초화장품 할인공지' , '스킨로션 할인', '스킨로션 세트 최대 할인 40% ', 1 , '관리자' , '1234' ,sysdate);

INSERT INTO note(noteno, notecate , note_title, note_content, note_seqno, note_manager,note_pass, note_date)
VALUES(note_seq.nextval,  '메이크업 할인공지' , '립,파우더 할인', '립, 파우더 할인 20% ', 2 ,'관리자' , '1234' , sysdate);
            
INSERT INTO note(noteno, notecate , note_title, note_content, note_seqno, note_manager, note_pass ,note_date)
VALUES(note_seq.nextval,  '매장 별 할인적용 안내' , '종로점 1+1 이벤트 합니다.', '무조건 1개 사면 1개 더 !  ', 3 , '관리자' , '1234', sysdate);

/**********************************/
/* Table Name: Qna */
/**********************************/
DROP TABLE qna CASCADE CONSTRAINTS;
CREATE TABLE qna(
      qnano                               NUMBER(10)           NOT NULL PRIMARY KEY,
      qnacate                             VARCHAR2(50)        NOT NULL,
      qna_title                            VARCHAR2(100)       NOT NULL,
      qna_content                       CLOB                     NOT NULL,   
      qna_name                          VARCHAR2(20)        NOT NULL,
      qna_pass                           VARCHAR2(20)         NOT NULL,
      upfile                                VARCHAR(100)         NULL,
      thumb                              VARCHAR(100)          NULL,
      fsize                                 NUMBER(10)            DEFAULT 0 NULL,  
      qna_date                           DATE                      NOT NULL      
);

COMMENT ON TABLE qna is 'qna';
COMMENT ON COLUMN qna.qnano is 'Qna등록번호';
COMMENT ON COLUMN qna.qnacate is'공지사항 카테고리';
COMMENT ON COLUMN qna.qna_title is 'Qna제목';
COMMENT ON COLUMN qna.qna_content is 'Qna문의내용';
COMMENT ON COLUMN qna.qna_name is 'Qna작성자';
COMMENT ON COLUMN qna.qna_pass  is 'Qna등록비밀번호';
COMMENT ON COLUMN qna.upfile is '메인 이미지';
COMMENT ON COLUMN qna.thumb is '메인 이미지 Preview';
COMMENT ON COLUMN qna.fsize is ' 메인 이미지 크기';
COMMENT ON COLUMN qna.qna_date is 'Qna등록일';

DROP SEQUENCE qna_seq;
CREATE SEQUENCE qna_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

-- 등록
INSERT INTO qna(qnano, qnacate,qna_title, qna_content, qna_name,qna_pass, upfile, thumb, fsize, qna_date)
VALUES(qna_seq.nextval, '상문품의',  '화장품' , '화장품 제조년월 알려주세요', '구매자' , '1234', '0','0','0',sysdate);

INSERT INTO qna(qnano, qnacate, qna_title, qna_content, qna_name,qna_pass, upfile, thumb, fsize, qna_date )
VALUES(qna_seq.nextval, '배송문의', '메이크업 구매' , '화장품 제조년월 알려주세요', '구매자' , '1234','0','0','0',sysdate);
-- 쇼핑카트 테이블
/**********************************/
/* Table Name: 장바구니 */
/**********************************/
--Shopping_cartno, productno, memberno, quantity, 
DROP TABLE shopping_cart CASCADE CONSTRAINTS;
CREATE TABLE shopping_cart(
        shopping_cartno             NUMBER(10)          NOT NULL      PRIMARY KEY,
		memno                         NUMBER(10)		NOT NULL,
		itemno                     	    NUMBER(10)		    NOT NULL,
		quantity                         NUMBER(10)		    DEFAULT 1   	 NOT NULL,
        FOREIGN KEY (memno) REFERENCES mem(memno),
        FOREIGN KEY (itemno) REFERENCES item(itemno)
);

COMMENT ON TABLE shopping_cart is '장바구니';
COMMENT ON COLUMN shopping_cart.shopping_cartno is '장바구니no';
COMMENT ON COLUMN shopping_cart.memno is '회원번호';
COMMENT ON COLUMN shopping_cart.itemno is '상품no';
COMMENT ON COLUMN shopping_cart.quantity is '수량';

DROP SEQUENCE shopping_cart_seq;
CREATE SEQUENCE shopping_cart_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

-- CREATE
INSERT INTO shopping_cart(shopping_cartno, memno, itemno, quantity)
VALUES(shopping_cart_seq.nextval, 1, 1, 1);
INSERT INTO shopping_cart(shopping_cartno, memno, itemno, quantity)
VALUES(shopping_cart_seq.nextval, 1, 2, 2);
INSERT INTO shopping_cart(shopping_cartno, memno, itemno, quantity)
VALUES(shopping_cart_seq.nextval, 1, 3, 3);

/**********************************/
/* Table Name: 주문 */
/**********************************/
DROP TABLE porder CASCADE CONSTRAINTS;
CREATE TABLE porder(
		porderno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memno                         		NUMBER(10)		 NOT NULL,
		rdate                         		    DATE		             NOT NULL,
		item_price_sum                		NUMBER(10)		 NOT NULL,
		item_discount_sum                NUMBER(10)		 NOT NULL,
		coupon_discount_sum           	NUMBER(10)		 NOT NULL,
		delivery_fee                  		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		payment_price                 		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		porder_status                 		CHAR(1)		         NOT NULL,
        porder_zip_code                   NUMBER(10)	     NOT NULL,
		porder_address                		VARCHAR2(1000)	 NOT NULL,
        porder_delivery_request          VARCHAR2(1000),
    FOREIGN KEY (memno) REFERENCES mem(memno)
);

COMMENT ON TABLE porder is '주문';
COMMENT ON COLUMN porder.porderno is '주문no';
COMMENT ON COLUMN porder.memno is '회원no';
COMMENT ON COLUMN porder.rdate is '주문날짜';
COMMENT ON COLUMN porder.item_price_sum is '판매가총액';
COMMENT ON COLUMN porder.item_discount_sum is '할인총액';
COMMENT ON COLUMN porder.coupon_discount_sum is '쿠폰할인';
COMMENT ON COLUMN porder.delivery_fee is '배송비';
COMMENT ON COLUMN porder.payment_price is '최종결제금액';
COMMENT ON COLUMN porder.porder_status is '승인 상태';
COMMENT ON COLUMN porder.porder_zip_code is '우편번호';
COMMENT ON COLUMN porder.porder_address is '배송지';
COMMENT ON COLUMN porder.porder_delivery_request is '배송요청사항';

DROP SEQUENCE porder_seq;
CREATE SEQUENCE porder_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

-- CREATE
INSERT INTO porder(porderno, memno, rdate, item_price_sum, item_discount_sum, coupon_discount_sum, delivery_fee, payment_price, porder_status, porder_zip_code, porder_address, porder_delivery_request)
VALUES(porder_seq.nextval, 1, sysdate, 10000, 1000, 1000, 2500, 5500, 'R', 1111, '서울특별시 강남구', '문앞에두고가세요');
INSERT INTO porder(porderno, memno, rdate, item_price_sum, item_discount_sum, coupon_discount_sum, delivery_fee, payment_price, porder_status, porder_zip_code, porder_address, porder_delivery_request)
VALUES(porder_seq.nextval, 2, sysdate, 20000, 1000, 1000, 2500, 15500, 'R', 2222, '서울특별시 송파구', '경비실에 맡겨주세요');

/**********************************/
/* Table Name: 주문상세 */
/**********************************/
DROP TABLE porder_detail CASCADE CONSTRAINTS;  
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

/**********************************/
/* Table Name: 이벤트쿠폰 */
/**********************************/
DROP TABLE coupon CASCADE CONSTRAINTS;
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

COMMENT ON TABLE coupon is '이벤트쿠폰';
COMMENT ON COLUMN coupon.couponno is '쿠폰no';
COMMENT ON COLUMN coupon.cpimg is '쿠폰이미지';
COMMENT ON COLUMN coupon.cpupimg is '쿠폰업로드파일명이미지';
COMMENT ON COLUMN coupon.cpthumb is '쿠폰이미지썸네일';
COMMENT ON COLUMN coupon.cpname is '쿠폰이름';
COMMENT ON COLUMN coupon.cpdiscount is '쿠폰할인금액';
COMMENT ON COLUMN coupon.cpstock is '쿠폰재고';
COMMENT ON COLUMN coupon.cpcate is '사용가능카테고리';

DROP SEQUENCE coupon_seq;
CREATE SEQUENCE coupon_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

-- couponno, cpimg, cpupimg, cpthumb, cpname, cpdiscount, cpstock, cpcate

-- CREATE
INSERT INTO coupon(couponno, cpimg, cpupimg, cpthumb, cpname, cpdiscount, cpstock, cpcate)
VALUES(coupon_seq.nextval, 'sample.jpg', 'sample1.jpg', 'sample_t.jpg', '1000원 할인 쿠폰', 1000, 100, '스킨');

INSERT INTO coupon(couponno, cpimg, cpupimg, cpthumb, cpname, cpdiscount, cpstock, cpcate)
VALUES(coupon_seq.nextval, 'sample.jpg', 'sample1.jpg', 'sample_t.jpg', '2000원 할인 쿠폰', 2000, 100, '로션');

INSERT INTO coupon(couponno, cpimg, cpupimg, cpthumb, cpname, cpdiscount, cpstock)
VALUES(coupon_seq.nextval, 'sample.jpg', 'sample_1.jpg', 'sample_t.jpg', '배송료 할인 쿠폰', 2500, 100);

/**********************************/
/* Table Name: 쿠폰발급내역 */
/**********************************/
DROP TABLE coupon_issue CASCADE CONSTRAINTS;
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

/**********************************/
/* Table Name: 쿠폰 사용 내역 */
/**********************************/
DROP TABLE coupon_use CASCADE CONSTRAINTS;
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

-- CREATE
INSERT INTO coupon_use(coupon_useno, porderno, coupon_issueno, rdate, cpstatus)
VALUES(coupon_use_seq.nextval, 1, 1, sysdate, 'U');

INSERT INTO coupon_use(coupon_useno, porderno, coupon_issueno, rdate, cpstatus)
VALUES(coupon_use_seq.nextval, 2, 2, sysdate, 'U');


-- 주문 상세와 배송은 1:1 관계
-- REST로 배송 업체에서 관리할 테이블 -> reference 관계가 있을 수 없다. 
-- 관리하는 대상이 다르다
/**********************************/
/* Table Name: 배송 */
/**********************************/
DROP TABLE delivery CASCADE CONSTRAINTS;
CREATE TABLE delivery(
		trackingno                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
        porder_company                      		VARCHAR2(100)		 NULL ,
        porderno                    		NUMBER(10)		 NULL,
        porder_detailno                    		NUMBER(10)		 NULL,
		dman                          		VARCHAR2(30)		 NULL ,
		delivery_date                 		DATE		 NULL ,
		status                        		CHAR(1)		 NULL
);

COMMENT ON TABLE delivery is '배송';
COMMENT ON COLUMN delivery.trackingno is '운송장번호';
COMMENT ON COLUMN delivery.porder_company is '배송요청회사';
COMMENT ON COLUMN delivery.porderno is '주문번호';
COMMENT ON COLUMN delivery.porder_detailno is '주문상세번호';
COMMENT ON COLUMN delivery.dman is '담당자';
COMMENT ON COLUMN delivery.delivery_date is '배송상태최종처리일';
COMMENT ON COLUMN delivery.status is '배송상태'; -- 준비중(R), 배송지시(S), 배송중(O), 배송완료(C), 반품(R) ??

-- 시퀀스
DROP SEQUENCE delivery_seq;
CREATE SEQUENCE delivery_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

-- CREATE
INSERT INTO delivery(trackingno, porder_company, porderno, porder_detailno, dman, delivery_date, status)
VALUES(delivery_seq.nextval, 'SKINFIT', 1, 1, '왕눈이', sysdate, 'S');

INSERT INTO delivery(trackingno, porder_company, porderno, porder_detailno, dman, delivery_date, status)
VALUES(delivery_seq.nextval, 'SKINFIT', 1, 1, '아로미', sysdate, 'S');

INSERT INTO delivery(trackingno, porder_company, porderno, porder_detailno, dman, delivery_date, status)
VALUES(delivery_seq.nextval, 'SKINFIT', 1, 1, '투투', sysdate, 'S');





