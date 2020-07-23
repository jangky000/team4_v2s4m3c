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
  
  /** ����� ��ȣ */
  private int thumbno;
  /** ��ǰ ��Ϲ�ȣ*/
  private int itemno;
  /** ���� ���ϸ� */
  private String fname;
  /** ���ε�� ���ϸ� */
  private String fupname;
  /** Thumb �̹��� */
  private String thumb;
  /** ���� ũ�� */
  private long fsize;
  /** ����� */
  private String rdate;
  
  /** Form�� ������ MultipartFile�� ��ȯ�Ͽ� List�� ����  */
  private List<MultipartFile> fnamesMF;

  // private MultipartFile fnamesMF;  // �ϳ��� ���� ó��
  /** ���� ���� ��� */
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