package dev.mvc.testo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Testq_Testo_VO_list {

  private int testqno;
  
  private int testq_seqno;
  
  private String testq_content;
  
  private String testq_img;
  
  private MultipartFile testq_imgMF;
  
  private String testq_timg;
  
  private int testq_tot;
  
  private List<TestoVO> testo_list;

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

  public List<TestoVO> getTesto_list() {
    return testo_list;
  }

  public void setTesto_list(List<TestoVO> testo_list) {
    this.testo_list = testo_list;
  }
  
  
}
