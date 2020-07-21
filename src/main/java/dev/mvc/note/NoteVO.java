package dev.mvc.note;

/*
CREATE TABLE note(
noteno                       NUMBER(10)  NOT NULL  PRIMARY KEY,
notecate                    VARCHAR2(50)  NOT NULL,
note_title                   VARCHAR2(50)  NOT NULL,
note_content                 CLOB  NOT NULL,
note_seqno                    NUMBER(10)  NOT NULL,
note_manager                VARCHAR2(50)  NOT NULL,
note_pass                 VARCHAR2(20)  NOT NULL,
note_date                    DATE  NOT NULL
);
 */
public class NoteVO {
 
  /**공지사항번호*/
  private int noteno;
  /**공지사항 항목*/
  private String notecate;
  /**공지사항 제목*/
  private String note_title;
  /**공지사항 내용*/
  private String note_content;
  /**공지사항 출력순서*/
  private int note_seqno;
  /** 공지사항 등록인*/
  private String note_manager;
  /** 공지사항 패스워드*/
  private String note_pass;
  /**공지사항 등록일*/
  private String note_date;
  

  public NoteVO(){
    
  } 
  
  public NoteVO(int noteno, String notecate, String note_title, String note_content, int note_seqno, String note_date, String note_manager,String note_pass) {
    this.noteno = noteno;
    this.notecate = notecate;
    this.note_title = note_title;
    this.note_content = note_content;
    this.note_seqno = note_seqno;
    this.note_manager = note_manager;
    this.note_pass = note_pass;
    this.note_date = note_date;
  }


  public int getNoteno() {
    return noteno;
  }


  public void setNoteno(int noteno) {
    this.noteno = noteno;
  }


  public String getNotecate() {
    return notecate;
  }


  public void setNotecate(String notecate) {
    this.notecate = notecate;
  }


  public String getNote_title() {
    return note_title;
  }


  public void setNote_title(String note_title) {
    this.note_title = note_title;
  }


  public String getNote_content() {
    return note_content;
  }


  public void setNote_content(String note_content) {
    this.note_content = note_content;
  }
  
  public int getNote_seqno() {
    return note_seqno;
  }


  public void setNote_seqno(int note_seqno) {
    this.note_seqno= note_seqno;
  }

 

  public String getNote_manager() {
    return note_manager;
  }

  public void setNote_manager(String note_manager) {
    this.note_manager = note_manager;
  }
  
  public String getnote_pass() {
    return note_pass;
  }

  public void setnote_pass(String note_pass) {
    this.note_pass = note_pass;
  }

  public String getNote_date() {
    return note_date;
  }


  public void setNote_date(String note_date) {
    this.note_date = note_date;
  }
  
}
