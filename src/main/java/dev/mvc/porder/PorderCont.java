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
   * ��� ��
   * @return
   */
  @RequestMapping(value="/porder/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/porder/create"); // webapp/porder/create.jsp
    return mav;
  }
  
  // ���߿� get ������� �迭�� �޾Ƽ�(json ����̳�, ����ó�� item[]=��ǰ��ȣ:����,�� ���) ����� �� �ְ� �����ؾ� ��, post�θ� ���� �����ϰ� �ϸ� ������
  //http://localhost:9090/team4/porder/payment.do
  @RequestMapping(value="/porder/payment.do", method=RequestMethod.GET )
  public ModelAndView payment(String[] shopping_cartno) {
    ModelAndView mav = new ModelAndView();
    
    // shopping_cartno�� �޴� ������ ������ ����ϸ� �α׾ƿ��� ������ ������� ����
    
    // ��� �����ϱ� �ؾ��� ��, ���ε� �ʿ��� ��, ��굵 �ٽ��ؾ� �� ��
    // shopping_cart: īƮ ��ȣ, �����ȣ, ��ǰ ��ȣ, ����, 
    // item: ��ǰ �̸�, ���, ����, ��������, 
    // �߰� ���: ��ǰ �� ����, ��ǰ �� ����, ���� ����, ��ۺ�, ���� �ݾ�
    
    //���� SQL�� �ѹ��� VO ����Ʈ �о����
    //https://zetawiki.com/wiki/%EC%9E%90%EB%B0%94_String_%EB%B0%B0%EC%97%B4%EC%9D%84_int_%EB%B0%B0%EC%97%B4%EB%A1%9C_%EB%B3%80%ED%99%98
    int[] shopping_cartInt = Arrays.stream(shopping_cartno).mapToInt(Integer::parseInt).toArray(); // int �迭�� ����ȯ
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
  
  // �� ����
  // url ������ ������ �ִ� IE ȯ�� ��� json �迭�� ũ�Ⱑ �ʹ� ũ�ٸ�, post�� ���۵ǰ� �ؾ� ��, json���� �� ��� �����ϱ�
  //http://localhost:9090/team4/porder/payment.do
  /**
   * ��� ��, ��ٱ��� ����Ʈ���� �Ѿ�� -> �Ⱦ�
   * @return
   */
/*  @RequestMapping(value="/porder/payment.do", method=RequestMethod.POST )
  public ModelAndView payment_post(String[] shopping_cartno, PorderVO porderVO) {
    ModelAndView mav = new ModelAndView();
    // ��� �����ϱ� �ؾ��� ��, ���ε� �ʿ��� ��, ��굵 �ٽ��ؾ� �� ��
    // ������ ����: �̸�, �ּ�, �̸���, �޴��� ��ȣ, 
    // shopping_cart: īƮ ��ȣ, �����ȣ, ��ǰ ��ȣ, ����, 
    // item: ��ǰ �̸�, ���, ����, ��������, 
    // �߰� ���: ��ǰ �� ����, ��ǰ �� ����, ���� ����, ��ۺ�, ���� �ݾ�
    
    //���� SQL�� �ѹ��� VO ����Ʈ �о����
    //https://zetawiki.com/wiki/%EC%9E%90%EB%B0%94_String_%EB%B0%B0%EC%97%B4%EC%9D%84_int_%EB%B0%B0%EC%97%B4%EB%A1%9C_%EB%B3%80%ED%99%98
    int[] shopping_cartInt = Arrays.stream(shopping_cartno).mapToInt(Integer::parseInt).toArray(); // int �迭�� ����ȯ
    //List<Shopping_cartVO> shopping_cartlist = this.shopping_cartProc.list_by_selected_shopping_cartno(shopping_cartInt);
    int memno = 1;
    List<Shop_item_grpVO> shopping_cartlist = this.shopping_cartProc.list_join_by_selected_shopping_cartno(shopping_cartInt, memno);
    mav.addObject("shopping_cartlist", shopping_cartlist); // ������ ������ ����Ʈ�� �����ؼ� ���� ������ ��
    
    // PorderVO porderVO = new PorderVO();
    mav.addObject("porderVO", porderVO);
    mav.setViewName("/porder/create"); // webapp/porder/create.jsp
    return mav;
  }*/
  
 //http://localhost:9090/team4/porder/create.do
 /**
  * ��� ó�� -> ���� ���
  * @param porderVO
  * @return
  */
 @ResponseBody
 @RequestMapping(value="/porder/create.do", method=RequestMethod.POST , produces="text/plain;charset=UTF-8")
 public String create(String porderJSONString, String porder_detailArrString, String coupon_issueArr, String shopping_cartArr) {
   //ModelAndView mav = new ModelAndView();
   JSONObject result = new JSONObject();
   
   // ��� Ȯ��(���߿� �߰�)
   // ����(���߿� �߰�)
   // ���� Ȯ��(���߿� �߰�)
   
   // porderJSON
   JSONObject porderJSON = new JSONObject(porderJSONString); // String to JSONObject ����ȯ 
   // �� ������
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
   
   // ���� ����
   int cnt = this.porderProc.create(porderVO);
   // ������ seqno�� �޾ƿ���
   int porderno = porderVO.getPorderno();
   
   if(cnt == 0) {
     System.out.println("���� ���� ����");
     result.put("result", -1);
     return result.toString();
   }
   
   System.out.println("porder ��� �Ϸ�");
   System.out.println("porderno��" + porderno);
   
   // ���� �߱� ���� ����
   // ���� ��� ���
   // �� ������
   System.out.println("coupon_issueArr" + coupon_issueArr);
   JSONArray coupon_issueno = new JSONArray(coupon_issueArr);
   int[] coupon_issueInt = new int[coupon_issueno.length()];
   for(int i = 0; i<coupon_issueno.length(); i++) {
     coupon_issueInt[i] = coupon_issueno.getInt(i);
   }
   
   // ���� �߱� ������Ʈ
   HashMap<String, Object> issue_map = new HashMap<String, Object>();
   issue_map.put("cpstatus", "U"); // I: �߱�, U: ��� �Ϸ�, C: �߱� ���
   issue_map.put("coupon_issueInt", coupon_issueInt); // �迭�� ����
   int issue_cnt  = this.coupon_issueProc.update_list_status(issue_map);
   
   // ���� ��� ���
   HashMap<String, Object> use_map = new HashMap<String, Object>();
   int use_cnt = 0;
   for(int i = 0; i<coupon_issueInt.length; i++) {
     use_cnt = this.coupon_useProc.create(porderno, coupon_issueInt[i], "U");
   }
   
   // ���� ���� ���� ���� SQL�� ó�� insert select�� ����ؼ� �ѹ��� ó�� -> ��ǰ �ݾ��� �ٲ�� ��� ������ �� �� �ִ�.
   // ���� �� ���� ������ ���
   
   // �ֹ� �� ���
   // porder_detailArr
   JSONArray porder_detailArr = new JSONArray(porder_detailArrString); // String to JSONArray ����ȯ
   
   Porder_detailVO porder_detailVO = new Porder_detailVO();
   for(int i = 0; i < porder_detailArr.length(); i++) {
     // porder_detailVO
     JSONObject porder_detailJSON = porder_detailArr.getJSONObject(i);
     //System.out.println(porder_detailJSON.toString());
     
     // �� ������
     int itemno = porder_detailJSON.getInt("itemno");
     int quantity = porder_detailJSON.getInt("quantity");
     int detail_item_price_sum = porder_detailJSON.getInt("item_price_sum");
     int detail_item_discount_sum = porder_detailJSON.getInt("item_discount_sum");
     int detail_payment_price = porder_detailJSON.getInt("payment_price");
     
     // �� �Է�
     porder_detailVO.setVO(porderno, itemno, quantity, detail_item_price_sum, detail_item_discount_sum, 
         detail_payment_price, "R");
     
     // DB ����
     cnt = this.porder_detailProc.create(porder_detailVO);
     
     if(cnt == 0) {
       System.out.println("���� ���� ���� ����");
       // porder ����
       // ��ϵ� porder detail ���� -> ���� sql �� �ۼ��ؼ� ���ڼ� �ְ� ���� �� -> insert all ����� ����ϸ� sequence�� �������� �ʴ� �������� ���� -> ��� �ذ��� ��?
       result.put("result", -1);
       return result.toString();
     }
     
   }
   System.out.println("porder detail ��� �Ϸ�");
   // ��ٱ��� ��ȣ�� �޾ƿͼ�, ��ٱ��� ��ȣ�� �������� WHERE�� �ȿ� �ְ� ��ٱ��Ͽ� ��ǰ�� �����ؼ� ������ �Է�
   // ���� ���߿� ��ǰ ������ �ٲ��? �ջ��ؼ� �� �ݾװ� �޶����� -> ��ǰ ������ �޶����ٰ� ó��?
   
   // ������ �����Ƿ� ajax�� ó��(�񵿱Ⱑ �ƴ� ���������� ó��)
   
   // ��ٱ��� ����** 
   // ���� SQL�� �ѹ��� ó�� foreach��
   System.out.println(shopping_cartArr);
   JSONArray shopping_cartno = new JSONArray(shopping_cartArr);
   int[] shopping_cartInt = new int[shopping_cartno.length()];
   for(int i = 0; i<shopping_cartno.length(); i++) {
     shopping_cartInt[i] = shopping_cartno.getInt(i);
   }
   
   cnt = this.shopping_cartProc.delete_list(shopping_cartInt);
   
   result.put("result", porderno); // �ֹ� ��ȣ�� �Ѱ���� ��
   System.out.println(result.toString());
   return result.toString();
 }
 
 //http://localhost:9090/team4/porder/complete.do
 /**
  * ���� ��� ���
  * @param url
  * @return
  */
 @RequestMapping(value="/porder/complete.do", method=RequestMethod.GET)
 public ModelAndView complete(HttpSession session, String porderno){
   ModelAndView mav = new ModelAndView();
   // ��� �̸�
   int memno = 1;
   
   // System.out.println(porderno);
   
   // ���� ����
   // porder �ϳ��� ������
   PorderVO porderVO = this.porderProc.read(Integer.parseInt(porderno));
   mav.addObject("porderVO", porderVO);
   
   mav.setViewName("/porder/create_msg"); // webapp/porder/create_msg.jsp
   // cnt�� ��� get ��� �Ķ���ͷ� ��������
   
   return mav; // forward
 }
 
 //http://localhost:9090/team4/porder/list_admin.do
 /**
  * �ֹ� ����Ʈ - ������
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
  * �ֹ� ����Ʈ - �����
  * @return
  */
 @RequestMapping(value="/porder/list.do", method=RequestMethod.GET)
 public ModelAndView list( HttpSession session ){
   ModelAndView mav = new ModelAndView();
   
   int memno = 1;
   // �ֹ�1 + �ֹ� ��N + ������N�� ������ ����Ʈ ���
   List<Porder_detail_itemVO> list = this.porderProc.list_join_porder_detail_item(memno);
   
   mav.addObject("list", list);
   mav.setViewName("/porder/list"); // webapp/porder/list.jsp
   
   return mav; // forward
 }
 
 
 //http://localhost:9090/team4/porder/msg.do?
 /**
  * �޽���
  * @param url
  * @return
  */
 @RequestMapping(value="/porder/msg.do", method=RequestMethod.GET)
 public ModelAndView delete_msg(String url){
   ModelAndView mav = new ModelAndView();
   
   // ��� ó�� �޽���: create_msg -> /porder/create_msg.jsp
   // ���� ó�� �޽���: update_msg -> /porder/update_msg.jsp
   // ���� ó�� �޽���: delete_msg -> /porder/delete_msg.jsp
   mav.setViewName("/porder/" + url); // forward
   // cnt�� ��� get ��� �Ķ���ͷ� ��������
   
   return mav; // forward
 }
 
  // http://localhost:9090/team4/porder/test.do
  @ResponseBody
  @RequestMapping(value="/porder/test.do", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
  public String test(String porderJSONString, String porder_detailArrString){
    
    // porderJSON
    JSONObject porderJSON = new JSONObject(porderJSONString); // String to JSONObject ����ȯ 
    // System.out.println(porderJSON.toString());
    // �� ������
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
    JSONArray porder_detailArr = new JSONArray(porder_detailArrString); // String to JSONArray ����ȯ
    // System.out.println(porder_detailArr.toString());
    
    // �迭�� ũ��
    // System.out.println(porder_detailArr.length());
    
    for(int i = 0; i < porder_detailArr.length(); i++) {
      // porder_detailVO
      JSONObject porder_detailJSON = porder_detailArr.getJSONObject(i);
      //System.out.println(porder_detailJSON.toString());
      
      // �� ������
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
