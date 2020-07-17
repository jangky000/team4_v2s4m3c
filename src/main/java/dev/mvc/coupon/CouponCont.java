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
   * 등록 폼
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
  * 등록 처리
  * @param couponVO
  * @return
  */
  @RequestMapping(value="/coupon/create.do", method=RequestMethod.POST )
  public ModelAndView create(HttpServletRequest request, CouponVO couponVO) {
    ModelAndView mav = new ModelAndView();
    //
    //-----------------------------------------------------
    // 파일 전송 코드 시작
    // -----------------------------------------------------
    String fname = ""; // 원본 파일명
    String fupname = ""; // 업로드된 파일명
    long fsize = 0;  // 파일 사이즈
    String thumb = ""; // Preview 이미지
    
    String upDir = Tool.getRealPath(request, "/coupon/storage"); // 절대 경로, webapp/coupon/storage
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    MultipartFile cpimgMF = couponVO.getCpimgMF();  // 파일 목록
    
    fsize = cpimgMF.getSize();  // 파일 크기
    
    if (fsize > 0) { // 파일 크기 체크
      fname = cpimgMF.getOriginalFilename(); // 원본 파일명, spring.jpg
      // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
      fupname = Upload.saveFileSpring(cpimgMF, upDir); 
      
      if (Tool.isImage(fname)) { // 이미지인지 검사
        // thumb 이미지 생성후 파일명 리턴됨, width: 120, height: 80
        thumb = Tool.preview(upDir, fupname, 120, 80); 
      }

      couponVO.setCpimg(fname);
      couponVO.setCpupimg(fupname);
      couponVO.setCpthumb(thumb);
      // vo.setFsize(fsize);
    }
    // -----------------------------------------------------
    // 파일 전송 코드 종료
    // -----------------------------------------------------
    //
    
    int cnt = this.couponProc.create(couponVO); // dbms 저장
    mav.addObject("cnt", cnt);
    mav.setViewName("redirect:/coupon/list.do"); // jsp파일명을 해당 주소로 파라미터 전달
    return mav;
  }

//http://localhost:9090/team4/coupon/create.do
/**
 * AJAX 이벤트 쿠폰 등록
 * @param porderVO
 * @return
 */
/*@ResponseBody
@RequestMapping(value="/coupon/create.do", method=RequestMethod.POST , produces="text/plain;charset=UTF-8")
public String create(HttpServletRequest request, CouponVO couponVO) {
  
  //-----------------------------------------------------
  // 파일 전송 코드 시작
  // -----------------------------------------------------
  String fname = ""; // 원본 파일명
  String fupname = ""; // 업로드된 파일명
  long fsize = 0;  // 파일 사이즈
  String thumb = ""; // Preview 이미지
  
  String upDir = Tool.getRealPath(request, "/coupon/storage"); // 절대 경로, webapp/coupon/storage
  // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
  MultipartFile cpimgMF = couponVO.getCpimgMF();  // 파일 목록
  
  fsize = cpimgMF.getSize();  // 파일 크기
  
  int cnt = 0;
  
  if (fsize > 0) { // 파일 크기 체크
    fname = cpimgMF.getOriginalFilename(); // 원본 파일명, spring.jpg
    // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
    fupname = Upload.saveFileSpring(cpimgMF, upDir); 
    
    if (Tool.isImage(fname)) { // 이미지인지 검사
      // thumb 이미지 생성후 파일명 리턴됨, width: 120, height: 120
      thumb = Tool.preview(upDir, fupname, 120, 120); 
    }
    CouponVO vo = new CouponVO();
    vo.setCpimg(fname);
    vo.setCpupimg(fupname);
    vo.setCpthumb(thumb);
    // vo.setFsize(fsize);
    
    cnt = this.couponProc.create(couponVO); // dbms 저장
  }    
  // -----------------------------------------------------
  // 파일 전송 코드 종료
  // -----------------------------------------------------
  
  JSONObject json = new JSONObject(); // 메이븐에 json 추가
  json.put("cnt", cnt);
  
  return json.toString();
}*/
 
 /**
  * 주문 리스트
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
   
   // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
   HashMap<String, Object> map = new HashMap<String, Object>();
   map.put("nowPage", nowPage); // 페이지에 출력할 레코드의 범위를 산출하기 위해 사용
   
   List<CouponVO> list = this.couponProc.list_by_couponno_paging(map);    
   mav.addObject("list", list);
   mav.setViewName("/coupon/list"); // webapp/coupon/list.jsp
   
   // 총 레코드 갯수
   int search_count = this.couponProc.search_count();
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
   String paging = this.couponProc.pagingBox("list.do",search_count, nowPage);
   mav.addObject("paging", paging);
 
   mav.addObject("nowPage", nowPage);
   
   return mav; // forward
 }
 
 
}
