package dev.mvc.event;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;


@Controller
public class EventCont {
  @Autowired
  @Qualifier("dev.mvc.event.EventProc")
  private EventProcInter eventProc;
  
  public EventCont() {
    System.out.println("★★★★ eventCont created");
  }
  
  /**
   * 등록 폼
   * @return
   */
  // http://localhost:9090/team4/event/create.do
  
  @RequestMapping(value="/event/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/event/create"); // webapp/cate/create.jsp
    
    return mav;
  }

//http://localhost:9090/team4/event/create.do
 /**
  * 등록 처리
  * @param eventVO
  * @return
  */

  @RequestMapping(value="/event/create.do", method=RequestMethod.POST )
  public ModelAndView create(HttpServletRequest request,EventVO eventVO)
  {
    ModelAndView mav = new ModelAndView();
    
 // -------------------------------------------------------------------
    // 파일 전송 코드 시작
    // -------------------------------------------------------------------
    String event_img = ""; // img 파일 // 컬럼명!!!!!!!!!
    String event_timg = "";
    String upDir = Tool.getRealPath(request, "/event/storage/imgstorage"); // 절대 경로
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    MultipartFile mf = eventVO.getEvent_imgMF();  // 파일 목록
    long fsize = mf.getSize();  // 파일 크기
    if (fsize > 0) { // 파일 크기 체크
      // mp3 = mf.getOriginalFilename(); // 원본 파일명, spring.jpg
      // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
      event_img = Upload.saveFileSpring(mf, upDir); // 컬럼명!!!!!!!!!
      
      if (Tool.isImage(event_img)) { // 이미지인지 검사
        // thumb 이미지 생성후 파일명 리턴됨, width: 120, height: 80
        event_timg = Tool.preview(upDir, event_img, 320, 280); 
      }
    }    
    // -------------------------------------------------------------------
    // 파일 전송 코드 종료
    // -------------------------------------------------------------------
    eventVO.setEvent_img(event_img);
    eventVO.setEvent_timg(event_timg);
    

    int cnt = this.eventProc.create(eventVO);
    mav.addObject("cnt", cnt); // request에 저장
    mav.addObject("url", "create_msg");
    
    if (cnt == 1) {
      mav.setViewName("redirect:/event/list_paging.do"); // webapp/cate/create_msg.jsp
      // mav.setViewName("redirect:/cate/list.do"); // spring 재호출
    } else { 
      mav.setViewName("/event/create_msg"); // webapp/cate/create_msg.jsp
    }
    
    return mav;
  }
  
//http://localhost:9090/team4/event/list.do
 /**
  * 전체 목록
  * @return
  */
 @RequestMapping(value="/event/list.do", method=RequestMethod.GET )
 public ModelAndView list() {
   ModelAndView mav = new ModelAndView();
   
   List<EventVO> list = this.eventProc.list();
   mav.addObject("list", list); // request.setAttribute("list", list);

   mav.setViewName("/event/list"); // /webapp/event/list.jsp
   return mav;
 }
 /**
  * 조회
  * @param eventno
  * @return
  */
  @RequestMapping(value="/event/read.do", method=RequestMethod.GET )
  public ModelAndView read(int eventno) {
    ModelAndView mav = new ModelAndView();

    EventVO eventVO = this.eventProc.read(eventno);
    mav.addObject("eventVO", eventVO); // request.setAttribute("contentsVO", contentsVO);

    mav.setViewName("/event/read"); // /webapp/contents/read.jsp
    return mav;
  }
  
/**
 * 목록  + 페이징 지원
 * http://localhost:9090/team4/event/list.do
 * http://localhost:9090/team4/event/list.do?cateno=1&word=스위스&nowPage=1
 * @param cateno
 * @param word
 * @param nowPage
 * @return
 */
@RequestMapping(value = "/event/list_paging.do", 
                                     method = RequestMethod.GET)
