package dev.mvc.coupon_use;

/** 쿠폰 사용 내역 */
public class Coupon_useVO {
  /*
    coupon_useno                      NUMBER(10)     NOT NULL    PRIMARY KEY,
    porderno                          NUMBER(10)     NOT NULL ,
    coupon_issueno                    NUMBER(10)     NOT NULL ,
    rdate                             DATE     NOT NULL,
    cpstatus                    CHAR(1)    NOT NULL ,
 */

  
  /** 쿠폰사용no */
  private int coupon_useno;
  /** 주문no */
  private int porderno;
  /** 쿠폰발급no */
  private int coupon_issueno;
  /** 쿠폰사용일 */
  private String rdate;
  /** 쿠폰상태 */
  private String cpstatus; // 사용:U, 취소:C
  
  // getter setter
  public int getCoupon_useno() {
    return coupon_useno;
  }
  public void setCoupon_useno(int coupon_useno) {
    this.coupon_useno = coupon_useno;
  }
  public int getPorderno() {
    return porderno;
  }
  public void setPorderno(int porderno) {
    this.porderno = porderno;
  }
  public int getCoupon_issueno() {
    return coupon_issueno;
  }
  public void setCoupon_issueno(int coupon_issueno) {
    this.coupon_issueno = coupon_issueno;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  public String getCpstatus() {
    return cpstatus;
  }
  public void setCpstatus(String cpstatus) {
    this.cpstatus = cpstatus;
  }
  
}
