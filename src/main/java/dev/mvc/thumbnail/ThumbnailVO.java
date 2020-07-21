package dev.mvc.thumbnail;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ThumbnailVO {
/*
  thumbno                     NUMBER(10)         NOT NULL         PRIMARY KEY,
  itemno                        NUMBER(10)         NULL ,
  fname                         VARCHAR2(100)     NULL,
  fupname                      VARCHAR2(100)     NULL,
  thumb                         VARCHAR2(100)     NULL ,
  fsize                            NUMBER(10)         DEFAULT 0         NOT NULL,
  rdate                           DATE                  NOT NULL
  */
  
  /** 썸네일 번호 */
  private int thumbno;
  /** 상품 등록번호*/
  private int itemno;
  /** 원본 파일명 */
  private String fname;
  /** 업로드된 파일명 */
  private String fupname;
  /** Thumb 이미지 */
  private String thumb;
  /** 파일 크기 */
  private long fsize;
  /** 등록일 */
  private String rdate;
  
  /** Form의 파일을 MultipartFile로 변환하여 List에 저장  */
  private List<MultipartFile> fnamesMF;

  // private MultipartFile fnamesMF;  // 하나의 파일 처리
  /** 파일 단위 출력 */
  private String flabel;   
  
  public String getFlabel() {
    return flabel;
  }

  public void setFlabel(String flabel) {
    this.flabel = flabel;
  }

  public int getThumbno() {
    return thumbno;
  }

  public void setThumbno(int thumbno) {
    this.thumbno = thumbno;
  }

  public int getItemno() {
    return itemno;
  }

  public void setItemno(int itemno) {
    this.itemno = itemno;
  }

  public String getFname() {
    return fname;
  }

  public void setFname(String fname) {
    this.fname = fname;
  }

  public String getFupname() {
    return fupname;
  }

  public void setFupname(String fupname) {
    this.fupname = fupname;
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

  public String getRdate() {
    return rdate;
  }

  public void setRdate(String rdate) {
    this.rdate = rdate;
  }

  public List<MultipartFile> getFnamesMF() {
    return fnamesMF;
  }

  public void setFnamesMF(List<MultipartFile> fnamesMF) {
    this.fnamesMF = fnamesMF;
  }
  
  
  
}
