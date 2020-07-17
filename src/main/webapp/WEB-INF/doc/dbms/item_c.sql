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
 
1) 자료 삽입           
INSERT INTO item(itemno, grpno, item_name, item_stock, item_price, item_cost, discount_rate, item_content,
                        item_type, item_effect,item_origin, item_visible, item_visibleno, item_recom, item_view, item_rdate, upfile, thumb, fsize)
VALUES(item_seq.nextval, 1, '제주산 스킨', 10, 11000, 5500, 30, '굉장히 성능이 좋은 스킨', 
           '스킨', '수분이 아주 좋아짐 좋아요 좋아요', '제주산', 'Y', 1, 0, 0, sysdate, 'mango.png', 'mango_t.png', 23657 );

INSERT INTO item(itemno, grpno, item_name, item_stock, item_price, item_cost, discount_rate, item_content,
                        item_type, item_effect,item_origin, item_visible, item_visibleno, item_recom, item_view, item_rdate, upfile, thumb, fsize)
VALUES(item_seq.nextval, 1, '제주산 로션', 12, 13000, 5500, 30, '굉장히 성능이 좋은 스킨', 
           '로션', '수분이 아주 좋아짐 좋아요 좋아요', '제주산', 'Y', 2, 0, 0, sysdate, 'pineapple.png', 'pineapple_t.png', 23657 );
            
INSERT INTO item(itemno, grpno, item_name, item_stock, item_price, item_cost, discount_rate, item_content,
                        item_type, item_effect,item_origin, item_visible, item_visibleno, item_recom, item_view, item_rdate, upfile, thumb, fsize)
VALUES(item_seq.nextval, 2, '여드름 로션', 10, 10000, 5000, 30, '굉장히 여드름 좋은 로션', 
           '로션', '여드름 아주 좋아짐 좋아요 좋아요', '호주산', 'Y', 3, 0, 0, sysdate, 'sample.png', 'sample_t.png', 23657 );
           
INSERT INTO item(itemno, grpno, item_name, item_stock, item_price, item_cost, discount_rate, item_content,
                        item_type, item_effect,item_origin, item_visible, item_visibleno, item_recom, item_view, item_rdate, upfile, thumb, fsize)
VALUES(item_seq.nextval, 2, '여드름 스킨', 10, 11000, 5500, 30, '굉장히 여드름 좋은 스킨', 
           '스킨', '여드름 아주 좋아짐 좋아요 좋아요', '호주산', 'Y', 4, 0, 0, sysdate, 'sample.png', 'sample_t.png', 23657 );
           
INSERT INTO item(itemno, grpno, item_name, item_stock, item_price, item_cost, discount_rate, item_content,
                        item_type, item_effect,item_origin, item_visible, item_visibleno, item_recom, item_view, item_rdate, upfile, thumb, fsize)
VALUES(item_seq.nextval, 3, '망고 로션', 10, 9000, 5000, 30, '굉장히 망고 좋은 로션', 
           '로션', '망고 아주 좋아짐 좋아요 좋아요', '호주산', 'Y', 5, 0, 0, sysdate, 'sample.png', 'sample_t.png', 23657 );
           
INSERT INTO item(itemno, grpno, item_name, item_stock, item_price, item_cost, discount_rate, item_content,
                        item_type, item_effect,item_origin, item_visible, item_visibleno, item_recom, item_view, item_rdate, upfile, thumb, fsize)
VALUES(item_seq.nextval, 3, '파인애플 스킨', 10, 8000, 4000, 30, '굉장히 파인애플 좋은 스킨', 
           '스킨', '파인애플 아주 좋아짐 좋아요 좋아요', '호주산', 'Y', 6, 0, 0, sysdate, 'sample.png', 'sample_t.png', 23657 );           

COMMIT;   

2) 리스트
SELECT itemno, grpno, item_name, item_stock, item_price, item_cost, discount_rate, item_content,
          item_type, item_effect,item_origin, item_visible, item_visibleno, item_recom, item_view, item_rdate, item_rdate, upfile, thumb, fsize
FROM item
ORDER BY itemno ASC;

3) 테이블 1개 조회
SELECT itemno, grpno, item_name, item_stock, item_price, item_cost, discount_rate, item_content,
          item_type, item_effect,item_origin, item_recom, item_view, item_rdate, item_rdate, upfile, thumb, fsize
FROM item
WHERE itemno = 3;

4) 1번 레코드 수정
UPDATE item
SET item_name = '북한산 로션' , item_stock = 12, item_price = 3000, item_cost = 1500, discount_rate=10, item_content='북한산 맑은샘로션', 
      item_type='로션', item_effect='호랑이 기운이 남', item_origin='북한'
WHERE itemno = 3;

7) 1번 레코드 삭제
DELETE FROM item
WHERE itemno = 3;

8) 레코드 갯수
SELECT COUNT(*) as cnt
FROM item;
 
9) left outer join
SELECT itemno, i.grpno as i_grpno, g.grpno as g_grpno, name, item_name, item_stock, item_price, item_cost, discount_rate, item_content,
          item_type, item_effect,item_origin, item_recom, item_view, item_rdate, item_rdate, upfile, thumb, fsize
FROM item i, itemgrp g
WHERE i.grpno = g.grpno
ORDER BY itemno ASC;

SELECT  g.grpno as g_grpno, g.name as g_name,
          i.itemno as i_itemno, i.grpno as i_grpno, i.item_name as i_name,
          i.item_stock as i_stock, i.item_price as i_price, i.item_cost as i_cost, 
          i.discount_rate as i_discount_rate,  i.item_content as i_content, 
          i.item_type as i_type, i.item_effect as i_effect,
          i.item_origin as i_origin,  i.item_visible as i_item_visible,
          i.item_recom as i_recom, i.item_view as i_view, i.item_rdate as i_rdate, 
          i.item_rdate as i_rdate, i.upfile as i_upfile, i.thumb as i_thumb, i.fsize as i_fsize
FROM item i, itemgrp g
WHERE i.grpno = g.grpno
ORDER BY i.grpno DESC, i.itemno ASC;


10)  left outer join
SELECT  g.grpno as g_grpno, g.name as g_name,
          i.itemno as i_itemno, i.grpno as i_grpno, i.item_name as i_name,
          i.item_stock as i_stock, i.item_price as i_price, i.item_cost as i_cost, 
          i.discount_rate as i_discount_rate,  i.item_content as i_content, 
          i.item_type as i_type, i.item_effect as i_effect,
          i.item_origin as i_origin,  i.item_visible as i_item_visible,
          i.item_recom as i_recom, i.item_view as i_view, i.item_rdate as i_rdate, 
          i.item_rdate as i_rdate, i.upfile as i_upfile, i.thumb as i_thumb, i.fsize as i_fsize
FROM item i, itemgrp g
WHERE i.grpno = g.grpno  AND i.grpno=1
ORDER BY i.grpno DESC, i.itemno ASC;

commit;