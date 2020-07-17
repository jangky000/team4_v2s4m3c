package dev.mvc.coupon;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import dev.mvc.porder.PorderVO;
import dev.mvc.porder_detail.Porder_detailVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class CouponCont {
  
  @Autowired
  @Qualifier("dev.mvc.coupon.CouponProc")
  private CouponProcInter couponProc;
  
  
  public CouponCont() {
    System.out.println("--> CouponCont created.");
  }
  
  //http://localhost:9090/team4/coupon/create.do
  /**
   * ��� ��
   * @return
   */
  @RequestMapping(value="/coupon/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/coupon/create"); // webapp/coupon/create.jsp
    return mav;
  }
  
 //http://localhost:9090/team4/coupon/create.do
 /**
  * ��� ó��
  * @param couponVO
  * @return
  */
  @RequestMapping(value="/coupon/create.do", method=RequestMethod.POST )
  public ModelAndView create(HttpServletRequest request, CouponVO couponVO) {
    ModelAndView mav = new ModelAndView();
    //
    //-----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    String fname = ""; // ���� ���ϸ�
    String fupname = ""; // ���ε�� ���ϸ�
    long fsize = 0;  // ���� ������
    String thumb = ""; // Preview �̹���
    
    String upDir = Tool.getRealPath(request, "/coupon/storage"); // ���� ���, webapp/coupon/storage
    // ���� ������ ����� fnamesMF ��ü�� ������.
    MultipartFile cpimgMF = couponVO.getCpimgMF();  // ���� ���
    
    fsize = cpimgMF.getSize();  // ���� ũ��
    
    if (fsize > 0) { // ���� ũ�� üũ
      fname = cpimgMF.getOriginalFilename(); // ���� ���ϸ�, spring.jpg
      // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�, spring.jsp, spring_1.jpg...
      fupname = Upload.saveFileSpring(cpimgMF, upDir); 
      
      if (Tool.isImage(fname)) { // �̹������� �˻�
        // thumb �̹��� ������ ���ϸ� ���ϵ�, width: 120, height: 80
        thumb = Tool.preview(upDir, fupname, 120, 80); 
      }

      couponVO.setCpimg(fname);
      couponVO.setCpupimg(fupname);
      couponVO.setCpthumb(thumb);
      // vo.setFsize(fsize);
    }
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    //
    
    int cnt = this.couponProc.create(couponVO); // dbms ����
    mav.addObject("cnt", cnt);
    mav.setViewName("redirect:/coupon/list.do"); // jsp���ϸ��� �ش� �ּҷ� �Ķ���� ����
    return mav;
  }

//http://localhost:9090/team4/coupon/create.do
/**
 * AJAX �̺�Ʈ ���� ���
 * @param porderVO
 * @return
 */
/*@ResponseBody
@RequestMapping(value="/coupon/create.do", method=RequestMethod.POST , produces="text/plain;charset=UTF-8")
public String create(HttpServletRequest request, CouponVO couponVO) {
  
  //-----------------------------------------------------
  // ���� ���� �ڵ� ����
  // -----------------------------------------------------
  String fname = ""; // ���� ���ϸ�
  String fupname = ""; // ���ε�� ���ϸ�
  long fsize = 0;  // ���� ������
  String thumb = ""; // Preview �̹���
  
  String upDir = Tool.getRealPath(request, "/coupon/storage"); // ���� ���, webapp/coupon/storage
  // ���� ������ ����� fnamesMF ��ü�� ������.
  MultipartFile cpimgMF = couponVO.getCpimgMF();  // ���� ���
  
  fsize = cpimgMF.getSize();  // ���� ũ��
  
  int cnt = 0;
  
  if (fsize > 0) { // ���� ũ�� üũ
    fname = cpimgMF.getOriginalFilename(); // ���� ���ϸ�, spring.jpg
    // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�, spring.jsp, spring_1.jpg...
    fupname = Upload.saveFileSpring(cpimgMF, upDir); 
    
    if (Tool.isImage(fname)) { // �̹������� �˻�
      // thumb �̹��� ������ ���ϸ� ���ϵ�, width: 120, height: 120
      thumb = Tool.preview(upDir, fupname, 120, 120); 
    }
    CouponVO vo = new CouponVO();
    vo.setCpimg(fname);
    vo.setCpupimg(fupname);
    vo.setCpthumb(thumb);
    // vo.setFsize(fsize);
    
    cnt = this.couponProc.create(couponVO); // dbms ����
  }    
  // -----------------------------------------------------
  // ���� ���� �ڵ� ����
  // -----------------------------------------------------
  
  JSONObject json = new JSONObject(); // ���̺쿡 json �߰�
  json.put("cnt", cnt);
  
  return json.toString();
}*/
 
 /**
  * �ֹ� ����Ʈ
  * @return
  */
// @RequestMapping(value="/coupon/list.do", method=RequestMethod.GET)
// public ModelAndView list(){
//   ModelAndView mav = new ModelAndView();
//   
//   List<CouponVO> list = this.couponProc.list();    
//   mav.addObject("list", list);
//   mav.setViewName("/coupon/list"); // webapp/coupon/list.jsp
//   
//   return mav; // forward
// }
 
 @RequestMapping(value="/coupon/list.do", method=RequestMethod.GET)
 public ModelAndView list_paging(@RequestParam(value="nowPage", defaultValue="1") int nowPage){
   ModelAndView mav = new ModelAndView();
   
   // ���ڿ� ���ڿ� Ÿ���� �����ؾ������� Obejct ���
   HashMap<String, Object> map = new HashMap<String, Object>();
   map.put("nowPage", nowPage); // �������� ����� ���ڵ��� ������ �����ϱ� ���� ���
   
   List<CouponVO> list = this.couponProc.list_by_couponno_paging(map);    
   mav.addObject("list", list);
   mav.setViewName("/coupon/list"); // webapp/coupon/list.jsp
   
   // �� ���ڵ� ����
   int search_count = this.couponProc.search_count();
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
   String paging = this.couponProc.pagingBox("list.do",search_count, nowPage);
   mav.addObject("paging", paging);
 
   mav.addObject("nowPage", nowPage);
   
   return mav; // forward
 }
 
 
}
