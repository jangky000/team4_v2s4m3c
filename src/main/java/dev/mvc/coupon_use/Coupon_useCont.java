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
   * 등록 폼
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
  * 등록 처리 -> 안씀
  * @param couponVO
  * @return
  */
 @RequestMapping(value="/coupon_use/create.do", method=RequestMethod.POST )
 public ModelAndView create(Coupon_useVO coupon_useVO) {
   ModelAndView mav = new ModelAndView();
   
   //int cnt = this.coupon_useProc.create(coupon_useVO);

   mav.setViewName("redirect:/coupon_use/list.jsp"); // jsp파일명을 해당 주소로 파라미터 전달
   return mav;
 }

 /**
  * 주문 리스트
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
   
   // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
   HashMap<String, Object> map = new HashMap<String, Object>();
   map.put("nowPage", nowPage); // 페이지에 출력할 레코드의 범위를 산출하기 위해 사용
   
   List<CouponVO> list = this.coupon_useProc.list_by_coupon_useno_paging(map);    
   mav.addObject("list", list);
   mav.setViewName("/coupon_use/list"); // webapp/coupon_use/list.jsp
   
   // 총 레코드 갯수
   int search_count = this.coupon_useProc.search_count();
   mav.addObject("search_count", search_count);
   
   /*
    * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
    * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
    * 
    * @param listFile 목록 파일명 
    * @param cateno 카테고리번호 
    * @param search_count 검색(전체) 레코드수 
    * @param nowPage     현재 페이지
    * @param word 검색어
    * @return 페이징 생성 문자열
    */ 
   String paging = this.coupon_useProc.pagingBox("list.do",search_count, nowPage);
   mav.addObject("paging", paging);
 
   mav.addObject("nowPage", nowPage);
   
   return mav; // forward
 }
 
}
