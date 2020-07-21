package dev.mvc.qna;

import org.springframework.web.multipart.MultipartFile;

/**
 * 
 * 
CREATE TABLE Qna(
      Qnano                               NUMBER(10)       NOT NULL       PRIMARY KEY,
      Qna_title                           VARCHAR2(100)       NOT NULL,
      Qna_content                          CLOB       NOT NULL,
      Qna_name                            VARCHAR2(10)       NOT NULL,
      Qna_reply                           CLOB       NOT NULL,
      Qna_re                              VARCHAR2(20)       NOT NULL,
      Qna_date                            DATE       NOT NULL
      file1                                   VARCHAR(100)          NULL,
      thumb1                              VARCHAR(100)          NULL,
      size1  
 * 
 *
 */
public class QnaVO {
  /*Qna 번호*/
  private int qnano;
  /*qna 카테고리*/
  private String qnacate;
  /*Qna  제목*/
  private String qna_title;
  /*Qna 내용*/
  private String qna_content;
  /*Qna 작성자*/
  private String qna_name;
  /*Qna 등록패스워드*/
  private String qna_pass;
  /* 이미지 */
  private String upfile;
  /* preview 이미지 preview */
  private String thumb;
  /* 저장된 파일 사이즈 */
  private long fsize;
  /* 이미지 MultipartFile */
  private MultipartFile fileMF;
  /*Qna 등록일*/
  private String qna_date;
  
  
  public QnaVO() {
    
  }



  public QnaVO(int qnano, String qna_title, String qna_content, String qna_name, String qna_pass, String upfile,
      String thumb, long fsize, MultipartFile fileMF, String qna_date) {
    super();
    this.qnano = qnano;
    this.qna_title = qna_title;
    this.qna_content = qna_content;
    this.qna_name = qna_name;
    this.qna_pass = qna_pass;
    this.upfile = upfile;
    this.thumb = thumb;
    this.fsize = fsize;
    this.fileMF = fileMF;
    this.qna_date = qna_date;
  }







  public int getQnano() {
    return qnano;
  }


  public void setQnano(int qnano) {
    this.qnano = qnano;
  }



  public String getQnacate() {
    return qnacate;
  }



  public void setQnacate(String qnacate) {
    this.qnacate = qnacate;
  }



  public String getQna_title() {
    return qna_title;
  }


  public void setQna_title(String qna_title) {
    this.qna_title = qna_title;
  }


  public String getQna_content() {
    return qna_content;
  }


  public void setQna_content(String qna_content) {
    this.qna_content = qna_content;
  }


  public String getQna_name() {
    return qna_name;
  }


  public void setQna_name(String qna_name) {
    this.qna_name = qna_name;
  }


  public String getQna_pass() {
    return qna_pass;
  }



  public void setQna_pass(String qna_pass) {
    this.qna_pass = qna_pass;
  }

 



  public String getUpfile() {
    return upfile;
  }







  public void setUpfile(String upfile) {
    this.upfile = upfile;
  }







  public String getThumb() {
    return thumb;
  }







  public void setThumb(String thumb) {
    this.thumb = thumb;
  }







  public long getFsize() {
    return fsize;
  }







  public void setFsize(long fsize) {
    this.fsize = fsize;
  }







  public MultipartFile getFileMF() {
    return fileMF;
  }







  public void setFileMF(MultipartFile fileMF) {
    this.fileMF = fileMF;
  }







  public String getQna_date() {
    return qna_date;
  }


  public void setQna_date(String qna_date) {
    this.qna_date = qna_date;
  }
  

  
  
  
  
}
