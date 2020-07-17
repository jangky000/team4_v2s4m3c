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
/* Table Name: �ֹ� */
/**********************************/
CREATE TABLE porder(
		porderno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memberno                      		VARCHAR2(10)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		total_price                   		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		status                        		CHAR(1)		 NOT NULL,
		productno                     		NUMBER(10)		 NULL 
);

COMMENT ON TABLE porder is '�ֹ�';
COMMENT ON COLUMN porder.porderno is '�ֹ�no';
COMMENT ON COLUMN porder.memberno is 'ȸ����ȣ';
COMMENT ON COLUMN porder.rdate is '�ֹ���¥';
COMMENT ON COLUMN porder.total_price is '�ֹ��Ѿ�';
COMMENT ON COLUMN porder.status is '�ֹ�����';
COMMENT ON COLUMN porder.productno is '��ǰ ��� ��ȣ';


/**********************************/
/* Table Name: ������� */
/**********************************/
CREATE TABLE payment_method(
		payment_methodno              		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		pname                         		VARCHAR2(100)		 NOT NULL,
		paymentno                     		NUMBER(10)		 NULL 
);

COMMENT ON TABLE payment_method is '�������';
COMMENT ON COLUMN payment_method.payment_methodno is '�������no';
COMMENT ON COLUMN payment_method.pname is '������� �̸�';
COMMENT ON COLUMN payment_method.paymentno is '����no';


/**********************************/
/* Table Name: ���� */
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

COMMENT ON TABLE payment is '����';
COMMENT ON COLUMN payment.paymentno is '����no';
COMMENT ON COLUMN payment.result is '�������';
COMMENT ON COLUMN payment.total_price is '�Ѱ����ݾ�';
COMMENT ON COLUMN payment.rdate is '������';
COMMENT ON COLUMN payment.payment_methodno is '�������no';
COMMENT ON COLUMN payment.porderno is '�ֹ�no';
COMMENT ON COLUMN payment.payno is '���� ��ȣ';


/**********************************/
/* Table Name: ���� ���� */
/**********************************/
CREATE TABLE payment_detail(
		payment_detailno              		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		paymentno                     		NUMBER(10)		 NULL ,
		productno                     		NUMBER(10)		 NULL ,
  FOREIGN KEY (paymentno) REFERENCES payment (paymentno)
);

COMMENT ON TABLE payment_detail is '���� ����';
COMMENT ON COLUMN payment_detail.payment_detailno is '���ΰ���';
COMMENT ON COLUMN payment_detail.paymentno is '����no';
COMMENT ON COLUMN payment_detail.productno is '��ǰ ��� ��ȣ';


/**********************************/
/* Table Name: ���� */
/**********************************/
CREATE TABLE coupon(
		couponno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		cname                         		VARCHAR2(200)		 NOT NULL,
		cnt                           		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		discount                      		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		payment_methodno              		NUMBER(10)		 NULL ,
		paymentno                     		NUMBER(10)		 NULL 
);

COMMENT ON TABLE coupon is '����';
COMMENT ON COLUMN coupon.couponno is '����no';
COMMENT ON COLUMN coupon.cname is '�����̸�';
COMMENT ON COLUMN coupon.cnt is '���� �� ����';
COMMENT ON COLUMN coupon.discount is '���ξ�';
COMMENT ON COLUMN coupon.payment_methodno is '�������no';
COMMENT ON COLUMN coupon.paymentno is '����no';


/**********************************/
/* Table Name: ���� ��� ���� ī�װ� */
/**********************************/
CREATE TABLE coupon_category(
		coupon_categoryno             		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		cateno                        		NUMBER(10)		 NOT NULL,
		couponno                      		NUMBER(10)		 NULL ,
  FOREIGN KEY (couponno) REFERENCES coupon (couponno)
);

COMMENT ON TABLE coupon_category is '���� ��� ���� ī�װ�';
COMMENT ON COLUMN coupon_category.coupon_categoryno is '���� ��� ���� ī�װ�no';
COMMENT ON COLUMN coupon_category.cateno is '��ǰ ī�װ�';
COMMENT ON COLUMN coupon_category.couponno is '����no';


/**********************************/
/* Table Name: ȸ�� ���� */
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

COMMENT ON TABLE user_coupon is 'ȸ�� ����';
COMMENT ON COLUMN user_coupon.user_couponno is 'ȸ�� ����no';
COMMENT ON COLUMN user_coupon.cissue is '�����߱���';
COMMENT ON COLUMN user_coupon.cexpired is '����������';
COMMENT ON COLUMN user_coupon.cnt is '���� ����';
COMMENT ON COLUMN user_coupon.couponno is '����no';
COMMENT ON COLUMN user_coupon.memberno is 'ȸ����ȣ';


