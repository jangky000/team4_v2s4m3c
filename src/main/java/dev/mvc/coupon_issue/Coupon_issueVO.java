package dev.mvc.coupon_issue;

/** 쿠폰 */
public class Coupon_issueVO {
  /*
    coupon_issueno                    NUMBER(10)     NOT NULL    PRIMARY KEY,
    memno                             NUMBER(10)     NOT NULL,
    couponno                          NUMBER(10)     NOT NULL ,
    cpcnt                               NUMBER(10)     NOT NULL,
    cpissue                           DATE     NOT NULL,
    cpexpired                         DATE     NOT NULL,
    cpstatus                    CHAR(1)    NOT NULL ,
 */
  
  /** 쿠폰발급no */
  private int coupon_issueno;
  /** 회원no */
  private int memno;
  /** 쿠폰no */
  private int couponno;
  /** 쿠폰발급수량 */
  private int cpcnt;
  /** 쿠폰발급일 */
  private String cpissue;
  /** 쿠폰만료일 */
  private String cpexpired;
  /** 쿠폰상태 */
  private String cpstatus; // I: issue 발급, U: used 사용완료, C:calceled 발급취소
  
  // getter setter
  public int getCoupon_issueno() {
    return coupon_issueno;
  }
  public void setCoupon_issueno(int coupon_issueno) {
    this.coupon_issueno = coupon_issueno;
  }
  public int getMemno() {
    return memno;
  }
  public void setMemno(int memno) {
    this.memno = memno;
  }
  public int getCouponno() {
    return couponno;
  }
  public void setCouponno(int couponno) {
    this.couponno = couponno;
  }
  public int getCpcnt() {
    return cpcnt;
  }
  public void setCpcnt(int cpcnt) {
    this.cpcnt = cpcnt;
  }
  public String getCpissue() {
    return cpissue;
  }
  public void setCpissue(String cpissue) {
    this.cpissue = cpissue;
  }
  public String getCpexpired() {
    return cpexpired;
  }
  public void setCpexpired(String cpexpired) {
    this.cpexpired = cpexpired;
  }
  public String getCpstatus() {
    return cpstatus;
  }
  public void setCpstatus(String cpstatus) {
    this.cpstatus = cpstatus;
  }
  
  
  
}
