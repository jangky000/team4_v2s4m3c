package dev.mvc.delivery;

// import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DeliveryCont {

  public DeliveryCont() {
    System.out.println("--> DeliveryCont created.");
  }

  // http://localhost:9090/team4/delivery/test.do
  @ResponseBody
  @RequestMapping(value="/delivery/test.do", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
  public String test(){
   /*
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
 */
   
  JSONObject json = new JSONObject();
  json.put("test", 1);
  return json.toString(); // forward
  }
  
  //http://localhost:9090/team4/delivery/rest.do?
  /**
   * REST 요청
   * @param url
   * @return
   */
  @RequestMapping(value="/delivery/rest.do", method=RequestMethod.GET)
  public ModelAndView delete_msg(String test){
    ModelAndView mav = new ModelAndView();
    
    
    
    mav.setViewName("/delivery/list_seller");    
    return mav; // forward
  }
  
}
