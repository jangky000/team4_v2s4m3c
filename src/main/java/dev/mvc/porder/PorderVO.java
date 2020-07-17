package dev.mvc.porder;

/** 주문 */
public class PorderVO {
  /*
    porderno                          NUMBER(10)     NOT NULL    PRIMARY KEY,
    memno                             NUMBER(10)     NOT NULL,
    rdate                             DATE     NOT NULL,
    item_price_sum                    NUMBER(10)     NOT NULL,
    item_discount_sum                 NUMBER(10)     NOT NULL,
    coupon_discount_sum               NUMBER(10)     NOT NULL,
    delivery_fee                      NUMBER(10)     DEFAULT 0     NOT NULL,
    payment_price                     NUMBER(10)     DEFAULT 0     NOT NULL,
    porder_status                     CHAR(1)    NOT NULL,
    porder_zip_code                  NUMBER(10)  NOT NULL,
    porder_address                    VARCHAR2(1000)     NOT NULL,
    porder_delivery_request         VARCHAR2(1000),
 */
  
  /** 주문no */
  private int porderno;
  /** 회원번호 */
  private int memno;
  /** 주문날짜 */
  private String rdate;
  /** 판매가총액 */
  private int item_price_sum;
  /** 할인총액 */
  private int item_discount_sum;
  /** 쿠폰할인 */
  private int coupon_discount_sum;
  /** 배송비 */
  private int delivery_fee;
  /** 최종결제금액 */
  private int payment_price;
  /** 승인 상태 */
  private String porder_status; // R:request 승인요청 S: success 승인확인, C: cancelled 결제취소
  /** 우편번호 */
  private int porder_zip_code;
  /** 배송지 */
  private String porder_address;
  /** 배송 요청사항 */
  private String porder_delivery_request;
  
  // 기본 생성자
  public PorderVO() {
    
  }
  
  // 생성자
  public PorderVO(int memno, int item_price_sum, int item_discount_sum, int coupon_discount_sum, int delivery_fee,
      int payment_price, String porder_status, int porder_zip_code, String porder_address,
      String porder_delivery_request) {
    this.memno = memno;
    this.item_price_sum = item_price_sum;
    this.item_discount_sum = item_discount_sum;
    this.coupon_discount_sum = coupon_discount_sum;
    this.delivery_fee = delivery_fee;
    this.payment_price = payment_price;
    this.porder_status = porder_status;
    this.porder_zip_code = porder_zip_code;
    this.porder_address = porder_address;
    this.porder_delivery_request = porder_delivery_request;
  }
  //getter / setter
  public int getPorderno() {
    return porderno;
  }
  public void setPorderno(int porderno) {
    this.porderno = porderno;
  }
  public int getMemno() {
    return memno;
  }
  public void setMemno(int memno) {
    this.memno = memno;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  public int getItem_price_sum() {
    return item_price_sum;
  }
  public void setItem_price_sum(int item_price_sum) {
    this.item_price_sum = item_price_sum;
  }
  public int getItem_discount_sum() {
    return item_discount_sum;
  }
  public void setItem_discount_sum(int item_discount_sum) {
    this.item_discount_sum = item_discount_sum;
  }
  public int getCoupon_discount_sum() {
    return coupon_discount_sum;
  }
  public void setCoupon_discount_sum(int coupon_discount_sum) {
    this.coupon_discount_sum = coupon_discount_sum;
  }
  public int getDelivery_fee() {
    return delivery_fee;
  }
  public void setDelivery_fee(int delivery_fee) {
    this.delivery_fee = delivery_fee;
  }
  public int getPayment_price() {
    return payment_price;
  }
  public void setPayment_price(int payment_price) {
    this.payment_price = payment_price;
  }
  public String getPorder_status() {
    return porder_status;
  }
  public void setPorder_status(String porder_status) {
    this.porder_status = porder_status;
  }
  public int getPorder_zip_code() {
    return porder_zip_code;
  }
  public void setPorder_zip_code(int porder_zip_code) {
    this.porder_zip_code = porder_zip_code;
  }
  public String getPorder_address() {
    return porder_address;
  }
  public void setPorder_address(String porder_address) {
    this.porder_address = porder_address;
  }
  public String getPorder_delivery_request() {
    return porder_delivery_request;
  }
  public void setPorder_delivery_request(String porder_delivery_request) {
    this.porder_delivery_request = porder_delivery_request;
  }  
  
}
