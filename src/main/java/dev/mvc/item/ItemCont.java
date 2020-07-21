package dev.mvc.item;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.itemgrp.ItemgrpProcInter;
import dev.mvc.itemgrp.ItemgrpVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class ItemCont {

  @Autowired
  @Qualifier("dev.mvc.itemgrp.ItemgrpProc")
  private ItemgrpProcInter itemgrpProc;
  
  @Autowired
  @Qualifier("dev.mvc.item.ItemProc")
  private ItemProcInter itemProc;
  
  public ItemCont() {
    System.out.println("--> ItemCont created");
  }
  
  /**
   * ��� ��
   * @return
   */
  @RequestMapping(value="/item/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
 
    List<ItemgrpVO> grplist = this.itemgrpProc.list();
    for(ItemgrpVO lst: grplist) {
      System.out.println(lst.getName());
    }
    mav.addObject("grplist",grplist);

    mav.setViewName("/item/create"); 
    
    return mav;
  } 

  /**
   * ��� ó��
   * @param cateVO
   * @return
   */
  @RequestMapping(value="/item/create.do", method=RequestMethod.POST )
  public ModelAndView create(HttpServletRequest request, ItemVO itemVO) {
    ModelAndView mav = new ModelAndView();
    // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    String upfile = "";     // main image
    String thumb = ""; // preview image
        
    String upDir = Tool.getRealPath(request, "/item/storage/main_images"); // ���� ���
    // ���� ������ ����� fnamesMF ��ü�� ������.
    MultipartFile mf = itemVO.getUpfileMF();
    long fsize = mf.getSize();  // ���� ũ��
    if (fsize > 0) { // ���� ũ�� üũ
      // mp3 = mf.getOriginalFilename(); // ���� ���ϸ�, spring.jpg
      // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�, spring.jsp, spring_1.jpg...
      upfile = Upload.saveFileSpring(mf, upDir); 
      
      if (Tool.isImage(upfile)) { // �̹������� �˻�
        // thumb �̹��� ������ ���ϸ� ���ϵ�, width: 120, height: 80
        thumb = Tool.preview(upDir, upfile, 250, 200); 
      }
      
    }    
    // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    // �١ڡ١� ip �˻絵 �������� �١ڡ١�
    // itemVO.setIp(request.getRemoteAddr()); // ������ IP
    
    // PK return ��
    itemVO.setUpfile(upfile);
    itemVO.setThumb(thumb);
    itemVO.setFsize(fsize);
    
    int cnt = this.itemProc.create(itemVO);
    mav.addObject("cnt", cnt); // request�� ����
    System.out.println("cnt: " + cnt);
    
    ItemgrpVO itemgrpVO = this.itemgrpProc.read(itemVO.getGrpno());
    mav.addObject("itemgrpVO", itemgrpVO);
    
    mav.setViewName("/item/create_msg");
    return mav;
  }
  
  /**
   * ������ �ȵ� ���� ��ü ���
   * @return
   */
  /*
   * @RequestMapping(value="/item/list.do", method=RequestMethod.GET ) public
   * ModelAndView list() { ModelAndView mav = new ModelAndView();
   * 
   * List<ItemVO> list = this.itemProc.list(); mav.addObject("list", list); //
   * request.setAttribute("list", list);
   * 
   * mav.setViewName("/item/list"); return mav; }
   */
  
  // http://localhost:9090/team4/item/list_all.do
  /**
   * itemgrp + item join ��ü �������� ���
   * @return
   */
  @RequestMapping(value="/item/list_all.do", method=RequestMethod.GET )
  public ModelAndView list_all() {
    ModelAndView mav = new ModelAndView();
    
    List<Itemgrp_Item_VO> list = this.itemProc.list_all();
    mav.addObject("list", list); // request.setAttribute("list", list);

    mav.setViewName("/item/list_all"); // webapp/item/list_all.jsp
    return mav;
  }
  
  // http://localhost:9090/team4/item/list_join.do
  /**
   * categrp + cate join ��ü ���
   * @return
   */
  @RequestMapping(value="/item/list_join.do", method=RequestMethod.GET )
  public ModelAndView list_join() {
    ModelAndView mav = new ModelAndView();
    
    List<Itemgrp_Item_join> list = this.itemProc.list_join();
    mav.addObject("list", list);

    mav.setViewName("/item/list_join"); // webapp/cate/list_join_by_categrpno.jsp
    return mav;
  }
  
  // http://localhost:9090/team4/item/list_join_by_grpno.do?grpno=1
  /**
   * categrp + cate join ��ü ���
   * @return
   */
  @RequestMapping(value="/item/list_join_by_grpno.do", method=RequestMethod.GET )
  public ModelAndView list_join_by_grpno(int grpno) {
    ModelAndView mav = new ModelAndView();
    
    ItemgrpVO itemgrpVO = this.itemgrpProc.read(grpno);
    mav.addObject("itemgrpVO", itemgrpVO);

    List<Itemgrp_Item_join> list = this.itemProc.list_join_by_grpno(grpno);
    mav.addObject("list", list);

    mav.setViewName("/item/list_join_by_grpno"); // webapp/cate/list_join_by_categrpno.jsp
    return mav;
  }
  

  /**
   * ��� + ����¡ ����
   * http://localhost:9090/team4/item/list_by_grpno_paging.do?grpno=1
   * @param cateno
   * @param word
   * @param nowPage
   * @return
   */
  @RequestMapping(value = "/item/list_by_grpno_paging.do", 
                                       method = RequestMethod.GET)
  public ModelAndView list_by_grpno_paging(
      @RequestParam(value="grpno", defaultValue="1") int grpno,
      @RequestParam(value="nowPage", defaultValue="1") int nowPage
      ) {
    
    ModelAndView mav = new ModelAndView();
    
    // ���ڿ� ���ڿ� Ÿ���� �����ؾ������� Obejct ���
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("grpno", grpno); // #{grpno}
    map.put("nowPage", nowPage);  // �������� ����� ���ڵ��� ������ �����ϱ����� ���     
    
    // �˻� ���
    List<Itemgrp_Item_join> list = itemProc.list_by_grpno_paging(map);
    mav.addObject("list", list);
    
    // �˻��� ���ڵ� ����
     int total_count = itemProc.total_count();
     mav.addObject("total_count", total_count);
    
    ItemgrpVO itemgrpVO = itemgrpProc.read(grpno);
    mav.addObject("itemgrpVO", itemgrpVO);

    /*
     * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
     * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
     * 
     * @param listFile ��� ���ϸ� 
     * @param cateno ī�װ���ȣ 
     * @param search_count �˻�(��ü) ���ڵ�� 
     * @param nowPage     ���� ������
     * @return ����¡ ���� ���ڿ�
     */ 
    //String paging = itemProc.pagingBox("list.do", grpno, search_count, nowPage);
    String paging = itemProc.pagingBox("list_by_grpno_paging.do", grpno, total_count, nowPage);
    mav.addObject("paging", paging);
    System.out.println("page: "+ paging);
  
    mav.addObject("nowPage", nowPage);

    // �����
    //mav.setViewName("/item/list_by_grpno_paging");
    
    // ���̺���
    mav.setViewName("/item/list_by_grpno_paging_gallery");
    
    return mav;
  }    
  
  /**
   * ��ȸ��
   * @param itemno ��ȸ�� ��ǰ��ȣ
   * @return
   */
  @RequestMapping(value="/item/read.do", method=RequestMethod.GET )
  public ModelAndView read(int itemno) {
    
    ModelAndView mav = new ModelAndView();
    
    ItemVO itemVO = this.itemProc.read(itemno);
    mav.addObject("itemVO", itemVO);

    mav.setViewName("/item/read"); // webapp/cate/read_update.jsp
    return mav; // forward
  }

  /**
   * ������
   * @param itemno ��ȸ�� ī�װ� ��ȣ
   * @return
   */
  @RequestMapping(value="/item/update.do", method=RequestMethod.GET )
  public ModelAndView update(int itemno) {
    
    ModelAndView mav = new ModelAndView();   
    
    ItemVO itemVO = this.itemProc.read(itemno);
    mav.addObject("itemVO", itemVO);
    
    mav.setViewName("/item/update"); 
    return mav; // forward
  }
  
  /**
   * ���� ó��
   * @param itemVO
   * @return
   */
  @RequestMapping(value="/item/update.do", method=RequestMethod.POST )
  public ModelAndView update(ItemVO itemVO) {
    ModelAndView mav = new ModelAndView();
    
    ItemgrpVO itemgrpVO = this.itemgrpProc.read(itemVO.getGrpno());
    mav.addObject("itemgrp_name", itemgrpVO.getName());
    mav.addObject("grpno", itemgrpVO.getGrpno());
    
    int cnt = this.itemProc.update(itemVO);
    mav.addObject("cnt", cnt); // request�� ����
    
    if (cnt == 1) {
      mav.setViewName("redirect:/item/list_all.do"); // spring ��ȣ��
    } else { 
      mav.setViewName("/item/update_msg"); // webapp/item/update_msg.jsp
    }
    
    return mav;
  }
  
  /**
   * ���� ������
   * @param itemno ��ȸ�� ī�װ� ��ȣ
   * @return
   */
  @RequestMapping(value="/item/update_image.do", method=RequestMethod.GET )
  public ModelAndView update_image(int itemno) {
    
    ModelAndView mav = new ModelAndView();   
    
    ItemVO itemVO = this.itemProc.read(itemno);
    System.out.println(itemVO.getFsize());
    mav.addObject("itemVO", itemVO);
    
    mav.setViewName("/item/update_image"); 
    return mav; // forward
  }
  
  /**
   * ���� ���� ó��
   * @param cateVO
   * @return
   */
  @RequestMapping(value="/item/update_image.do", method=RequestMethod.POST )
  public ModelAndView update_image(HttpServletRequest request, ItemVO itemVO) {
    ModelAndView mav = new ModelAndView();
    // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    String upfile = "";     // main image
    String thumb = ""; // preview image
    long fsize = 0; // fsize
        
    String upDir = Tool.getRealPath(request, "/item/storage/main_images"); // ���� ���
    // ���� ������ ����� fnamesMF ��ü�� ������.
    MultipartFile mf = itemVO.getUpfileMF();
    fsize = mf.getSize();  // ���� ũ��
    if (fsize > 0) { // ���� ũ�� üũ
      // mp3 = mf.getOriginalFilename(); // ���� ���ϸ�, spring.jpg
      // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�, spring.jsp, spring_1.jpg...
      upfile = Upload.saveFileSpring(mf, upDir); 
      
      if (Tool.isImage(upfile)) { // �̹������� �˻�
        // thumb �̹��� ������ ���ϸ� ���ϵ�, width: 120, height: 80
        thumb = Tool.preview(upDir, upfile, 250, 200); 
      }
      
    }    
    // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    // �١ڡ١� ip �˻絵 �������� �١ڡ١�
    // itemVO.setIp(request.getRemoteAddr()); // ������ IP
    
    // PK return ��
    itemVO.setUpfile(upfile);
    itemVO.setThumb(thumb);
    itemVO.setFsize(fsize);
    
    int cnt = this.itemProc.update_image(itemVO);
    mav.addObject("cnt", cnt); // request�� ����
    System.out.println("cnt: " + cnt);
    
    ItemgrpVO itemgrpVO = this.itemgrpProc.read(itemVO.getGrpno());
    mav.addObject("itemgrpVO", itemgrpVO);
    
    mav.setViewName("/item/update_image_msg");
    return mav;
  }
  
  
  /**
   * ������
   * @param itemno ��ȸ�� ī�װ� ��ȣ
   * @return
   */
  @RequestMapping(value="/item/delete.do", method=RequestMethod.GET )
  public ModelAndView delete(int itemno) {
    
    ModelAndView mav = new ModelAndView();
    
    ItemVO itemVO = this.itemProc.read(itemno);
    mav.addObject("itemVO", itemVO);
    
    mav.setViewName("/item/delete"); 
    return mav; // forward
  }
  
   /**
   * ���� ó��
   * @param itemVO
   * @return
   */
  @RequestMapping(value="/item/delete.do", method=RequestMethod.POST )
  public ModelAndView deleteproc(int itemno) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.itemProc.delete(itemno);
    mav.addObject("cnt", cnt); // request�� ����
    
    mav.setViewName("/item/delete_msg"); 
    
    /*
     * if (cnt == 1) { mav.setViewName("redirect:/item/list.do"); // spring ��ȣ�� }
     * else { mav.setViewName("/item/delete_msg"); // webapp/item/update_msg.jsp }
     */
    
    return mav; 
  }
  
  // http://localhost:9090/team4/item/update_seqno_up.do?itemno=1
  /**
   * �켱���� ���� up 10 �� 1
   * @param itemno ��ȸ�� ī�װ� ��ȣ
   * @return
   */
  @RequestMapping(value="/item/update_seqno_up.do", 
                              method=RequestMethod.GET )
  public ModelAndView update_seqno_up(int itemno) {
    ModelAndView mav = new ModelAndView();
    
    ItemVO itemVO = this.itemProc.read(itemno);
    mav.addObject("itemVO", itemVO);

    int cnt = this.itemProc.update_seqno_up(itemno);
    mav.addObject("cnt", cnt);
    
    mav.setViewName("item/list_by_grpno_paging");
    return mav;
  }  
  

  // http://localhost:9090/team4/item/update_seqno_down.do?itemno=1
  /**
   * �켱���� ���� up 10 �� 1
   * @param itemno ��ȸ�� ī�װ� ��ȣ
   * @return
   */
  @RequestMapping(value="/categrp/update_seqno_down.do", 
                              method=RequestMethod.GET )
  public ModelAndView update_seqno_down(int itemno) {
    ModelAndView mav = new ModelAndView();
    
    ItemVO itemVO = this.itemProc.read(itemno);
    mav.addObject("itemVO", itemVO);

    int cnt = this.itemProc.update_seqno_down(itemno);
    mav.addObject("cnt", cnt);

    mav.setViewName("/item/list_by_grpno_paging");
    return mav;
  }  
  
  /**
   * ��� ����� ����
   * @param itemVO
   * @return
   */
  @RequestMapping(value="/item/update_visible.do", 
      method=RequestMethod.GET )
  public ModelAndView update_visible(ItemVO itemVO) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.itemProc.update_visible(itemVO);
    mav.addObject("cnt", cnt);
    
    mav.setViewName("/item/list_by_grpno_paging");     
    return mav;
  }  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
