package dev.mvc.coupon_issue;

/** ���� */
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
  
  /** �����߱�no */
  private int coupon_issueno;
  /** ȸ��no */
  private int memno;
  /** ����no */
  private int couponno;
  /** �����߱޼��� */
  private int cpcnt;
  /** �����߱��� */
  private String cpissue;
  /** ���������� */
  private String cpexpired;
  /** �������� */
  private String cpstatus; // I: issue �߱�, U: used ���Ϸ�, C:calceled �߱����
  
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
