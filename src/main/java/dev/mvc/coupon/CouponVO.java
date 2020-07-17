package dev.mvc.coupon;

import org.springframework.web.multipart.MultipartFile;

/** 쿠폰 발급 내역 */
public class CouponVO {
  /*
    couponno                          NUMBER(10)     NOT NULL    PRIMARY KEY,
    cpimg                             VARCHAR2(100)    NULL,
    cpupimg                             VARCHAR2(100)    NULL,
    cpthumb                             VARCHAR2(100)    NULL,
    cpname                            VARCHAR2(200)    NOT NULL,
    cpdiscount                        NUMBER(10)     DEFAULT 0     NOT NULL,
    cpstock                           NUMBER(10)     DEFAULT 0     NOT NULL,
    cpcate                            VARCHAR2(100)    NULL 
 */
  
  /** 쿠폰no */
  private int couponno;
  /** 쿠폰이미지 Spring*/
  private MultipartFile cpimgMF;
  /** 쿠폰이미지 원본이름 */
  private String cpimg;
  /** 쿠폰이미지 저장된 이름 */
  private String cpupimg;
  /** 쿠폰이미지 썸네일 */
  private String cpthumb;
  /** 쿠폰이름 */
  private String cpname;
  /** 쿠폰할인금액 */
  private int cpdiscount;
  /** 쿠폰재고 */
  private int cpstock;
  /** 사용가능카테고리 */
  private String cpcate;
  
  // getter setter
  public int getCouponno() {
    return couponno;
  }
  public void setCouponno(int couponno) {
    this.couponno = couponno;
  }
  public MultipartFile getCpimgMF() {
    return cpimgMF;
  }
  public void setCpimgMF(MultipartFile cpimgMF) {
    this.cpimgMF = cpimgMF;
  }
  public String getCpimg() {
    return cpimg;
  }
  public void setCpimg(String cpimg) {
    this.cpimg = cpimg;
  }
  public String getCpupimg() {
    return cpupimg;
  }
  public void setCpupimg(String cpupimg) {
    this.cpupimg = cpupimg;
  }
  public String getCpthumb() {
    return cpthumb;
  }
  public void setCpthumb(String cpthumb) {
    this.cpthumb = cpthumb;
  }
  public String getCpname() {
    return cpname;
  }
  public void setCpname(String cpname) {
    this.cpname = cpname;
  }
  public int getCpdiscount() {
    return cpdiscount;
  }
  public void setCpdiscount(int cpdiscount) {
    this.cpdiscount = cpdiscount;
  }
  public int getCpstock() {
    return cpstock;
  }
  public void setCpstock(int cpstock) {
    this.cpstock = cpstock;
  }
  public String getCpcate() {
    return cpcate;
  }
  public void setCpcate(String cpcate) {
    this.cpcate = cpcate;
  }
  
}
