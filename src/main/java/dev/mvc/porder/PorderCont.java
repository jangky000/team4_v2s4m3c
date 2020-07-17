package dev.mvc.porder;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.coupon_issue.Coupon_issueProcInter;
import dev.mvc.coupon_issue.Coupon_issue_joinVO;
import dev.mvc.coupon_use.Coupon_useProcInter;
import dev.mvc.porder_detail.Porder_detailProcInter;
import dev.mvc.porder_detail.Porder_detailVO;
import dev.mvc.shopping_cart.Shop_item_grpVO;
import dev.mvc.shopping_cart.Shopping_cartProcInter;
import dev.mvc.shopping_cart.Shopping_cartVO;


@Controller
public class PorderCont {
  
  @Autowired
  @Qualifier("dev.mvc.porder.PorderProc")
  private PorderProcInter porderProc;
  
  @Autowired
  @Qualifier("dev.mvc.porder_detail.Porder_detailProc")
  private Porder_detailProcInter porder_detailProc;

  @Autowired
  @Qualifier("dev.mvc.porder.Shopping_cartProc")
  private Shopping_cartProcInter shopping_cartProc;
  
  @Autowired
  @Qualifier("dev.mvc.coupon_issue.Coupon_issueProc")
  private Coupon_issueProcInter coupon_issueProc;
  
  @Autowired
  @Qualifier("dev.mvc.coupon_use.Coupon_useProc")
  private Coupon_useProcInter coupon_useProc;
  
  public PorderCont() {
    System.out.println("--> PorderCont created.");
  }
  
  //http://localhost:9090/team4/porder/create.do
  /**
   * 등록 폼
   * @return
   */
  @RequestMapping(value="/porder/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/porder/create"); // webapp/porder/create.jsp
    return mav;
  }
  
  // 나중에 get 방식으로 배열을 받아서(json 방식이나, 쿠팡처럼 item[]=상품번호:개수,로 사용) 사용할 수 있게 수정해야 함, post로만 접근 가능하게 하면 불편함
  //http://localhost:9090/team4/porder/payment.do
  @RequestMapping(value="/porder/payment.do", method=RequestMethod.GET )
  public ModelAndView payment(String[] shopping_cartno) {
    ModelAndView mav = new ModelAndView();
    
    // shopping_cartno를 받는 이유는 세션을 사용하면 로그아웃시 정보가 사라지기 때문
    
    // 디비에 접근하긴 해야할 듯, 조인도 필요할 듯, 계산도 다시해야 할 듯
    // shopping_cart: 카트 번호, 멤버번호, 상품 번호, 수량, 
    // item: 상품 이름, 재고, 가격, 할인정보, 
    // 추가 계산: 상품 총 가격, 상품 총 할인, 쿠폰 할인, 배송비, 결제 금액
    
    //동적 SQL로 한번에 VO 리스트 읽어오기
    //https://zetawiki.com/wiki/%EC%9E%90%EB%B0%94_String_%EB%B0%B0%EC%97%B4%EC%9D%84_int_%EB%B0%B0%EC%97%B4%EB%A1%9C_%EB%B3%80%ED%99%98
    int[] shopping_cartInt = Arrays.stream(shopping_cartno).mapToInt(Integer::parseInt).toArray(); // int 배열로 형변환
    //List<Shopping_cartVO> shopping_cartlist = this.shopping_cartProc.list_by_selected_shopping_cartno(shopping_cartInt);
    int memno = 1;
    List<Shop_item_grpVO> shopping_cartlist = this.shopping_cartProc.list_join_by_selected_shopping_cartno(shopping_cartInt, memno);
    mav.addObject("shopping_cartlist", shopping_cartlist);
    
    PorderVO porderVO = new PorderVO();
    
    // item_price_sum, item_discount_sum, coupon_discount_sum, delivery_fee
    
    int item_price_sum = 0;
    int item_discount_sum = 0;
    
    for(Shop_item_grpVO vo:shopping_cartlist) {
      int quantity = vo.getQuantity();
      int item_price = vo.getItem_price();
      item_price_sum += item_price*quantity;
      item_discount_sum += (Integer)(item_price* vo.getDiscount_rate()/100*quantity);
    }
    porderVO.setItem_price_sum(item_price_sum);
    porderVO.setItem_discount_sum(item_discount_sum);
    
    // int coupon_discount_sum = 2500;
    // porderVO.setCoupon_discount_sum(coupon_discount_sum);
    
    int delivery_fee = 2500;
    porderVO.setDelivery_fee(delivery_fee);
    
    int payment_price  = item_price_sum - item_discount_sum + delivery_fee;
    porderVO.setPayment_price(payment_price);
    
    mav.addObject("porderVO", porderVO);
    
    List<Coupon_issue_joinVO> coupon_list = this.coupon_issueProc.list_by_memno_join_coupon_not_used(memno);
    mav.addObject("coupon_list", coupon_list);
    
    mav.setViewName("/porder/create"); // webapp/porder/create.jsp
    // mav.setViewName("redirect:/index.jsp"); // team4/index.jsp
    return mav;
  }
  
  // 안 쓴다
  // url 길이의 제약이 있는 IE 환경 등에서 json 배열의 크기가 너무 크다면, post로 전송되게 해야 함, json으로 값 묶어서 전송하기
  //http://localhost:9090/team4/porder/payment.do
  /**
   * 등록 폼, 장바구니 리스트에서 넘어옴 -> 안씀
   * @return
   */
