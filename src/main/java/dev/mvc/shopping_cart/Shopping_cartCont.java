package dev.mvc.shopping_cart;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Shopping_cartCont {
  
  @Autowired
  @Qualifier("dev.mvc.porder.Shopping_cartProc")
  private Shopping_cartProcInter shopping_cartProc;

  public Shopping_cartCont() {
    System.out.println("--> Shopping_cartCont created.");
  }
  
  //http://localhost:9090/team4/shopping_cart/create.do
  /**
   * 등록 폼
   * @return
   */
  @RequestMapping(value="/shopping_cart/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/shopping_cart/create"); // webapp/shopping_cart/create.jsp
    return mav;
  }
  
 //http://localhost:9090/team4/shopping_cart/create.do
 /**
  * 등록 처리
  * @param porderVO
  * @return
  */
 @RequestMapping(value="/shopping_cart/create.do", method=RequestMethod.POST )
 public ModelAndView create(HttpSession session, Shopping_cartVO shopping_cartVO) {
   ModelAndView mav = new ModelAndView();
   
   int memno = 1;
   
   // 쇼핑 카트에 동일한 아이템이 있으면 특정 수량만큼 증가 -> memno + itemno로 검색
   // read
   HashMap map = new HashMap<Object, Object>();
   map.put("memno", memno);
   map.put("itemno", shopping_cartVO.getItemno());
   String shopping_cartno = this.shopping_cartProc.shopping_cart_check(map);
   // redirect 가 아니라 -> ajax 응답 형태로 바꿔야 할 듯
   
   if(shopping_cartno != null) {
     map.clear();
     map.put("shopping_cartno", shopping_cartno);
     map.put("quantity_up_num", shopping_cartVO.getQuantity());
     int quantity_cnt = this.shopping_cartProc.quantity_up_num(map);
     /*if(quantity_cnt == 1) {
       System.out.println("중복 상품 " +shopping_cartVO.getQuantity()  + "개 증가");
     }*/
     mav.setViewName("redirect:/shopping_cart/list.do");
     return mav;
   }
   
   shopping_cartVO.setMemno(memno);
   int cnt = this.shopping_cartProc.create(shopping_cartVO);
   
   mav.addObject("cnt", cnt); // redirect parameter 적용
   
   //mav.addObject("url", "create_msg"); // 파일명: create_msg.jsp, redirect parameter 적용
   //mav.setViewName("redirect:/shopping_cart/msg.do"); // jsp파일명을 해당 주소로 파라미터 전달
   mav.setViewName("redirect:/shopping_cart/list.do");
   return mav;
 }
 
//http://localhost:9090/team4/shopping_cart/list.do
 /**
  * 장바구니 리스트
  * @return
  */
 @RequestMapping(value="/shopping_cart/list.do", method=RequestMethod.GET)
 public ModelAndView list(HttpSession session){
   ModelAndView mav = new ModelAndView();
   
   // 세션 아이디 값이 없으면 -> 로그인 페이지로 이동 
   
   // 세션이 적용되면 세션 값을 받아와서 사용하기
   // int memno = (Integer)session.getAttribute("memno");
   int memno = 1;
   
   // 아이템 정보가 나와야함, 어떤 정보? 
   // 썸네일 이미지, 이름, 가격, 할인율, 
   
   // List<Shopping_cartVO> list = this.shopping_cartProc.list();
   List<Shop_item_grpVO> list = this.shopping_cartProc.list_join(memno);
   
   mav.addObject("list", list);
   mav.setViewName("/shopping_cart/list"); // webapp/shopping_cart/list.jsp
   
   return mav; // forward
 }
 
  //http://localhost:9090/team4/shopping_cart/quantity_down.do?shopping_cartno=1
  /**
   * 장바구니 수량 하향--
   * @param shopping_cartno 장바구니 번호
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/shopping_cart/quantity_down.do", method=RequestMethod.GET,
                              produces="text/plain;charset=UTF-8") // 한글 깨짐 방지
  public String quantity_down(int shopping_cartno) {
    
    int cnt = this.shopping_cartProc.quantity_down(shopping_cartno);  // 수량 하향 처리
    
    Shopping_cartVO shopping_cartVO = this.shopping_cartProc.read(shopping_cartno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    json.put("quantity", shopping_cartVO.getQuantity());
    
    return json.toString();
  }
  
  //http://localhost:9090/team4/shopping_cart/quantity_up.do?shopping_cartno=1
  /**
   * 장바구니 수량 상향++
   * @param shopping_cartno 장바구니 번호
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/shopping_cart/quantity_up.do", method=RequestMethod.GET, 
                              produces="text/plain;charset=UTF-8")
  public String quantity_up(int shopping_cartno) {
    
    int cnt = this.shopping_cartProc.quantity_up(shopping_cartno);  // 수량 하향 처리
    
    Shopping_cartVO shopping_cartVO = this.shopping_cartProc.read(shopping_cartno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    json.put("quantity", shopping_cartVO.getQuantity());
    
    return json.toString();
  }  
 
//http://localhost:9090/team4/shopping_cart/delete.do
 /**
  * 장바구니 상품 삭제 처리, GET 방식, 세션 확인해서 삭제하기
  * @param memberVO
  * @return
  */
 @RequestMapping(value="/shopping_cart/delete.do", method=RequestMethod.GET)
 public ModelAndView delete(int[] shopping_cartno){
   ModelAndView mav = new ModelAndView();
   int cnt = 0;
   for(int i=0; i<shopping_cartno.length; i++) {
     cnt= this.shopping_cartProc.delete(shopping_cartno[i]);
   }
   mav.addObject("cnt", cnt);
   mav.setViewName("redirect:/shopping_cart/list.do");
   
   return mav;
 }
 
 //http://localhost:9090/team4/shopping_cart/msg.do?
 /**
  * 메시지
  * @param url
  * @return
  */
 @RequestMapping(value="/shopping_cart/msg.do", method=RequestMethod.GET)
 public ModelAndView delete_msg(String url){
   ModelAndView mav = new ModelAndView();
   
   // 등록 처리 메시지: create_msg -> /shopping_cart/create_msg.jsp
   // 수정 처리 메시지: update_msg -> /shopping_cart/update_msg.jsp
   // 삭제 처리 메시지: delete_msg -> /shopping_cart/delete_msg.jsp
   mav.setViewName("/shopping_cart/" + url); // forward
   // cnt도 계속 get 방식 파라미터로 포워딩됨
   
   return mav; // forward
 }

 
}
