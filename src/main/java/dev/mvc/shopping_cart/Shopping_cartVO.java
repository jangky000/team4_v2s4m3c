package dev.mvc.shopping_cart;

/** �ֹ� */
public class Shopping_cartVO {
  /*
    shopping_cartno             NUMBER(10)          NOT NULL      PRIMARY KEY,
    memno                         NUMBER(10)    NOT NULL,
    itemno                          NUMBER(10)        NOT NULL,
    quantity                         NUMBER(10)       DEFAULT 1    NOT NULL,
 */
  
  /** ��ٱ���no */
  private int shopping_cartno;
  /** ȸ��no */
  private int memno;
  /** ��ǰno */
  private int itemno;
  /** ���� */
  private int quantity;
 
  
  //getter / setter
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
  public int getItemno() {
    return itemno;
  }
  public void setItemno(int itemno) {
    this.itemno = itemno;
  }
  public int getQuantity() {
    return quantity;
  }
  public void setQuantity(int quantity) {
    this.quantity = quantity;
  } 
  
}