public ModelAndView list(
    @RequestParam(value="eventno", defaultValue="1") int eventno,
    @RequestParam(value="nowPage", defaultValue="1") int nowPage
    ) { 
  System.out.println("--> nowPage: " + nowPage);
  
  ModelAndView mav = new ModelAndView();

  // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
  HashMap<String, Object> map = new HashMap<String, Object>();
  map.put("eventno", eventno); // #{cateno}

  map.put("nowPage", nowPage); //페이지에 출력할 레코드의 범위를 산출하기 위해 사용
  
  // 검색 목록
  List<EventVO> list = eventProc.list_paging(map);
  for (EventVO eventVO : list){
    System.out.println(eventVO.getEvent_timg());
  }
  System.out.println();
  mav.addObject("list", list);
  
  // 검색된 레코드 갯수
  int search_count = eventProc.search_count(map);
  mav.addObject("search_count", search_count);
  
  EventVO eventVO = this.eventProc.read(eventno); 
  mav.addObject("eventVO", eventVO);



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
  String paging = eventProc.pagingBox("list_paging.do", eventno, search_count, nowPage);
  mav.addObject("paging", paging);
  mav.addObject("nowPage", nowPage);
  
  // /contents/list_by_cateno_search_paging.jsp
  mav.setViewName("/event/list_paging_grid");   
  
  return mav;

}    

  //http://localhost:9090/resort/contents/update.do
  /**
  * 수정 폼
  * @return
  */
  @RequestMapping(value="/event/update.do", method=RequestMethod.GET )
  public ModelAndView update(int eventno) {
   ModelAndView mav = new ModelAndView();
   
   EventVO eventVO = this.eventProc.read(eventno);
   mav.addObject("eventVO", eventVO); // request.setAttribute("contentsVO", contentsVO);
   
   
   
   mav.setViewName("/event/update"); // webapp/contents/update.jsp
   
   return mav;
}

  // http://localhost:9090/team4/event/update.do
  /**
   * 수정 처리
   * @param contentsVO
   * @return
   */
  @RequestMapping(value="/event/update.do", method=RequestMethod.POST )
  public ModelAndView update(HttpServletRequest request,EventVO eventVO) {
    ModelAndView mav = new ModelAndView();
//    read. file name 가져오고, 이름에 해당하는 파일 삭제,
    // -------------------------------------------------------------------
    // 파일 전송 코드 시작
    // -------------------------------------------------------------------
    String event_img = ""; // img 파일 // 컬럼명!!!!!!!!!
    String event_timg = "";
    String upDir = Tool.getRealPath(request, "/event/storage/imgstorage"); // 절대 경로
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    MultipartFile mf = eventVO.getEvent_imgMF();  // 파일 목록
    long fsize = mf.getSize();  // 파일 크기
    if (fsize > 0) { // 파일 크기 체크
      // mp3 = mf.getOriginalFilename(); // 원본 파일명, spring.jpg
      // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
      event_img = Upload.saveFileSpring(mf, upDir); // 컬럼명!!!!!!!!!
      
      if (Tool.isImage(event_img)) { // 이미지인지 검사
        // thumb 이미지 생성후 파일명 리턴됨, width: 120, height: 80
        event_timg = Tool.preview(upDir, event_img, 320, 280); 
      }
    }    
    // -------------------------------------------------------------------
    // 파일 전송 코드 종료
    // -------------------------------------------------------------------
    eventVO.setEvent_img(event_img);
    eventVO.setEvent_timg(event_timg);
    
    mav.addObject("eventno", eventVO.getEventno());
        
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("eventno", eventVO.getEventno());
    hashMap.put("event_passwd",  eventVO.getEvent_passwd());
    
    int passwd_cnt = 0; // 패스워드 일치 레코드 갯수
    int cnt = 0;             // 수정된 레코드 갯수 
    
    passwd_cnt = this.eventProc.passwd_check(hashMap);
    
    if (passwd_cnt == 1) { // 패스워드 일치
      cnt = this.eventProc.update(eventVO);
    }

    mav.addObject("cnt", cnt); // request에 저장
    mav.addObject("passwd_cnt", passwd_cnt); // request에 저장
        
    if (passwd_cnt == 1 && cnt == 1) {
      mav.setViewName("redirect:/event/list_paging.do"); // webapp/contents/update_msg.jsp
      // mav.setViewName("/event/update_msg"); // webapp/contents/update_msg.jsp
      // mav.setViewName("redirect:/event/list.do"); // spring 재호출
    } else { 
      mav.setViewName("/event/update_msg"); // webapp/contents/update_msg.jsp
    }
    
    return mav;
  }
  
