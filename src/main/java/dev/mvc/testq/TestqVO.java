package dev.mvc.testq;

import org.springframework.web.multipart.MultipartFile;

//testqno                           NUMBER(10)     NOT NULL    PRIMARY KEY,
//testq_seqno                       NUMBER(10)     DEFAULT 1        NOT NULL,
//testq_content                     VARCHAR2(1000)     NOT NULL,
//testq_img                         VARCHAR2(1000)     NULL ,
//testq_timg                        VARCHAR2(1000)     NULL ,
//testq_tot                         NUMBER(10)     DEFAULT 0     NOT NULL
public class TestqVO {
  
  private int testqno;
  
  private int testq_seqno;
  
  private String testq_content;
  
  private String testq_img;
  
  private MultipartFile testq_imgMF;
  
  private String testq_timg;
  
  private int testq_tot;

  public int getTestqno() {
    return testqno;
  }

  public void setTestqno(int testqno) {
    this.testqno = testqno;
  }

  public int getTestq_seqno() {
    return testq_seqno;
  }

  public void setTestq_seqno(int testq_seqno) {
    this.testq_seqno = testq_seqno;
  }

  public String getTestq_content() {
    return testq_content;
  }

  public void setTestq_content(String testq_content) {
    this.testq_content = testq_content;
  }

  public String getTestq_img() {
    return testq_img;
  }

  public void setTestq_img(String testq_img) {
    this.testq_img = testq_img;
  }

  
  public MultipartFile getTestq_imgMF() {
    return testq_imgMF;
  }

  public void setTestq_imgMF(MultipartFile testq_imgMF) {
    this.testq_imgMF = testq_imgMF;
  }

  public String getTestq_timg() {
    return testq_timg;
  }

  public void setTestq_timg(String testq_timg) {
    this.testq_timg = testq_timg;
  }

  public int getTestq_tot() {
    return testq_tot;
  }

  public void setTestq_tot(int testq_tot) {
    this.testq_tot = testq_tot;
  }
  
 
}
