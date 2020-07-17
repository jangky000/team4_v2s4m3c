package dev.mvc.coupon_issue;

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
public class Coupon_issueCont {
  
  @Autowired
  @Qualifier("dev.mvc.coupon_issue.Coupon_issueProc")
  private Coupon_issueProcInter coupon_issueProc;
  
  
  public Coupon_issueCont() {
    System.out.println("--> Coupon_issueCont created.");
  }
  
  //http://localhost:9090/team4/coupon_issue/create.do
  /**
   * ��� ��
   * @return
   */
  @RequestMapping(value="/coupon_issue/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/coupon_issue/create"); // webapp/coupon_issue/create.jsp
    return mav;
  }
  
 //http://localhost:9090/team4/coupon_issue/create.do
 /**
  * ��� ó��
  * @param couponVO
  * @return
  */
 @RequestMapping(value="/coupon_issue/create.do", method=RequestMethod.POST )
 public ModelAndView create(Coupon_issueVO coupon_issueVO) {
   ModelAndView mav = new ModelAndView();
   
   int cnt = this.coupon_issueProc.create(coupon_issueVO);

   mav.setViewName("redirect:/coupon_issue/list.jsp"); // jsp���ϸ��� �ش� �ּҷ� �Ķ���� ����
   return mav;
 }

 /**
  * ���� ���� ����Ʈ
  * @return
  */
/* @RequestMapping(value="/coupon_issue/list.do", method=RequestMethod.GET)
 public ModelAndView list(){
   ModelAndView mav = new ModelAndView();
   
   List<Coupon_issueVO> list = this.coupon_issueProc.list();    
   mav.addObject("list", list);
   mav.setViewName("/coupon_issue/list"); // webapp/coupon_issue/list.jsp
   
   return mav; // forward
 }*/
 @RequestMapping(value="/coupon_issue/list.do", method=RequestMethod.GET)
 public ModelAndView list_paging(@RequestParam(value="nowPage", defaultValue="1") int nowPage){
   ModelAndView mav = new ModelAndView();
   
   // ���ڿ� ���ڿ� Ÿ���� �����ؾ������� Obejct ���
   HashMap<String, Object> map = new HashMap<String, Object>();
   map.put("nowPage", nowPage); // �������� ����� ���ڵ��� ������ �����ϱ� ���� ���
   
   List<CouponVO> list = this.coupon_issueProc.list_by_coupon_issueno_paging(map);    
   mav.addObject("list", list);
   mav.setViewName("/coupon_issue/list"); // webapp/coupon_issue/list.jsp
   
   // �� ���ڵ� ����
   int search_count = this.coupon_issueProc.search_count();
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
   String paging = this.coupon_issueProc.pagingBox("list.do",search_count, nowPage);
   mav.addObject("paging", paging);
 
   mav.addObject("nowPage", nowPage);
   
   return mav; // forward
 }
 
}
