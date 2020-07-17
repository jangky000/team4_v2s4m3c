package dev.mvc.porder;

import dev.mvc.item.ItemVO;
import dev.mvc.porder_detail.Porder_detailVO;

/** 내 주문 목록 */
public class Porder_detail_itemVO {

  
  /** porderVO */
  private PorderVO porderVO;
  /** porder_detailVO */
  private Porder_detailVO porder_detailVO;
  /** 주문날짜 */
  private ItemVO itemVO;
  
  // Getter / Setter
  public PorderVO getPorderVO() {
    return porderVO;
  }
  public void setPorderVO(PorderVO porderVO) {
    this.porderVO = porderVO;
  }
  public Porder_detailVO getPorder_detailVO() {
    return porder_detailVO;
  }
  public void setPorder_detailVO(Porder_detailVO porder_detailVO) {
    this.porder_detailVO = porder_detailVO;
  }
  public ItemVO getItemVO() {
    return itemVO;
  }
  public void setItemVO(ItemVO itemVO) {
    this.itemVO = itemVO;
  }
 
  
  
}
