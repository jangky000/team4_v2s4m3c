package dev.mvc.shopping_cart;

public class Shop_item_grpVO {
  /*
   * ig.grpno, ig.name, 
   * si.itemno, si.item_name, si.item_price, si.discount_rate, si.item_type, si.item_origin, si.upfile, si.thumb,
   * si.shopping_cartno, si.memno, si.quantity
   */
  
  // itemgrp
  /** ī�װ� �׷� ��ȣ */
  private int grpno;
  /** �׷� �̸� */
  private String name;
  
  // item
  /** ��ǰ ��� ��ȣ */
  private int itemno;
  /** ��ǰ �̸� */
  private String item_name;
  /** ��ǰ ���� */
  private int item_price;
  /** ���η� */
  private int discount_rate; // 100% ����, 30% ����, 99% ���� ��
  /** ��ǰ ���� */
  private String item_type;
  /** ������ */
  private String item_origin;
  /** ���ε� ���� */
  private String upfile;
  /** ����� ���� */
  private String thumb;
  
  // shopping_cart
  /** ��ٱ���no */
  private int shopping_cartno;
  /** ȸ����ȣ */
  private int memno;
  /** ���� */
  private int quantity;
  
  
  // getter setter
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
  public int getItemno() {
    return itemno;
  }
  public void setItemno(int itemno) {
    this.itemno = itemno;
  }
  public String getItem_name() {
    return item_name;
  }
  public void setItem_name(String item_name) {
    this.item_name = item_name;
  }
  public int getItem_price() {
    return item_price;
  }
  public void setItem_price(int item_price) {
    this.item_price = item_price;
  }
  public int getDiscount_rate() {
    return discount_rate;
  }
  public void setDiscount_rate(int discount_rate) {
    this.discount_rate = discount_rate;
  }
  public String getItem_type() {
    return item_type;
  }
  public void setItem_type(String item_type) {
    this.item_type = item_type;
  }
  public String getItem_origin() {
    return item_origin;
  }
  public void setItem_origin(String item_origin) {
    this.item_origin = item_origin;
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
  public int getShopping_cartno() {
    return shopping_cartno;
  }
  public void setShopping_cartno(int shopping_cartno) {
    this.shopping_cartno = shopping_cartno;
  }
  public int getMemno() {
    return memno;
  }
  public void setMemno(int memno) {
    this.memno = memno;
  }
  public int getQuantity() {
    return quantity;
  }
  public void setQuantity(int quantity) {
    this.quantity = quantity;
  }
  
  
}