//http://localhost:9090/resort/event/delete.do
 /**
  * 삭제 폼
  * @return
  */
 @RequestMapping(value="/event/delete.do", method=RequestMethod.GET )
 public ModelAndView delete(int eventno) {
   ModelAndView mav = new ModelAndView();
   
   EventVO eventVO = this.eventProc.read(eventno);
   mav.addObject("eventVO", eventVO); // request.setAttribute("contentsVO", contentsVO);
   
   mav.setViewName("/event/delete"); // webapp/contents/delete.jsp
   
   return mav;
 }
 
//http://localhost:9090/team4/event/delete.do
/**
 * 삭제 처리
 * @param contentsVO
 * @return
 */
@RequestMapping(value="/event/delete.do", method=RequestMethod.POST )
public ModelAndView delete(int eventno, String event_passwd) {
  ModelAndView mav = new ModelAndView();

  HashMap<String, Object> hashMap = new HashMap<String, Object>();
  hashMap.put("eventno", eventno);
  hashMap.put("event_passwd", event_passwd);
  
  int passwd_cnt = 0; // 패스워드 일치 레코드 갯수
  int cnt = 0;             // 삭제된 레코드 갯수 
  
  passwd_cnt = this.eventProc.passwd_check(hashMap);
  
  EventVO eventVO = this.eventProc.read(eventno); 
  String event_title = eventVO.getEvent_title(); // 제목
  mav.addObject("event_title", event_title);
  
  if (passwd_cnt == 1) { // 패스워드 일치
    cnt = this.eventProc.delete(eventno);
  }

  mav.addObject("cnt", cnt); // request에 저장
  mav.addObject("passwd_cnt", passwd_cnt); // request에 저장
      
  if (passwd_cnt == 1 && cnt == 1) {
    //this.cateProc.decreaseCnt(contentsVO.getCateno());  // 글수 감소
    mav.setViewName("redirect:/event/list_paging.do"); // webapp/event/delete_msg.jsp
    // mav.setViewName("redirect:/contents/list.do"); // spring 재호출
  } else { 
    mav.setViewName("/event/delete_msg"); // webapp/event/delete_msg.jsp
  }
  
  return mav;
}

/**
 * 글의 패스워드 체크, JSON 출력
 * @return
 */
@ResponseBody
@RequestMapping(value="/event/event_passwd.do", method=RequestMethod.GET ,
                            produces = "text/plain;charset=UTF-8" )
public String event_passwd(int eventno, String event_passwd) {
  HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
  hashMap.put("eventno", eventno);
  hashMap.put("event_passwd", event_passwd);
  
  int cnt = this.eventProc.passwd_check(hashMap);
  
  JSONObject json = new JSONObject();
  json.put("cnt", cnt);
  
  return json.toString(); 
}

//http://localhost:9090/team4/event/jpg_create.do?eventno=28
/**
* IMG 등록 폼
* @return
*/
@RequestMapping(value="/event/jpg_create.do", 
                           method=RequestMethod.GET )
public ModelAndView jpg_create(int eventno) {
 ModelAndView mav = new ModelAndView();
 
 EventVO eventVO = this.eventProc.read(eventno);
 mav.addObject("eventVO", eventVO);

 System.out.println("--->>>" +eventVO.getEvent_img()); // 왜 안넘어가는지 확인, 
 mav.setViewName("/event/jpg_create"); // webapp/event/jpg_create.jsp
 
 return mav;
}

// http://localhost:9090/team4/event/jpg_create.do?eventno=28
/**
 * img 파일 등록
 * @param request
 * @param eventVO
 * @return
 */
@RequestMapping(value="/event/jpg_create.do", 
                            method=RequestMethod.POST )
