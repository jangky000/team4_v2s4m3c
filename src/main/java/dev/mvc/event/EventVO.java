package dev.mvc.event;

import org.springframework.web.multipart.MultipartFile;

//    eventno                           NUMBER(10)     NOT NULL    PRIMARY KEY,
//    event_title                       VARCHAR2(200)    NOT NULL,
//    event_content                     CLOB     NOT NULL,
//    event_img                         VARCHAR2(1000)     NULL ,
//    event_timg                        VARCHAR2(1000)     NULL ,

//    event_due                         VARCHAR2(500)    NOT NULL,
//    event_view                        NUMBER(7)    DEFAULT 0     NOT NULL,
//    event_seqno                       NUMBER(10)     DEFAULT 1     NOT NULL,
//    event_visible                     CHAR(1)    DEFAULT 'Y'     NOT NULL,
//    event_rdate                       DATE     NOT NULL,
//    event_passwd                      VARCHAR2(10)     NOT NULL


public class EventVO {
  
  /**이벤트번호*/
  private int eventno;
  
  /**이벤트제목*/
  private String event_title;
  
  /**이벤트내용*/
  private String event_content;
  
  /**이벤트이미지*/
  private String event_img;
  
  /**thumb img*/
  private String event_timg;
  
  /** JPG Spring */
  private MultipartFile event_imgMF;
  
  /**이벤트기간*/
  private String event_due;
  
  /**이벤트조회수*/
  private int event_view;
  
  /**이벤트출력순서*/
  private int event_seqno;
  
  /**이벤트출력모드*/
  private String event_visible;
  
  /**이벤트등록일*/
  private String event_rdate;
  
  private String event_passwd;
  
  public int getEventno() {
    return eventno;
  }
  public void setEventno(int eventno) {
    this.eventno = eventno;
  }
  public String getEvent_title() {
    return event_title;
  }
  public void setEvent_title(String event_title) {
    this.event_title = event_title;
  }
  public String getEvent_content() {
    return event_content;
  }
  public void setEvent_content(String event_content) {
    this.event_content = event_content;
  }
  public String getEvent_img() {
    return event_img;
  }
  public void setEvent_img(String event_img) {
    this.event_img = event_img;
  }

  public String getEvent_timg() {
    return event_timg;
  }
  public void setEvent_timg(String event_timg) {
    this.event_timg = event_timg;
  }
  
  public MultipartFile getEvent_imgMF() {
    return event_imgMF;
  }
  public void setEvent_imgMF(MultipartFile event_imgMF) {
    this.event_imgMF = event_imgMF;
  }
  
  public String getEvent_due() {
    return event_due;
  }
  public void setEvent_due(String event_due) {
    this.event_due = event_due;
  }
  public int getEvent_view() {
    return event_view;
  }
  public void setEvent_view(int event_view) {
    this.event_view = event_view;
  }
  public int getEvent_seqno() {
    return event_seqno;
  }
  public void setEvent_seqno(int event_seqno) {
    this.event_seqno = event_seqno;
  }
  public String getEvent_visible() {
    return event_visible;
  }
  public void setEvent_visible(String event_visible) {
    this.event_visible = event_visible;
  }
  public String getEvent_rdate() {
    return event_rdate;
  }
  public void setEvent_rdate(String event_rdate) {
    this.event_rdate = event_rdate;
  }
  public String getEvent_passwd() {
    return event_passwd;
  }
  public void setEvent_passwd(String event_passwd) {
    this.event_passwd = event_passwd;
  }
  
  
  
}
