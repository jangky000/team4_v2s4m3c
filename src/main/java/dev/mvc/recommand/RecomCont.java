package dev.mvc.recommand;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.item.ItemProcInter;
import dev.mvc.item.ItemVO;
import dev.mvc.item.Itemgrp_Item_VO;
import dev.mvc.itemgrp.ItemgrpProcInter;
import dev.mvc.itemgrp.ItemgrpVO;

@Controller
public class RecomCont {
  @Autowired
  @Qualifier("dev.mvc.itemgrp.ItemgrpProc")
  private ItemgrpProcInter itemgrpProc;
  
  @Autowired
  @Qualifier("dev.mvc.item.ItemProc")
  private ItemProcInter itemProc;
  
  
  @Autowired
  @Qualifier("dev.mvc.recommand.RecomProc")
  private RecomProcInter recomProc;
  
  public RecomCont() {
    System.out.println("--> RecomCon created");
  }
  
  /**
   * ����� 
   * @return
   */
  @RequestMapping(value="/recommand/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();    
    
    List<ItemgrpVO> grplist = this.itemgrpProc.list();
    mav.addObject("grplist", grplist);
    
    List<Itemgrp_Item_VO> itemlist = this.itemProc.list_all();
    mav.addObject("itemlist", itemlist);
    
    List<RecomVO> list = this.recomProc.list();
    mav.addObject("list", list);
    
    mav.setViewName("/recommand/create");
    
    return mav;
  }
  
  /**
   * ���ó��
   * @return
   */
  @RequestMapping(value="/recommand/create.do", method = RequestMethod.POST)
  public ModelAndView create(RecomVO recomVO) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.recomProc.create(recomVO); // ��� ó��
    mav.addObject("cnt", cnt);  // request�� ����, request.setAttribute("cnt", cnt)
    
    mav.setViewName("/recommand/create_msg");
    
    return mav;
  }
  
  /**
   * ��ü ��� 
   * @return
   */
  @RequestMapping(value="/recommand/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    
    List<RecomVO> list = this.recomProc.list();
    mav.addObject("list", list);
    
    mav.setViewName("/recommand/list");
    
    return mav;
  }
  
  /**
   * ��ȸ 
   * @return
   */
  @RequestMapping(value="/recommand/read.do", method = RequestMethod.GET)
  public ModelAndView read(int recomno) {
    ModelAndView mav = new ModelAndView();
    
    RecomVO recomVO = this.recomProc.read(recomno);
    mav.addObject("recomVO", recomVO);   
     
    mav.setViewName("/recommand/read");
    
    return mav;
  }
  
  /**
   * ������
   * @param recomno ��ȸ�� ī�װ� ��ȣ
   * @return
   */
  @RequestMapping(value="/recommand/update.do", method=RequestMethod.GET )
  public ModelAndView update(int recomno) {
    ModelAndView mav = new ModelAndView();
    
    RecomVO recomVO = this.recomProc.read(recomno);
    mav.addObject("recomVO", recomVO);   
    
    mav.setViewName("/recommand/update"); 
    return mav; // forward
  }
  
  // http://localhost:9090/resort/categrp/update.do
  /**
   * ���� ó��
   * @param categrpVO
   * @return
   */
  @RequestMapping(value="/recommand/update.do", method=RequestMethod.POST )
  public ModelAndView update(RecomVO recomVO) {
    ModelAndView mav = new ModelAndView();
    
    ItemVO itemVO = this.itemProc.read(recomVO.getItemno());
    mav.addObject("item_name", itemVO.getItem_name());
    mav.addObject("itemno", itemVO.getItemno());
    
    int cnt = this.recomProc.update(recomVO);
    mav.addObject("cnt", cnt);

    mav.setViewName("/recommand/update_msg"); // webapp/categrp/update_msg.jsp
    
    return mav;
  }

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

}