public ModelAndView jpg_create(HttpServletRequest request,
                                                  EventVO eventVO) {
  System.out.println("--> jpg_create callend.");
  ModelAndView mav = new ModelAndView();
  // -------------------------------------------------------------------
  // 파일 전송 코드 시작
  // -------------------------------------------------------------------
  String event_img = ""; // img 파일 // 컬럼명!!!!!!!!!
  String event_timg = "";
  String upDir = Tool.getRealPath(request, "/event/storage/imgstorage"); // 절대 경로
  // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
  MultipartFile mf = eventVO.getEvent_imgMF();  // 파일 목록
  long fsize = mf.getSize();  // 파일 크기
  if (fsize > 0) { // 파일 크기 체크
    // mp3 = mf.getOriginalFilename(); // 원본 파일명, spring.jpg
    // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
    event_img = Upload.saveFileSpring(mf, upDir); // 컬럼명!!!!!!!!!
    
    if (Tool.isImage(event_img)) { // 이미지인지 검사
      // thumb 이미지 생성후 파일명 리턴됨, width: 120, height: 80
      event_timg = Tool.preview(upDir, event_img, 320, 280); 
    }
  }    
  // -------------------------------------------------------------------
  // 파일 전송 코드 종료
  // -------------------------------------------------------------------

  HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
  hashMap.put("event_img", event_img);  // 컬럼명!!!!!!!!!
  hashMap.put("event_timg", event_timg);
  hashMap.put("eventno", eventVO.getEventno());
  hashMap.put("event_passwd", eventVO.getEvent_passwd());
  
  this.eventProc.jpg(hashMap);
  
  mav.addObject("eventno", eventVO.getEventno());
  
  mav.setViewName("redirect:/event/read.do"); // webapp/event/read.jsp
  
  return mav;
  
}
//http://localhost:9090/team4/event/jpg_delete.do?eventno=28
/**
* 이미지 삭제 폼
* @return
*/
@RequestMapping(value="/event/jpg_delete.do", 
                           method=RequestMethod.GET )
public ModelAndView jpg_delete(int eventno) {
 ModelAndView mav = new ModelAndView();
 
 EventVO eventVO = this.eventProc.read(eventno);
 mav.addObject("eventVO", eventVO);
 
 mav.setViewName("/event/jpg_delete"); // webapp/event/mp3_delete.jsp
 
 return mav;
}

// http://localhost:9090/team4/event/jpg_delete.do?eventno=28
/**
 * 이미지 삭제처리
 * @param request
 * @param eventno
 * @param event_passwd
 * @return
 */
@RequestMapping(value="/event/jpg_delete.do", 
                           method=RequestMethod.POST )
public ModelAndView jpg_delete_proc(HttpServletRequest request,
                                                         int eventno,
                                                         String event_passwd){
 ModelAndView mav = new ModelAndView();
 
 // -------------------------------------------------------------------
 // 파일 삭제 코드 시작
 // -------------------------------------------------------------------
 // 삭제할 파일 정보를 읽어옴.
 EventVO eventVO = eventProc.read(eventno);

 System.out.println("img: " + eventVO.getEvent_img());
 
 String upDir = Tool.getRealPath(request, "/event/storage/imgstorage"); // 절대 경로
 boolean sw = Tool.deleteFile(upDir, eventVO.getEvent_img());  // Folder에서 1건의 파일 삭제
 System.out.println("sw: " + sw);
 // -------------------------------------------------------------------
 // 파일 삭제 종료 시작
 // -------------------------------------------------------------------
 
 HashMap<Object, Object> hashMap = new HashMap<Object, Object>();

 
 hashMap.put("event_img", ""); // <------????
 hashMap.put("event_timg", ""); 
 hashMap.put("eventno", eventno);
 hashMap.put("event_passwd", event_passwd);
 
 this.eventProc.jpg(hashMap);
 
 mav.addObject("eventno", eventno);
 
 mav.setViewName("redirect:/event/read.do"); // webapp/event/list.jsp
 
 return mav;
}


 
}
