DROP TABLE delivery CASCADE CONSTRAINTS;
DROP TABLE refund CASCADE CONSTRAINTS;
DROP TABLE search_statistics CASCADE CONSTRAINTS;
DROP TABLE search_inverted_index CASCADE CONSTRAINTS;
DROP TABLE delivery_company CASCADE CONSTRAINTS;
DROP TABLE porder_detail CASCADE CONSTRAINTS;
DROP TABLE shopping_cart CASCADE CONSTRAINTS;
DROP TABLE coupon_use CASCADE CONSTRAINTS;
DROP TABLE user_coupon CASCADE CONSTRAINTS;
DROP TABLE coupon_category CASCADE CONSTRAINTS;
DROP TABLE coupon CASCADE CONSTRAINTS;
DROP TABLE payment_detail CASCADE CONSTRAINTS;
DROP TABLE payment CASCADE CONSTRAINTS;
DROP TABLE payment_method CASCADE CONSTRAINTS;
DROP TABLE porder CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: 주문 */
/**********************************/
CREATE TABLE porder(
		porderno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memberno                      		VARCHAR2(10)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		total_price                   		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		status                        		CHAR(1)		 NOT NULL,
		productno                     		NUMBER(10)		 NULL 
);

COMMENT ON TABLE porder is '주문';
COMMENT ON COLUMN porder.porderno is '주문no';
COMMENT ON COLUMN porder.memberno is '회원번호';
COMMENT ON COLUMN porder.rdate is '주문날짜';
COMMENT ON COLUMN porder.total_price is '주문총액';
COMMENT ON COLUMN porder.status is '주문상태';
COMMENT ON COLUMN porder.productno is '상품 등록 번호';


/**********************************/
/* Table Name: 결제방법 */
/**********************************/
CREATE TABLE payment_method(
		payment_methodno              		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		pname                         		VARCHAR2(100)		 NOT NULL,
		paymentno                     		NUMBER(10)		 NULL 
);

COMMENT ON TABLE payment_method is '결제방법';
COMMENT ON COLUMN payment_method.payment_methodno is '결제방법no';
COMMENT ON COLUMN payment_method.pname is '결제방법 이름';
COMMENT ON COLUMN payment_method.paymentno is '결제no';


/**********************************/
/* Table Name: 결제 */
/**********************************/
CREATE TABLE payment(
		paymentno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		result                        		CHAR(1)		 DEFAULT 'F'		 NOT NULL,
		total_price                   		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		payment_methodno              		NUMBER(10)		 NULL ,
		porderno                      		NUMBER(10)		 NULL ,
		payno                         		NUMBER(10)		 NULL ,
  FOREIGN KEY (payment_methodno) REFERENCES payment_method (payment_methodno),
  FOREIGN KEY (porderno) REFERENCES porder (porderno)
);

COMMENT ON TABLE payment is '결제';
COMMENT ON COLUMN payment.paymentno is '결제no';
COMMENT ON COLUMN payment.result is '결제결과';
COMMENT ON COLUMN payment.total_price is '총결제금액';
COMMENT ON COLUMN payment.rdate is '결제일';
COMMENT ON COLUMN payment.payment_methodno is '결제방법no';
COMMENT ON COLUMN payment.porderno is '주문no';
COMMENT ON COLUMN payment.payno is '승인 번호';


/**********************************/
/* Table Name: 세부 결제 */
/**********************************/
CREATE TABLE payment_detail(
		payment_detailno              		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		paymentno                     		NUMBER(10)		 NULL ,
		productno                     		NUMBER(10)		 NULL ,
  FOREIGN KEY (paymentno) REFERENCES payment (paymentno)
);

COMMENT ON TABLE payment_detail is '세부 결제';
COMMENT ON COLUMN payment_detail.payment_detailno is '세부결제';
COMMENT ON COLUMN payment_detail.paymentno is '결제no';
COMMENT ON COLUMN payment_detail.productno is '상품 등록 번호';


/**********************************/
/* Table Name: 쿠폰 */
/**********************************/
CREATE TABLE coupon(
		couponno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		cname                         		VARCHAR2(200)		 NOT NULL,
		cnt                           		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		discount                      		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		payment_methodno              		NUMBER(10)		 NULL ,
		paymentno                     		NUMBER(10)		 NULL 
);