/*  @RequestMapping(value="/porder/payment.do", method=RequestMethod.POST )
  public ModelAndView payment_post(String[] shopping_cartno, PorderVO porderVO) {
    ModelAndView mav = new ModelAndView();
    // 디비에 접근하긴 해야할 듯, 조인도 필요할 듯, 계산도 다시해야 할 듯
    // 구매자 정보: 이름, 주소, 이메일, 휴대폰 번호, 
    // shopping_cart: 카트 번호, 멤버번호, 상품 번호, 수량, 
    // item: 상품 이름, 재고, 가격, 할인정보, 
    // 추가 계산: 상품 총 가격, 상품 총 할인, 쿠폰 할인, 배송비, 결제 금액
    
    //동적 SQL로 한번에 VO 리스트 읽어오기
    //https://zetawiki.com/wiki/%EC%9E%90%EB%B0%94_String_%EB%B0%B0%EC%97%B4%EC%9D%84_int_%EB%B0%B0%EC%97%B4%EB%A1%9C_%EB%B3%80%ED%99%98
    int[] shopping_cartInt = Arrays.stream(shopping_cartno).mapToInt(Integer::parseInt).toArray(); // int 배열로 형변환
    //List<Shopping_cartVO> shopping_cartlist = this.shopping_cartProc.list_by_selected_shopping_cartno(shopping_cartInt);
    int memno = 1;
    List<Shop_item_grpVO> shopping_cartlist = this.shopping_cartProc.list_join_by_selected_shopping_cartno(shopping_cartInt, memno);
    mav.addObject("shopping_cartlist", shopping_cartlist); // 아이템 정보를 리스트에 저장해서 같이 보내야 함
    
    // PorderVO porderVO = new PorderVO();
    mav.addObject("porderVO", porderVO);
    mav.setViewName("/porder/create"); // webapp/porder/create.jsp
    return mav;
  }*/
  
 //http://localhost:9090/team4/porder/create.do
 /**
  * 등록 처리 -> 결제 등록
  * @param porderVO
  * @return
  */
 @ResponseBody
 @RequestMapping(value="/porder/create.do", method=RequestMethod.POST , produces="text/plain;charset=UTF-8")
 public String create(String porderJSONString, String porder_detailArrString, String coupon_issueArr, String shopping_cartArr) {
   //ModelAndView mav = new ModelAndView();
   JSONObject result = new JSONObject();
   
   // 재고 확인(나중에 추가)
   // 결제(나중에 추가)
   // 결제 확인(나중에 추가)
   
   // porderJSON
   JSONObject porderJSON = new JSONObject(porderJSONString); // String to JSONObject 형변환 
   // 값 꺼내기
   int memno = porderJSON.getInt("memno");
   int item_price_sum = porderJSON.getInt("item_price_sum");
   int item_discount_sum = porderJSON.getInt("item_discount_sum");
   int coupon_discount_sum = porderJSON.getInt("coupon_discount_sum");
   int delivery_fee = porderJSON.getInt("delivery_fee");
   int payment_price = porderJSON.getInt("payment_price");
   int porder_zip_code = porderJSON.getInt("porder_zip_code");
   String porder_address = porderJSON.getString("porder_address");
   String porder_delivery_request = porderJSON.getString("porder_delivery_request");
   
   PorderVO porderVO = new PorderVO(memno, item_price_sum, item_discount_sum, coupon_discount_sum, delivery_fee, 
       payment_price, "R", porder_zip_code, porder_address, porder_delivery_request);
   
   // 결제 생성
   int cnt = this.porderProc.create(porderVO);
   // 생성된 seqno를 받아오기
   int porderno = porderVO.getPorderno();
   
   if(cnt == 0) {
     System.out.println("결제 생성 실패");
     result.put("result", -1);
     return result.toString();
   }
   
   System.out.println("porder 등록 완료");
   System.out.println("porderno는" + porderno);
   
   // 쿠폰 발급 상태 수정
   // 쿠폰 사용 등록
   // 값 꺼내기
   System.out.println("coupon_issueArr" + coupon_issueArr);
   JSONArray coupon_issueno = new JSONArray(coupon_issueArr);
   int[] coupon_issueInt = new int[coupon_issueno.length()];
   for(int i = 0; i<coupon_issueno.length(); i++) {
     coupon_issueInt[i] = coupon_issueno.getInt(i);
   }
   
   // 쿠폰 발급 업데이트
   HashMap<String, Object> issue_map = new HashMap<String, Object>();
   issue_map.put("cpstatus", "U"); // I: 발급, U: 사용 완료, C: 발급 취소
   issue_map.put("coupon_issueInt", coupon_issueInt); // 배열을 전달
   int issue_cnt  = this.coupon_issueProc.update_list_status(issue_map);
   
   // 쿠폰 사용 등록
   HashMap<String, Object> use_map = new HashMap<String, Object>();
   int use_cnt = 0;
   for(int i = 0; i<coupon_issueInt.length; i++) {
     use_cnt = this.coupon_useProc.create(porderno, coupon_issueInt[i], "U");
   }
   
   // 결제 내역 생성 동적 SQL로 처리 insert select를 사용해서 한번에 처리 -> 상품 금액이 바뀌는 경우 문제가 될 수 있다.
   // 실패 시 결제 생성도 취소
   
   // 주문 상세 등록
   // porder_detailArr
   JSONArray porder_detailArr = new JSONArray(porder_detailArrString); // String to JSONArray 형변환
   
   Porder_detailVO porder_detailVO = new Porder_detailVO();
   for(int i = 0; i < porder_detailArr.length(); i++) {
     // porder_detailVO
     JSONObject porder_detailJSON = porder_detailArr.getJSONObject(i);
     //System.out.println(porder_detailJSON.toString());
     
     // 값 꺼내기
     int itemno = porder_detailJSON.getInt("itemno");
     int quantity = porder_detailJSON.getInt("quantity");
     int detail_item_price_sum = porder_detailJSON.getInt("item_price_sum");
     int detail_item_discount_sum = porder_detailJSON.getInt("item_discount_sum");
     int detail_payment_price = porder_detailJSON.getInt("payment_price");
     
     // 값 입력
     porder_detailVO.setVO(porderno, itemno, quantity, detail_item_price_sum, detail_item_discount_sum, 
         detail_payment_price, "R");
     
     // DB 저장
     cnt = this.porder_detailProc.create(porder_detailVO);
     
     if(cnt == 0) {
       System.out.println("결제 내역 생성 실패");
       // porder 삭제
       // 등록된 porder detail 삭제 -> 동적 sql 로 작성해서 원자성 있게 만들 것 -> insert all 방식을 사용하면 sequence가 증가되지 않는 문제점이 있음 -> 어떻게 해결할 것?
       result.put("result", -1);
       return result.toString();
     }
     
   }
   System.out.println("porder detail 등록 완료");
   // 장바구니 번호를 받아와서, 장바구니 번호를 동적으로 WHERE문 안에 넣고 장바구니와 상품을 조인해서 가격을 입력
   // 결제 도중에 상품 가격이 바뀌면? 합산해서 총 금액과 달라지면 -> 상품 가격이 달라졌다고 처리?
   
   // 정보가 많으므로 ajax로 처리(비동기가 아닌 동기적으로 처리)
   
   // 장바구니 삭제** 
   // 동적 SQL로 한번에 처리 foreach문
   System.out.println(shopping_cartArr);
   JSONArray shopping_cartno = new JSONArray(shopping_cartArr);
   int[] shopping_cartInt = new int[shopping_cartno.length()];
   for(int i = 0; i<shopping_cartno.length(); i++) {
     shopping_cartInt[i] = shopping_cartno.getInt(i);
   }
   
   cnt = this.shopping_cartProc.delete_list(shopping_cartInt);
   
   result.put("result", porderno); // 주문 번호를 넘겨줘야 함
   System.out.println(result.toString());
   return result.toString();
 }
 
 //http://localhost:9090/team4/porder/complete.do
 /**
  * 결제 등록 결과
  * @param url
  * @return
  */
 @RequestMapping(value="/porder/complete.do", method=RequestMethod.GET)
 public ModelAndView complete(HttpSession session, String porderno){
   ModelAndView mav = new ModelAndView();
   // 멤버 이름
   int memno = 1;
   
   // System.out.println(porderno);
   
   // 결제 정보
   // porder 하나만 가져옴
   PorderVO porderVO = this.porderProc.read(Integer.parseInt(porderno));
   mav.addObject("porderVO", porderVO);
   
   mav.setViewName("/porder/create_msg"); // webapp/porder/create_msg.jsp
   // cnt도 계속 get 방식 파라미터로 포워딩됨
   
   return mav; // forward
 }
 
 //http://localhost:9090/team4/porder/list_admin.do
 /**
  * 주문 리스트 - 관리자
  * @return
  */
 @RequestMapping(value="/porder/list_admin.do", method=RequestMethod.GET)
 public ModelAndView list_admin(){
   ModelAndView mav = new ModelAndView();
   
   List<PorderVO> list = this.porderProc.list();    
   mav.addObject("list", list);
   mav.setViewName("/porder/list_admin"); // webapp/porder/list_admin.jsp
   
   return mav; // forward
 }
 
 //http://localhost:9090/team4/porder/list.do
 /**
  * 주문 리스트 - 사용자
  * @return
  */
 @RequestMapping(value="/porder/list.do", method=RequestMethod.GET)
 public ModelAndView list( HttpSession session ){
   ModelAndView mav = new ModelAndView();
   
   int memno = 1;
   // 주문1 + 주문 상세N + 아이템N을 조인한 리스트 출력
   List<Porder_detail_itemVO> list = this.porderProc.list_join_porder_detail_item(memno);
   
   mav.addObject("list", list);
   mav.setViewName("/porder/list"); // webapp/porder/list.jsp
   
   return mav; // forward
 }
 
 
 //http://localhost:9090/team4/porder/msg.do?
 /**
  * 메시지
  * @param url
  * @return
  */
 @RequestMapping(value="/porder/msg.do", method=RequestMethod.GET)
 public ModelAndView delete_msg(String url){
   ModelAndView mav = new ModelAndView();
   
   // 등록 처리 메시지: create_msg -> /porder/create_msg.jsp
   // 수정 처리 메시지: update_msg -> /porder/update_msg.jsp
   // 삭제 처리 메시지: delete_msg -> /porder/delete_msg.jsp
   mav.setViewName("/porder/" + url); // forward
   // cnt도 계속 get 방식 파라미터로 포워딩됨
   
   return mav; // forward
 }
 
  // http://localhost:9090/team4/porder/test.do
  @ResponseBody
  @RequestMapping(value="/porder/test.do", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
  public String test(String porderJSONString, String porder_detailArrString){
    
    // porderJSON
    JSONObject porderJSON = new JSONObject(porderJSONString); // String to JSONObject 형변환 
    // System.out.println(porderJSON.toString());
    // 값 꺼내기
    System.out.println(porderJSON.getInt("memno"));
    System.out.println(porderJSON.getInt("item_price_sum"));
    System.out.println(porderJSON.getInt("item_discount_sum"));
    System.out.println(porderJSON.getInt("coupon_discount_sum"));
    System.out.println(porderJSON.getInt("delivery_fee"));
    System.out.println(porderJSON.getInt("payment_price"));
    System.out.println(porderJSON.getInt("porder_zip_code"));
    System.out.println(porderJSON.getString("porder_address"));
    System.out.println(porderJSON.getString("porder_delivery_request"));
    
    // porder_detailArr
    JSONArray porder_detailArr = new JSONArray(porder_detailArrString); // String to JSONArray 형변환
    // System.out.println(porder_detailArr.toString());
    
    // 배열의 크기
    // System.out.println(porder_detailArr.length());
    
    for(int i = 0; i < porder_detailArr.length(); i++) {
      // porder_detailVO
      JSONObject porder_detailJSON = porder_detailArr.getJSONObject(i);
      //System.out.println(porder_detailJSON.toString());
      
      // 값 꺼내기
      System.out.println(porder_detailJSON.getString("itemno"));
      System.out.println(porder_detailJSON.getString("quantity"));
      System.out.println(porder_detailJSON.getString("item_price_sum"));
      System.out.println(porder_detailJSON.getString("item_discount_sum"));
      System.out.println(porder_detailJSON.getString("payment_price"));
      
    }
    
    
    JSONObject json = new JSONObject();
    
    return json.toString(); // forward
  }
 
}
