package dev.mvc.recommand;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Item_Recom_VO_list {
  /** ��ǰ ��� ��ȣ **/
  private int itemno;
  /** ���� ī�װ� ��ȣ **/
  private int grpno;
  /** ��ǰ �̸� **/
  private String item_name;
  /** ��ǰ ��� **/
  private int item_stock;
  /** ��ǰ ���� **/
  private int item_price;
  /** ��ǰ ���� **/
  private int item_cost;
  /** ���η� **/
  private int discount_rate;
  /** ��ǰ ���� **/
  private String item_content;
  /** ��ǰ ���� **/
  private String item_type;
  /** ��ǰ �Ǻ� ȿ��**/
  private String item_effect;
  /** ������ **/
  private String item_origin;
  /** ��� **/
  private String item_visible;
  /** ��¼��� **/
  private int item_visibleno;
  /** ��õ�� **/
  private int item_recom;
  /** ��ȸ�� **/
  private int item_view;
  /** ��ǰ ��� ��¥ **/
  private String item_rdate; 
  /** ���ε� ���� */
  private String upfile;
  /** preview �̹��� preview */
  private String thumb;
  /** ����� ���� ������ */
  private long fsize;
    /** �̹��� MultipartFile */
  private MultipartFile upfileMF;
  
  private List<RecomVO> recom_list;

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

  public List<RecomVO> getRecom_list() {
    return recom_list;
  }

  public void setRecom_list(List<RecomVO> recom_list) {
    this.recom_list = recom_list;
  }  
  
  
}