COMMENT ON TABLE coupon is '쿠폰';
COMMENT ON COLUMN coupon.couponno is '쿠폰no';
COMMENT ON COLUMN coupon.cname is '쿠폰이름';
COMMENT ON COLUMN coupon.cnt is '쿠폰 총 수량';
COMMENT ON COLUMN coupon.discount is '할인액';
COMMENT ON COLUMN coupon.payment_methodno is '결제방법no';
COMMENT ON COLUMN coupon.paymentno is '결제no';


/**********************************/
/* Table Name: 쿠폰 사용 가능 카테고리 */
/**********************************/
CREATE TABLE coupon_category(
		coupon_categoryno             		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		cateno                        		NUMBER(10)		 NOT NULL,
		couponno                      		NUMBER(10)		 NULL ,
  FOREIGN KEY (couponno) REFERENCES coupon (couponno)
);

COMMENT ON TABLE coupon_category is '쿠폰 사용 가능 카테고리';
COMMENT ON COLUMN coupon_category.coupon_categoryno is '쿠폰 사용 가능 카테고리no';
COMMENT ON COLUMN coupon_category.cateno is '상품 카테고리';
COMMENT ON COLUMN coupon_category.couponno is '쿠폰no';


/**********************************/
/* Table Name: 회원 쿠폰 */
/**********************************/
CREATE TABLE user_coupon(
		user_couponno                 		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		cissue                        		DATE		 NOT NULL,
		cexpired                      		DATE		 NOT NULL,
		cnt                           		NUMBER(10)		 NOT NULL,
		couponno                      		NUMBER(10)		 NULL ,
		memberno                      		NUMERIC(10)		 NULL ,
  FOREIGN KEY (couponno) REFERENCES coupon (couponno)
);

COMMENT ON TABLE user_coupon is '회원 쿠폰';
COMMENT ON COLUMN user_coupon.user_couponno is '회원 쿠폰no';
COMMENT ON COLUMN user_coupon.cissue is '쿠폰발급일';
COMMENT ON COLUMN user_coupon.cexpired is '쿠폰만료일';
COMMENT ON COLUMN user_coupon.cnt is '쿠폰 수량';
COMMENT ON COLUMN user_coupon.couponno is '쿠폰no';
COMMENT ON COLUMN user_coupon.memberno is '회원번호';


/**********************************/
/* Table Name: 쿠폰 사용 내역 */
/**********************************/
CREATE TABLE coupon_use(
		coupon_useno                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		paymentno                     		NUMBER(10)		 NULL ,
		user_couponno                 		NUMBER(10)		 NULL ,
  FOREIGN KEY (user_couponno) REFERENCES user_coupon (user_couponno),
  FOREIGN KEY (paymentno) REFERENCES payment (paymentno)
);

COMMENT ON TABLE coupon_use is '쿠폰 사용 내역';
COMMENT ON COLUMN coupon_use.coupon_useno is '쿠폰 사용 내역no';
COMMENT ON COLUMN coupon_use.paymentno is '결제no';
COMMENT ON COLUMN coupon_use.user_couponno is '회원 쿠폰no';


/**********************************/
/* Table Name: 장바구니 */
/**********************************/
CREATE TABLE shopping_cart(
		memberno                      		VARCHAR2(10)		 NOT NULL		 PRIMARY KEY,
		productno                     		NUMBER(10)		 NOT NULL,
		cnt                           		NUMBER(10)		 DEFAULT 1		 NOT NULL
);

COMMENT ON TABLE shopping_cart is '장바구니';
COMMENT ON COLUMN shopping_cart.memberno is '회원번호';
COMMENT ON COLUMN shopping_cart.productno is '상품no';
COMMENT ON COLUMN shopping_cart.cnt is '수량';


/**********************************/
/* Table Name: 주문상세 */
/**********************************/
CREATE TABLE porder_detail(
		order_detailno                		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		productno                     		NUMBER(10)		 NOT NULL,
		cnt                           		NUMBER(10)		 DEFAULT 1		 NOT NULL,
		total_price                   		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		porderno                      		NUMBER(10)		 NULL ,
		user_id                       		VARCHAR2(100)		 NULL ,
  FOREIGN KEY (porderno) REFERENCES porder (porderno)
);

