package dev.mvc.testo;

/*SELECT q.testqno as q_testqno, q.testq_content as q_testq_content, q.testq_img as q_testq_img, q.testq_timg as q_testq_timg,
           o.testono, o.testqno, o.testo_content, o.testo_seqno
FROM testq q, testo o
WHERE q.testqno=o.testqno
ORDER BY q.testqno ASC, o.testo_seqno ASC;*/
public class Testq_Testo_join {

  //---------------
  //  Testq table
  //---------------
  
  private int q_testqno;
  
  private String q_testq_content;
  
  private String q_testq_img;
  
  private String q_testq_timg;
  
  
  //---------------
  //  Testo table
  //---------------
  
  private int testono;
  
  private int testqno;
  
  private String testo_content;
  
  private int testo_seqno;

  public int getQ_testqno() {
    return q_testqno;
  }

  public void setQ_testqno(int q_testqno) {
    this.q_testqno = q_testqno;
  }

  public String getQ_testq_content() {
    return q_testq_content;
  }

  public void setQ_testq_content(String q_testq_content) {
    this.q_testq_content = q_testq_content;
  }

  public String getQ_testq_img() {
    return q_testq_img;
  }

  public void setQ_testq_img(String q_testq_img) {
    this.q_testq_img = q_testq_img;
  }

  public String getQ_testq_timg() {
    return q_testq_timg;
  }

  public void setQ_testq_timg(String q_testq_timg) {
    this.q_testq_timg = q_testq_timg;
  }

  public int getTestono() {
    return testono;
  }

  public void setTestono(int testono) {
    this.testono = testono;
  }

  public int getTestqno() {
    return testqno;
  }

  public void setTestqno(int testqno) {
    this.testqno = testqno;
  }

  public String getTesto_content() {
    return testo_content;
  }

  public void setTesto_content(String testo_content) {
    this.testo_content = testo_content;
  }

  public int getTesto_seqno() {
    return testo_seqno;
  }

  public void setTesto_seqno(int testo_seqno) {
    this.testo_seqno = testo_seqno;
  }
  
  

  
}
