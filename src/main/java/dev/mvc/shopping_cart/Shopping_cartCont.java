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
   * ��� ��
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
  * ��� ó��
  * @param porderVO
  * @return
  */
 @RequestMapping(value="/shopping_cart/create.do", method=RequestMethod.POST )
 public ModelAndView create(HttpSession session, Shopping_cartVO shopping_cartVO) {
   ModelAndView mav = new ModelAndView();
   
   int memno = 1;
   
   // ���� īƮ�� ������ �������� ������ Ư�� ������ŭ ���� -> memno + itemno�� �˻�
   // read
   HashMap map = new HashMap<Object, Object>();
   map.put("memno", memno);
   map.put("itemno", shopping_cartVO.getItemno());
   String shopping_cartno = this.shopping_cartProc.shopping_cart_check(map);
   // redirect �� �ƴ϶� -> ajax ���� ���·� �ٲ�� �� ��
   
   if(shopping_cartno != null) {
     map.clear();
     map.put("shopping_cartno", shopping_cartno);
     map.put("quantity_up_num", shopping_cartVO.getQuantity());
     int quantity_cnt = this.shopping_cartProc.quantity_up_num(map);
     /*if(quantity_cnt == 1) {
       System.out.println("�ߺ� ��ǰ " +shopping_cartVO.getQuantity()  + "�� ����");
     }*/
     mav.setViewName("redirect:/shopping_cart/list.do");
     return mav;
   }
   
   shopping_cartVO.setMemno(memno);
   int cnt = this.shopping_cartProc.create(shopping_cartVO);
   
   mav.addObject("cnt", cnt); // redirect parameter ����
   
   //mav.addObject("url", "create_msg"); // ���ϸ�: create_msg.jsp, redirect parameter ����
   //mav.setViewName("redirect:/shopping_cart/msg.do"); // jsp���ϸ��� �ش� �ּҷ� �Ķ���� ����
   mav.setViewName("redirect:/shopping_cart/list.do");
   return mav;
 }
 
//http://localhost:9090/team4/shopping_cart/list.do
 /**
  * ��ٱ��� ����Ʈ
  * @return
  */
 @RequestMapping(value="/shopping_cart/list.do", method=RequestMethod.GET)
 public ModelAndView list(HttpSession session){
   ModelAndView mav = new ModelAndView();
   
   // ���� ���̵� ���� ������ -> �α��� �������� �̵� 
   
   // ������ ����Ǹ� ���� ���� �޾ƿͼ� ����ϱ�
   // int memno = (Integer)session.getAttribute("memno");
   int memno = 1;
   
   // ������ ������ ���;���, � ����? 
   // ����� �̹���, �̸�, ����, ������, 
   
   // List<Shopping_cartVO> list = this.shopping_cartProc.list();
   List<Shop_item_grpVO> list = this.shopping_cartProc.list_join(memno);
   
   mav.addObject("list", list);
   mav.setViewName("/shopping_cart/list"); // webapp/shopping_cart/list.jsp
   
   return mav; // forward
 }
 
  //http://localhost:9090/team4/shopping_cart/quantity_down.do?shopping_cartno=1
  /**
   * ��ٱ��� ���� ����--
   * @param shopping_cartno ��ٱ��� ��ȣ
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/shopping_cart/quantity_down.do", method=RequestMethod.GET,
                              produces="text/plain;charset=UTF-8") // �ѱ� ���� ����
  public String quantity_down(int shopping_cartno) {
    
    int cnt = this.shopping_cartProc.quantity_down(shopping_cartno);  // ���� ���� ó��
    
    Shopping_cartVO shopping_cartVO = this.shopping_cartProc.read(shopping_cartno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    json.put("quantity", shopping_cartVO.getQuantity());
    
    return json.toString();
  }
  
  //http://localhost:9090/team4/shopping_cart/quantity_up.do?shopping_cartno=1
  /**
   * ��ٱ��� ���� ����++
   * @param shopping_cartno ��ٱ��� ��ȣ
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/shopping_cart/quantity_up.do", method=RequestMethod.GET, 
                              produces="text/plain;charset=UTF-8")
  public String quantity_up(int shopping_cartno) {
    
    int cnt = this.shopping_cartProc.quantity_up(shopping_cartno);  // ���� ���� ó��
    
    Shopping_cartVO shopping_cartVO = this.shopping_cartProc.read(shopping_cartno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    json.put("quantity", shopping_cartVO.getQuantity());
    
    return json.toString();
  }  
 
//http://localhost:9090/team4/shopping_cart/delete.do
 /**
  * ��ٱ��� ��ǰ ���� ó��, GET ���, ���� Ȯ���ؼ� �����ϱ�
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
  * �޽���
  * @param url
  * @return
  */
 @RequestMapping(value="/shopping_cart/msg.do", method=RequestMethod.GET)
 public ModelAndView delete_msg(String url){
   ModelAndView mav = new ModelAndView();
   
   // ��� ó�� �޽���: create_msg -> /shopping_cart/create_msg.jsp
   // ���� ó�� �޽���: update_msg -> /shopping_cart/update_msg.jsp
   // ���� ó�� �޽���: delete_msg -> /shopping_cart/delete_msg.jsp
   mav.setViewName("/shopping_cart/" + url); // forward
   // cnt�� ��� get ��� �Ķ���ͷ� ��������
   
   return mav; // forward
 }

 
}