COMMENT ON TABLE porder_detail is '주문상세';
COMMENT ON COLUMN porder_detail.order_detailno is '주문상세no';
COMMENT ON COLUMN porder_detail.productno is '상품no';
COMMENT ON COLUMN porder_detail.cnt is '수량';
COMMENT ON COLUMN porder_detail.total_price is '총 가격';
COMMENT ON COLUMN porder_detail.porderno is '주문no';
COMMENT ON COLUMN porder_detail.user_id is '회원id';


/**********************************/
/* Table Name: 배송업체 */
/**********************************/
CREATE TABLE delivery_company(
		delivery_companyno            		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		cname                         		VARCHAR2(100)		 NOT NULL,
		deliveryno                    		NUMBER(10)		 NULL 
);

COMMENT ON TABLE delivery_company is '배송업체';
COMMENT ON COLUMN delivery_company.delivery_companyno is '배송업체 번호';
COMMENT ON COLUMN delivery_company.cname is '배송업체 이름';
COMMENT ON COLUMN delivery_company.deliveryno is '배송no';


/**********************************/
/* Table Name: 검색 역인덱스 */
/**********************************/
CREATE TABLE search_inverted_index(
		search_inverted_indexno       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		sterm                         		VARCHAR2(200)		 NOT NULL,
		productno                     		NUMBER(10)		 NOT NULL,
		term_position                 		NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE search_inverted_index is '검색 역인덱스';
COMMENT ON COLUMN search_inverted_index.search_inverted_indexno is '검색 역인덱스no';
COMMENT ON COLUMN search_inverted_index.sterm is '용어';
COMMENT ON COLUMN search_inverted_index.productno is '상품no';
COMMENT ON COLUMN search_inverted_index.term_position is '용어 위치';


/**********************************/
/* Table Name: 검색 통계 */
/**********************************/
CREATE TABLE search_statistics(
		search_statisticsno           		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		sterm                         		VARCHAR2(200)		 NOT NULL,
		cnt                           		NUMBER(10)		 DEFAULT 0		 NOT NULL
);

COMMENT ON TABLE search_statistics is '검색 통계';
COMMENT ON COLUMN search_statistics.search_statisticsno is '검색 통계no';
COMMENT ON COLUMN search_statistics.sterm is '용어';
COMMENT ON COLUMN search_statistics.cnt is '누적';


/**********************************/
/* Table Name: 환불 */
/**********************************/
CREATE TABLE refund(
		refundno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		rdate                         		DATE		 NOT NULL,
		total_price                   		NUMBER(10)		 NOT NULL,
		payment_methodno              		NUMBER(10)		 NULL ,
		paymentno                     		NUMBER(10)		 NULL ,
  FOREIGN KEY (payment_methodno) REFERENCES payment_method (payment_methodno),
  FOREIGN KEY (paymentno) REFERENCES payment (paymentno)
);

COMMENT ON TABLE refund is '환불';
COMMENT ON COLUMN refund.refundno is '환불no';
COMMENT ON COLUMN refund.rdate is '환불날짜';
COMMENT ON COLUMN refund.total_price is '환불 총금액';
COMMENT ON COLUMN refund.payment_methodno is '결제방법no';
COMMENT ON COLUMN refund.paymentno is '결제no';


/**********************************/
/* Table Name: 배송 */
/**********************************/
CREATE TABLE delivery(
		deliveryno                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		status                        		CHAR(1)		 NOT NULL,
		delivery_companyno            		NUMBER(10)		 NULL ,
		porderno                      		NUMBER(10)		 NULL ,
		productno                     		NUMBER(10)		 NULL ,
		paymentno                     		NUMBER(10)		 NULL ,
		payment_detailno              		NUMBER(10)		 NULL ,
  FOREIGN KEY (delivery_companyno) REFERENCES delivery_company (delivery_companyno),
  FOREIGN KEY (payment_detailno) REFERENCES payment_detail (payment_detailno)
);

COMMENT ON TABLE delivery is '배송';
COMMENT ON COLUMN delivery.deliveryno is '배송no';
COMMENT ON COLUMN delivery.status is '배송상태';
COMMENT ON COLUMN delivery.delivery_companyno is '배송업체 번호';
COMMENT ON COLUMN delivery.porderno is '주문no';
COMMENT ON COLUMN delivery.productno is '상품 등록 번호';
COMMENT ON COLUMN delivery.paymentno is '결제no';
COMMENT ON COLUMN delivery.payment_detailno is '세부결제';


