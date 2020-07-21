package dev.mvc.itemgrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ItemgrpCont {
  @Autowired
  @Qualifier("dev.mvc.itemgrp.ItemgrpProc")
  private ItemgrpProcInter itemgrpProc;
  
  public ItemgrpCont() {
    System.out.println(" --> ItemgrpCont created");
  }

//http://localhost:9090/team4/itemgrp/itemgrp.do
 /**
  * ��� ��
  * @return
  */
 @RequestMapping(value="/itemgrp/create.do", method=RequestMethod.GET )
 public ModelAndView create() {
   ModelAndView mav = new ModelAndView();
   mav.setViewName("/itemgrp/create"); // webapp/itemgrp/create.jsp
   
   return mav; // forward
 }
  
//http://localhost:9090/team4/itemgrp/create.do
 /**
  * ��� ó��
  * @param itemgrpVO
  * @return
  */
 @RequestMapping(value="/itemgrp/create.do", method=RequestMethod.POST )
 public ModelAndView create(ItemgrpVO itemgrpVO) {
   ModelAndView mav = new ModelAndView();
   
   int cnt = this.itemgrpProc.create(itemgrpVO);// ��� ó��
   mav.addObject("cnt", cnt); // request�� ����, request.setAttribute("cnt", cnt)
   
   mav.setViewName("/itemgrp/create_msg"); // webapp/categrp/create_msg.jsp

   return mav; // forward
 }
 
 /**
  * ��ü ���
  * @return
  */
 @RequestMapping(value="/itemgrp/list.do", method=RequestMethod.GET )
 public ModelAndView list() {
   ModelAndView mav = new ModelAndView();
   
   List<ItemgrpVO> list = this.itemgrpProc.list();
   mav.addObject("list",list);
   
   mav.setViewName("/itemgrp/list");
   
   return mav;  
 }
 
  // http://localhost:9090/team4/itemgrp/read_update.do?grpno=1
 /**
  * ��ȸ + ������
  * @param grpno ��ȸ�� ī�װ� ��ȣ
  * @return
  */
 @RequestMapping(value="/itemgrp/read_update.do", method=RequestMethod.GET )
 public ModelAndView read_update(int grpno) {
   ModelAndView mav = new ModelAndView();

   ItemgrpVO itemgrpVO = this.itemgrpProc.read(grpno);
   mav.addObject("itemgrpVO", itemgrpVO);
   
   List<ItemgrpVO> list = this.itemgrpProc.list();
   mav.addObject("list", list);

   mav.setViewName("/itemgrp/read_update");
   return mav; // forward
 }
 
 // http://localhost:9090/team4/itemgrp/read_update.do?grpno=1
 /**
  * ��ȸ + ������
  * @param categrpno ��ȸ�� ī�װ� ��ȣ
  * @return
  */
 @RequestMapping(value="/itemgrp/read_delete.do", method=RequestMethod.GET )
 public ModelAndView read_delete(int grpno) {
   ModelAndView mav = new ModelAndView();
   
   ItemgrpVO itemgrpVO = this.itemgrpProc.read(grpno);
   mav.addObject("itemgrpVO", itemgrpVO);
   
   List<ItemgrpVO> list = this.itemgrpProc.list();
   mav.addObject("list", list);

   mav.setViewName("/itemgrp/read_delete"); 
   return mav;
 }
 
   /**
    * ����
    * @param grpno ��ȸ�� ī�װ� ��ȣ
    * @return
    */
   @RequestMapping(value="/itemgrp/delete.do", method=RequestMethod.POST )
   public ModelAndView delete(int grpno) {
     ModelAndView mav = new ModelAndView();
     
     ItemgrpVO itemgrpVO = this.itemgrpProc.read(grpno);
     mav.addObject("itemgrpVO", itemgrpVO);
      
     int cnt = this.itemgrpProc.delete(grpno);
     mav.addObject("cnt", cnt);
     
     mav.setViewName("/itemgrp/delete_msg");

     return mav;
   }
   
   /**
    * �켱���� ���� up 10 �� 1
    * @param grpno ��ȸ�� ī�װ� ��ȣ
    * @return
    */
   @RequestMapping(value="/itemgrp/update_seqno_up.do", method=RequestMethod.GET )
   public ModelAndView update_seqno_up(int grpno) {
     ModelAndView mav = new ModelAndView();
     
     ItemgrpVO itemgrpVO = this.itemgrpProc.read(grpno);
     mav.addObject("itemgrpVO", itemgrpVO);
     
     int cnt = this.itemgrpProc.update_seqno_up(grpno);
     mav.addObject("cnt", cnt);

     mav.setViewName("redirect:/itemgrp/list.do");
     return mav;
   }  
   
   /**
    * �켱���� ���� up 1 �� 10
    * @param grpno ��ȸ�� ī�װ� ��ȣ
    * @return
    */
   @RequestMapping(value="/itemgrp/update_seqno_down.do", method=RequestMethod.GET )
   public ModelAndView update_seqno_down(int grpno) {
     ModelAndView mav = new ModelAndView();
     
     ItemgrpVO itemgrpVO = this.itemgrpProc.read(grpno);
     mav.addObject("itemgrpVO", itemgrpVO);
     
     int cnt = this.itemgrpProc.update_seqno_down(grpno);
     mav.addObject("cnt", cnt);  // request ��ü�� ����

     mav.setViewName("redirect:/itemgrp/list.do");
     return mav;
   }  

  
  
  
}
