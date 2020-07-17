package dev.mvc.item;

public class ItemVO {
  /*itemno                              NUMBER(10)         NOT NULL            PRIMARY KEY,
  grpno                                NUMBER(10)         NOT NULL ,
  item_name                          VARCHAR2(500)    NOT NULL,
  item_stock                          NUMBER(10)         NOT NULL,
  item_price                           NUMBER(10)         NOT NULL,
  item_cost                            NUMBER(10)         NOT NULL,
  discount_rate                       NUMBER(10)         DEFAULT 0             NOT NULL,
  item_content                       CLOB                   NOT NULL,
  item_type                           VARCHAR2(100)     NOT NULL,
  item_effect                          VARCHAR2(100)    NOT NULL,
  item_origin                          VARCHAR2(50)      DEFAULT '±¹³»»ê'      NOT NULL,
  item_visible                         CHAR(1)               DEFAULT 'Y'           NOT NULL,
  item_visibleno                      NUMBER(10)         NOT NULL,
  item_recom                         NUMBER(10)         DEFAULT 0             NOT NULL,
  item_view                           NUMBER(10)          DEFAULT 0             NOT NULL,
  item_rdate                          DATE                   NOT NULL,     
  upfile                                  VARCHAR(100)       NULL,
  thumb                               VARCHAR(100)       NULL,
  fsize                                   NUMBER(10)          DEFAULT 0 NULL,  */
  
  private int itemno;
  private int grpno;
  private String item_name;
  private int item_stock;
  private int item_price;
  private int item_cost;
  private int discount_rate;
  private String item_content;
  private String item_type;
  private String item_effect;
  private String item_origin;
  private String item_visible;
  private int item_visibleno;
  private int item_recom;
  private int item_view;
  private String item_rdate;
  private String upfile;
  private String thumb;
  private int fsize;
  public int getItemno() {
    return itemno;
  }
  public void setItemno(int itemno) {
    this.itemno = itemno;
  }
  public int getGrpno() {
    return grpno;
  }
  public void setGrpno(int grpno) {
    this.grpno = grpno;
  }
  public String getItem_name() {
    return item_name;
  }
  public void setItem_name(String item_name) {
    this.item_name = item_name;
  }
  public int getItem_stock() {
    return item_stock;
  }
  public void setItem_stock(int item_stock) {
    this.item_stock = item_stock;
  }
  public int getItem_price() {
    return item_price;
  }
  public void setItem_price(int item_price) {
    this.item_price = item_price;
  }
  public int getItem_cost() {
    return item_cost;
  }
  public void setItem_cost(int item_cost) {
    this.item_cost = item_cost;
  }
  public int getDiscount_rate() {
    return discount_rate;
  }
  public void setDiscount_rate(int discount_rate) {
    this.discount_rate = discount_rate;
  }
  public String getItem_content() {
    return item_content;
  }
  public void setItem_content(String item_content) {
    this.item_content = item_content;
  }
  public String getItem_type() {
    return item_type;
  }
  public void setItem_type(String item_type) {
    this.item_type = item_type;
  }
  public String getItem_effect() {
    return item_effect;
  }
  public void setItem_effect(String item_effect) {
    this.item_effect = item_effect;
  }
  public String getItem_origin() {
    return item_origin;
  }
  public void setItem_origin(String item_origin) {
    this.item_origin = item_origin;
  }
  public String getItem_visible() {
    return item_visible;
  }
  public void setItem_visible(String item_visible) {
    this.item_visible = item_visible;
  }
  public int getItem_visibleno() {
    return item_visibleno;
  }
  public void setItem_visibleno(int item_visibleno) {
    this.item_visibleno = item_visibleno;
  }
  public int getItem_recom() {
    return item_recom;
  }
  public void setItem_recom(int item_recom) {
    this.item_recom = item_recom;
  }
  public int getItem_view() {
    return item_view;
  }
  public void setItem_view(int item_view) {
    this.item_view = item_view;
  }
  public String getItem_rdate() {
    return item_rdate;
  }
  public void setItem_rdate(String item_rdate) {
    this.item_rdate = item_rdate;
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
  public int getFsize() {
    return fsize;
  }
  public void setFsize(int fsize) {
    this.fsize = fsize;
  }
  
  
  
}