/**********************************/
/* Table Name: ���� ��� ���� */
/**********************************/
CREATE TABLE coupon_use(
		coupon_useno                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		paymentno                     		NUMBER(10)		 NULL ,
		user_couponno                 		NUMBER(10)		 NULL ,
  FOREIGN KEY (user_couponno) REFERENCES user_coupon (user_couponno),
  FOREIGN KEY (paymentno) REFERENCES payment (paymentno)
);

COMMENT ON TABLE coupon_use is '���� ��� ����';
COMMENT ON COLUMN coupon_use.coupon_useno is '���� ��� ����no';
COMMENT ON COLUMN coupon_use.paymentno is '����no';
COMMENT ON COLUMN coupon_use.user_couponno is 'ȸ�� ����no';


/**********************************/
/* Table Name: ��ٱ��� */
/**********************************/
CREATE TABLE shopping_cart(
		memberno                      		VARCHAR2(10)		 NOT NULL		 PRIMARY KEY,
		productno                     		NUMBER(10)		 NOT NULL,
		cnt                           		NUMBER(10)		 DEFAULT 1		 NOT NULL
);

COMMENT ON TABLE shopping_cart is '��ٱ���';
COMMENT ON COLUMN shopping_cart.memberno is 'ȸ����ȣ';
COMMENT ON COLUMN shopping_cart.productno is '��ǰno';
COMMENT ON COLUMN shopping_cart.cnt is '����';


/**********************************/
/* Table Name: �ֹ��� */
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

COMMENT ON TABLE porder_detail is '�ֹ���';
COMMENT ON COLUMN porder_detail.order_detailno is '�ֹ���no';
COMMENT ON COLUMN porder_detail.productno is '��ǰno';
COMMENT ON COLUMN porder_detail.cnt is '����';
COMMENT ON COLUMN porder_detail.total_price is '�� ����';
COMMENT ON COLUMN porder_detail.porderno is '�ֹ�no';
COMMENT ON COLUMN porder_detail.user_id is 'ȸ��id';


/**********************************/
/* Table Name: ��۾�ü */
/**********************************/
CREATE TABLE delivery_company(
		delivery_companyno            		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		cname                         		VARCHAR2(100)		 NOT NULL,
		deliveryno                    		NUMBER(10)		 NULL 
);

COMMENT ON TABLE delivery_company is '��۾�ü';
COMMENT ON COLUMN delivery_company.delivery_companyno is '��۾�ü ��ȣ';
COMMENT ON COLUMN delivery_company.cname is '��۾�ü �̸�';
COMMENT ON COLUMN delivery_company.deliveryno is '���no';


/**********************************/
/* Table Name: �˻� ���ε��� */
/**********************************/
CREATE TABLE search_inverted_index(
		search_inverted_indexno       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		sterm                         		VARCHAR2(200)		 NOT NULL,
		productno                     		NUMBER(10)		 NOT NULL,
		term_position                 		NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE search_inverted_index is '�˻� ���ε���';
COMMENT ON COLUMN search_inverted_index.search_inverted_indexno is '�˻� ���ε���no';
COMMENT ON COLUMN search_inverted_index.sterm is '���';
COMMENT ON COLUMN search_inverted_index.productno is '��ǰno';
COMMENT ON COLUMN search_inverted_index.term_position is '��� ��ġ';


/**********************************/
/* Table Name: �˻� ��� */
/**********************************/
CREATE TABLE search_statistics(
		search_statisticsno           		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		sterm                         		VARCHAR2(200)		 NOT NULL,
		cnt                           		NUMBER(10)		 DEFAULT 0		 NOT NULL
);

COMMENT ON TABLE search_statistics is '�˻� ���';
COMMENT ON COLUMN search_statistics.search_statisticsno is '�˻� ���no';
COMMENT ON COLUMN search_statistics.sterm is '���';
COMMENT ON COLUMN search_statistics.cnt is '����';


/**********************************/
/* Table Name: ȯ�� */
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

COMMENT ON TABLE refund is 'ȯ��';
COMMENT ON COLUMN refund.refundno is 'ȯ��no';
COMMENT ON COLUMN refund.rdate is 'ȯ�ҳ�¥';
COMMENT ON COLUMN refund.total_price is 'ȯ�� �ѱݾ�';
COMMENT ON COLUMN refund.payment_methodno is '�������no';
COMMENT ON COLUMN refund.paymentno is '����no';


/**********************************/
/* Table Name: ��� */
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

COMMENT ON TABLE delivery is '���';
COMMENT ON COLUMN delivery.deliveryno is '���no';
COMMENT ON COLUMN delivery.status is '��ۻ���';
COMMENT ON COLUMN delivery.delivery_companyno is '��۾�ü ��ȣ';
COMMENT ON COLUMN delivery.porderno is '�ֹ�no';
COMMENT ON COLUMN delivery.productno is '��ǰ ��� ��ȣ';
COMMENT ON COLUMN delivery.paymentno is '����no';
COMMENT ON COLUMN delivery.payment_detailno is '���ΰ���';


