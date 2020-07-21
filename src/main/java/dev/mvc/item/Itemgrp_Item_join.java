package dev.mvc.item;

import org.springframework.web.multipart.MultipartFile;

public class Itemgrp_Item_join {
  // -------------------------------------------------------------------
  // Itemgrp table
  // -------------------------------------------------------------------  
  /** 메인 카테고리 번호 */
  private int g_grpno;
  /** 그룹 이름 */
  private String g_name;
  // -------------------------------------------------------------------
  // Item table
  // -------------------------------------------------------------------  
  /** 상품 등록 번호 **/
  private int itemno;
  /** 메인 카테고리 번호 **/
  private int grpno;
  /** 상품 이름 **/
  private String item_name;
  /** 상품 재고 **/
  private int item_stock;
  /** 상품 정가 **/
  private int item_price;
  /** 상품 원가 **/
  private int item_cost;
  /** 할인률 **/
  private int discount_rate;
  /** 상품 설명 **/
  private String item_content;
  /** 상품 유형 **/
  private String item_type;
  /** 상품 피부 효과**/
  private String item_effect;
  /** 원산지 **/
  private String item_origin;
  /** 출력 **/
  private String item_visible;
  /** 출력순서 **/
  private int item_visibleno;
  /** 추천수 **/
  private int item_recom;
  /** 조회수 **/
  private int item_view;
  /** 상품 등록 날짜 **/
  private String item_rdate; 
  /** 업로드 파일 */
  private String upfile;
  /** preview 이미지 preview */
  private String thumb;
  /** 저장된 파일 사이즈 */
  private long fsize;
    /** 이미지 MultipartFile */
  private MultipartFile upfileMF;
  
  public Itemgrp_Item_join() {
    
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

    public MultipartFile getUpfileMF() {
      return upfileMF;
    }

    public void setUpfileMF(MultipartFile upfileMF) {
      this.upfileMF = upfileMF;
    }
  
  public Itemgrp_Item_join(int itemno, int grpno, String item_name, int item_stock, int item_price, int item_cost,
      int discount_rate, String item_content, String item_type, String item_effect, String item_origin,
      String item_visible, int item_visibleno, int item_recom, int item_view, String item_rdate) {
    this.itemno = itemno;
    this.grpno = grpno;
    this.item_name = item_name;
    this.item_stock = item_stock;
    this.item_price = item_price;
    this.item_cost = item_cost;
    this.discount_rate = discount_rate;
    this.item_content = item_content;
    this.item_type = item_type;
    this.item_effect = item_effect;
    this.item_origin = item_origin;
    this.item_visible = item_visible;
    this.item_visibleno = item_visibleno;
    this.item_recom = item_recom;
    this.item_view = item_view;
    this.item_rdate = item_rdate;
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

  public int getG_grpno() {
    return g_grpno;
  }

  public void setG_grpno(int g_grpno) {
    this.g_grpno = g_grpno;
  }

  public String getG_name() {
    return g_name;
  }

  public void setG_name(String g_name) {
    this.g_name = g_name;
  }


}
