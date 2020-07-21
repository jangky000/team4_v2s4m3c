package dev.mvc.itemgrp;

//grpno                             NUMBER(10)     NOT NULL,
//name                              VARCHAR2(50)     NOT NULL,
//visibleno                         NUMBER(7)        NOT NULL,
//visible                             CHAR(1)            DEFAULT 'Y'     NOT NULL,
//rdate                               DATE                 NOT NULL,
//PRIMARY KEY(grpno)

public class ItemgrpVO {
  private int grpno;
  private String name;
  private int visibleno;
  private String visible;
  private String rdate;

  public ItemgrpVO() {
    
  }

  public ItemgrpVO(int grpno, String name, int visibleno, String visible, String rdate) {
    this.grpno = grpno;
    this.name = name;
    this.visibleno = visibleno;
    this.visible = visible;
    this.rdate = rdate;
  }
  
  public int getGrpno() {
    return grpno;
  }

  public void setGrpno(int grpno) {
    this.grpno = grpno;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int getVisibleno() {
    return visibleno;
  }

  public void setVisibleno(int visibleno) {
    this.visibleno = visibleno;
  }

  public String getVisible() {
    return visible;
  }

  public void setVisible(String visible) {
    this.visible = visible;
  }

  public String getRdate() {
    return rdate;
  }

  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  
}
