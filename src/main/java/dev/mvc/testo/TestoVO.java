package dev.mvc.testo;

/*CREATE TABLE testo(
    testono                           NUMBER(10)     NOT NULL    PRIMARY KEY,
    testo_content                     VARCHAR2(500)    NOT NULL,
    testo_img                         VARCHAR2(1000)     NULL ,
    testo_seqno                       NUMBER(10)     DEFAULT 1     NOT NULL,
    testqno                           NUMBER(10)     NULL ,
  FOREIGN KEY (testqno) REFERENCES testq (testqno)
);*/
public class TestoVO {
  
  public int testono;
  public int testqno;
  public String testo_content;
  public String testo_img;
  public int testo_seqno;

  public TestoVO() {
    
  }
  public TestoVO(int testono, int testqno, String testo_content, String testo_img, int testo_seqno) {
    this.testono = testono;
    this.testqno = testqno;
    this.testo_content = testo_content;
    this.testo_img = testo_img;
    this.testo_seqno = testo_seqno;

  }
  
  
  public int getTestono() {
    return testono;
  }
  public void setTestono(int testono) {
    this.testono = testono;
  }
  public String getTesto_content() {
    return testo_content;
  }
  public void setTesto_content(String testo_content) {
    this.testo_content = testo_content;
  }
  public String getTesto_img() {
    return testo_img;
  }
  public void setTesto_img(String testo_img) {
    this.testo_img = testo_img;
  }
  public int getTesto_seqno() {
    return testo_seqno;
  }
  public void setTesto_seqno(int testo_seqno) {
    this.testo_seqno = testo_seqno;
  }
  public int getTestqno() {
    return testqno;
  }
  public void setTestqno(int testqno) {
    this.testqno = testqno;
  }
  

}
