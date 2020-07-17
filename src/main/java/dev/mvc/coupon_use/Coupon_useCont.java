package dev.mvc.coupon_use;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.coupon.CouponVO;

@Controller
public class Coupon_useCont {
  
  @Autowired
  @Qualifier("dev.mvc.coupon_use.Coupon_useProc")
  private Coupon_useProcInter coupon_useProc;
  
  
  public Coupon_useCont() {
    System.out.println("--> Coupon_useCont created.");
  }
  
  //http://localhost:9090/team4/coupon_use/create.do
  /**
   * ��� ��
   * @return
   */
  @RequestMapping(value="/coupon_use/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/coupon_use/create"); // webapp/coupon_use/create.jsp
    return mav;
  }
  
 //http://localhost:9090/team4/coupon_use/create.do
 /**
  * ��� ó�� -> �Ⱦ�
  * @param couponVO
  * @return
  */
 @RequestMapping(value="/coupon_use/create.do", method=RequestMethod.POST )
 public ModelAndView create(Coupon_useVO coupon_useVO) {
   ModelAndView mav = new ModelAndView();
   
   //int cnt = this.coupon_useProc.create(coupon_useVO);

   mav.setViewName("redirect:/coupon_use/list.jsp"); // jsp���ϸ��� �ش� �ּҷ� �Ķ���� ����
   return mav;
 }

 /**
  * �ֹ� ����Ʈ
  * @return
  */
/* @RequestMapping(value="/coupon_use/list.do", method=RequestMethod.GET)
 public ModelAndView list(){
   ModelAndView mav = new ModelAndView();
   
   List<Coupon_useVO> list = this.coupon_useProc.list();    
   mav.addObject("list", list);
   mav.setViewName("/coupon_use/list"); // webapp/coupon_use/list.jsp
   
   return mav; // forward
 }*/
 @RequestMapping(value="/coupon_use/list.do", method=RequestMethod.GET)
 public ModelAndView list_paging(@RequestParam(value="nowPage", defaultValue="1") int nowPage){
   ModelAndView mav = new ModelAndView();
   
   // ���ڿ� ���ڿ� Ÿ���� �����ؾ������� Obejct ���
   HashMap<String, Object> map = new HashMap<String, Object>();
   map.put("nowPage", nowPage); // �������� ����� ���ڵ��� ������ �����ϱ� ���� ���
   
   List<CouponVO> list = this.coupon_useProc.list_by_coupon_useno_paging(map);    
   mav.addObject("list", list);
   mav.setViewName("/coupon_use/list"); // webapp/coupon_use/list.jsp
   
   // �� ���ڵ� ����
   int search_count = this.coupon_useProc.search_count();
   mav.addObject("search_count", search_count);
   
   /*
    * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
    * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
    * 
    * @param listFile ��� ���ϸ� 
    * @param cateno ī�װ���ȣ 
    * @param search_count �˻�(��ü) ���ڵ�� 
    * @param nowPage     ���� ������
    * @param word �˻���
    * @return ����¡ ���� ���ڿ�
    */ 
   String paging = this.coupon_useProc.pagingBox("list.do",search_count, nowPage);
   mav.addObject("paging", paging);
 
   mav.addObject("nowPage", nowPage);
   
   return mav; // forward
 }
 
}
