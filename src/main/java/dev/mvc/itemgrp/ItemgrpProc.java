package dev.mvc.itemgrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
 
@Component("dev.mvc.itemgrp.ItemgrpProc")
public class ItemgrpProc implements ItemgrpProcInter {
  @Autowired
  private ItemgrpDAOInter itemgrpDAO;
  
 // public int create(ItemgrpVO itemgrpVO);
  @Override
  public int create(ItemgrpVO itemgrpVO) {
    int cnt =0;
    cnt = this.itemgrpDAO.create(itemgrpVO);
    return cnt;
  }
  
  @Override
  public List<ItemgrpVO> list(){
    List<ItemgrpVO> list = null;
    list = this.itemgrpDAO.list();
    return list;
  }
  @Override
  public ItemgrpVO read(int grpno) {
    ItemgrpVO itemgrpVO = null;
    itemgrpVO = this.itemgrpDAO.read(grpno);
    return itemgrpVO;
  }
  
  @Override
  public int update(ItemgrpVO itemgrpVO) {
    int cnt = 0;
    cnt = this.itemgrpDAO.update(itemgrpVO);  
    return cnt;    
  }
  
  @Override
  public int delete(int grpno) {
    int cnt = 0;
    cnt = this.itemgrpDAO.delete(grpno);   
    return cnt;  
  }
  
  @Override
  public int update_seqno_up(int grpno) {
    int cnt = 0;
    cnt = this.itemgrpDAO.update_seqno_up(grpno);
    return cnt;  
  }
  
  @Override
  public int update_seqno_down(int grpno) {
    int cnt = 0;
    cnt = this.itemgrpDAO.update_seqno_down(grpno);
    return cnt;  
  }
  
  @Override
  public int update_visible(ItemgrpVO itemgrpVO) {
    int cnt = 0;
    cnt = this.itemgrpDAO.update_visible(itemgrpVO);  
    return cnt;  
  }
  

 
  
}
