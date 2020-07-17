package dev.mvc.porder_detail;

public class Porder_detailVO {

  /*      
      porder_detailno                   NUMBER(10)     NOT NULL    PRIMARY KEY,
      porderno                          NUMBER(10)     NOT NULL,
      itemno                            NUMBER(10)     NOT NULL,
      quantity                          NUMBER(10)     DEFAULT 1     NOT NULL,
      item_price_sum                    NUMBER(10)     DEFAULT 0     NOT NULL,
      item_discount_sum                 NUMBER(10)     NOT NULL,
      payment_price                     NUMBER(10)     NOT NULL,
      porder_detail_status                 CHAR(1)     NOT NULL,
      trackingno                        NUMBER(10)     NULL
  */
  
  /** 주문상세no */
  private int porder_detailno;
  /** 주문no */
  private int porderno;
  /** 상품no */
  private int itemno;
  /** 수량 */
  private int quantity;
  /** 판매가총액 */
  private int item_price_sum;
  /** 할인총액 */
  private int item_discount_sum;
  /** 최종결제액 */
  private int payment_price;
  /** 주문상세승인상태 */
  private String porder_detail_status;
  /** 운송장번호 */
  private String trackingno; // int를 쓰면 null일 때 el에서 0을 띄우게 된다. 그래서 실제로 number 타입이지만 스프링에서 string으로 가져다 써도 수정에는 문제가 없다.
  
  public Porder_detailVO(){
    
  }
  
  public void setVO(int porderno, int itemno, int quantity, int item_price_sum, int item_discount_sum,
      int payment_price, String porder_detail_status) {
    this.porderno = porderno;
    this.itemno = itemno;
    this.quantity = quantity;
    this.item_price_sum = item_price_sum;
    this.item_discount_sum = item_discount_sum;
    this.payment_price = payment_price;
    this.porder_detail_status = porder_detail_status;
  }
  
  // getter, setter
  public int getPorder_detailno() {
    return porder_detailno;
  }
  public void setPorder_detailno(int porder_detailno) {
    this.porder_detailno = porder_detailno;
  }
  public int getPorderno() {
    return porderno;
  }
  public void setPorderno(int porderno) {
    this.porderno = porderno;
  }
  public int getItemno() {
    return itemno;
  }
  public void setItemno(int itemno) {
    this.itemno = itemno;
  }
  public int getQuantity() {
    return quantity;
  }
  public void setQuantity(int quantity) {
    this.quantity = quantity;
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
  public int getPayment_price() {
    return payment_price;
  }
  public void setPayment_price(int payment_price) {
    this.payment_price = payment_price;
  }
  public String getPorder_detail_status() {
    return porder_detail_status;
  }
  public void setPorder_detail_status(String porder_detail_status) {
    this.porder_detail_status = porder_detail_status;
  }
  public String getTrackingno() {
    return trackingno;
  }
  public void setTrackingno(String trackingno) {
    this.trackingno = trackingno;
  }
  
  
}
