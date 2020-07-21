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
    System.out.println("�ڡڡڡ� eventCont created");
  }
  
  /**
   * ��� ��
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
  * ��� ó��
  * @param eventVO
  * @return
  */

  @RequestMapping(value="/event/create.do", method=RequestMethod.POST )
  public ModelAndView create(HttpServletRequest request,EventVO eventVO)
  {
    ModelAndView mav = new ModelAndView();
    
 // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    String event_img = ""; // img ���� // �÷���!!!!!!!!!
    String event_timg = "";
    String upDir = Tool.getRealPath(request, "/event/storage/imgstorage"); // ���� ���
    // ���� ������ ����� fnamesMF ��ü�� ������.
    MultipartFile mf = eventVO.getEvent_imgMF();  // ���� ���
    long fsize = mf.getSize();  // ���� ũ��
    if (fsize > 0) { // ���� ũ�� üũ
      // mp3 = mf.getOriginalFilename(); // ���� ���ϸ�, spring.jpg
      // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�, spring.jsp, spring_1.jpg...
      event_img = Upload.saveFileSpring(mf, upDir); // �÷���!!!!!!!!!
      
      if (Tool.isImage(event_img)) { // �̹������� �˻�
        // thumb �̹��� ������ ���ϸ� ���ϵ�, width: 120, height: 80
        event_timg = Tool.preview(upDir, event_img, 320, 280); 
      }
    }    
    // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    eventVO.setEvent_img(event_img);
    eventVO.setEvent_timg(event_timg);
    

    int cnt = this.eventProc.create(eventVO);
    mav.addObject("cnt", cnt); // request�� ����
    mav.addObject("url", "create_msg");
    
    if (cnt == 1) {
      mav.setViewName("redirect:/event/list_paging.do"); // webapp/cate/create_msg.jsp
      // mav.setViewName("redirect:/cate/list.do"); // spring ��ȣ��
    } else { 
      mav.setViewName("/event/create_msg"); // webapp/cate/create_msg.jsp
    }
    
    return mav;
  }
  
//http://localhost:9090/team4/event/list.do
 /**
  * ��ü ���
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
  * ��ȸ
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
 * ���  + ����¡ ����
 * http://localhost:9090/team4/event/list.do
 * http://localhost:9090/team4/event/list.do?cateno=1&word=������&nowPage=1
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

  // ���ڿ� ���ڿ� Ÿ���� �����ؾ������� Obejct ���
  HashMap<String, Object> map = new HashMap<String, Object>();
  map.put("eventno", eventno); // #{cateno}

  map.put("nowPage", nowPage); //�������� ����� ���ڵ��� ������ �����ϱ� ���� ���
  
  // �˻� ���
  List<EventVO> list = eventProc.list_paging(map);
  for (EventVO eventVO : list){
    System.out.println(eventVO.getEvent_timg());
  }
  System.out.println();
  mav.addObject("list", list);
  
  // �˻��� ���ڵ� ����
  int search_count = eventProc.search_count(map);
  mav.addObject("search_count", search_count);
  
  EventVO eventVO = this.eventProc.read(eventno); 
  mav.addObject("eventVO", eventVO);



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
  String paging = eventProc.pagingBox("list_paging.do", eventno, search_count, nowPage);
  mav.addObject("paging", paging);
  mav.addObject("nowPage", nowPage);
  
  // /contents/list_by_cateno_search_paging.jsp
  mav.setViewName("/event/list_paging_grid");   
  
  return mav;

}    

  //http://localhost:9090/resort/contents/update.do
  /**
  * ���� ��
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
   * ���� ó��
   * @param contentsVO
   * @return
   */
  @RequestMapping(value="/event/update.do", method=RequestMethod.POST )
  public ModelAndView update(HttpServletRequest request,EventVO eventVO) {
    ModelAndView mav = new ModelAndView();
//    read. file name ��������, �̸��� �ش��ϴ� ���� ����,
    // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    String event_img = ""; // img ���� // �÷���!!!!!!!!!
    String event_timg = "";
    String upDir = Tool.getRealPath(request, "/event/storage/imgstorage"); // ���� ���
    // ���� ������ ����� fnamesMF ��ü�� ������.
    MultipartFile mf = eventVO.getEvent_imgMF();  // ���� ���
    long fsize = mf.getSize();  // ���� ũ��
    if (fsize > 0) { // ���� ũ�� üũ
      // mp3 = mf.getOriginalFilename(); // ���� ���ϸ�, spring.jpg
      // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�, spring.jsp, spring_1.jpg...
      event_img = Upload.saveFileSpring(mf, upDir); // �÷���!!!!!!!!!
      
      if (Tool.isImage(event_img)) { // �̹������� �˻�
        // thumb �̹��� ������ ���ϸ� ���ϵ�, width: 120, height: 80
        event_timg = Tool.preview(upDir, event_img, 320, 280); 
      }
    }    
    // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    eventVO.setEvent_img(event_img);
    eventVO.setEvent_timg(event_timg);
    
    mav.addObject("eventno", eventVO.getEventno());
        
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("eventno", eventVO.getEventno());
    hashMap.put("event_passwd",  eventVO.getEvent_passwd());
    
    int passwd_cnt = 0; // �н����� ��ġ ���ڵ� ����
    int cnt = 0;             // ������ ���ڵ� ���� 
    
    passwd_cnt = this.eventProc.passwd_check(hashMap);
    
    if (passwd_cnt == 1) { // �н����� ��ġ
      cnt = this.eventProc.update(eventVO);
    }

    mav.addObject("cnt", cnt); // request�� ����
    mav.addObject("passwd_cnt", passwd_cnt); // request�� ����
        
    if (passwd_cnt == 1 && cnt == 1) {
      mav.setViewName("redirect:/event/list_paging.do"); // webapp/contents/update_msg.jsp
      // mav.setViewName("/event/update_msg"); // webapp/contents/update_msg.jsp
      // mav.setViewName("redirect:/event/list.do"); // spring ��ȣ��
    } else { 
      mav.setViewName("/event/update_msg"); // webapp/contents/update_msg.jsp
    }
    
    return mav;
  }
  
//http://localhost:9090/resort/event/delete.do
 /**
  * ���� ��
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
 * ���� ó��
 * @param contentsVO
 * @return
 */
@RequestMapping(value="/event/delete.do", method=RequestMethod.POST )
public ModelAndView delete(int eventno, String event_passwd) {
  ModelAndView mav = new ModelAndView();

  HashMap<String, Object> hashMap = new HashMap<String, Object>();
  hashMap.put("eventno", eventno);
  hashMap.put("event_passwd", event_passwd);
  
  int passwd_cnt = 0; // �н����� ��ġ ���ڵ� ����
  int cnt = 0;             // ������ ���ڵ� ���� 
  
  passwd_cnt = this.eventProc.passwd_check(hashMap);
  
  EventVO eventVO = this.eventProc.read(eventno); 
  String event_title = eventVO.getEvent_title(); // ����
  mav.addObject("event_title", event_title);
  
  if (passwd_cnt == 1) { // �н����� ��ġ
    cnt = this.eventProc.delete(eventno);
  }

  mav.addObject("cnt", cnt); // request�� ����
  mav.addObject("passwd_cnt", passwd_cnt); // request�� ����
      
  if (passwd_cnt == 1 && cnt == 1) {
    //this.cateProc.decreaseCnt(contentsVO.getCateno());  // �ۼ� ����
    mav.setViewName("redirect:/event/list_paging.do"); // webapp/event/delete_msg.jsp
    // mav.setViewName("redirect:/contents/list.do"); // spring ��ȣ��
  } else { 
    mav.setViewName("/event/delete_msg"); // webapp/event/delete_msg.jsp
  }
  
  return mav;
}

/**
 * ���� �н����� üũ, JSON ���
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
* IMG ��� ��
* @return
*/
@RequestMapping(value="/event/jpg_create.do", 
                           method=RequestMethod.GET )
public ModelAndView jpg_create(int eventno) {
 ModelAndView mav = new ModelAndView();
 
 EventVO eventVO = this.eventProc.read(eventno);
 mav.addObject("eventVO", eventVO);

 System.out.println("--->>>" +eventVO.getEvent_img()); // �� �ȳѾ���� Ȯ��, 
 mav.setViewName("/event/jpg_create"); // webapp/event/jpg_create.jsp
 
 return mav;
}

// http://localhost:9090/team4/event/jpg_create.do?eventno=28
/**
 * img ���� ���
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
  // ���� ���� �ڵ� ����
  // -------------------------------------------------------------------
  String event_img = ""; // img ���� // �÷���!!!!!!!!!
  String event_timg = "";
  String upDir = Tool.getRealPath(request, "/event/storage/imgstorage"); // ���� ���
  // ���� ������ ����� fnamesMF ��ü�� ������.
  MultipartFile mf = eventVO.getEvent_imgMF();  // ���� ���
  long fsize = mf.getSize();  // ���� ũ��
  if (fsize > 0) { // ���� ũ�� üũ
    // mp3 = mf.getOriginalFilename(); // ���� ���ϸ�, spring.jpg
    // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�, spring.jsp, spring_1.jpg...
    event_img = Upload.saveFileSpring(mf, upDir); // �÷���!!!!!!!!!
    
    if (Tool.isImage(event_img)) { // �̹������� �˻�
      // thumb �̹��� ������ ���ϸ� ���ϵ�, width: 120, height: 80
      event_timg = Tool.preview(upDir, event_img, 320, 280); 
    }
  }    
  // -------------------------------------------------------------------
  // ���� ���� �ڵ� ����
  // -------------------------------------------------------------------

  HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
  hashMap.put("event_img", event_img);  // �÷���!!!!!!!!!
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
* �̹��� ���� ��
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
 * �̹��� ����ó��
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
 // ���� ���� �ڵ� ����
 // -------------------------------------------------------------------
 // ������ ���� ������ �о��.
 EventVO eventVO = eventProc.read(eventno);

 System.out.println("img: " + eventVO.getEvent_img());
 
 String upDir = Tool.getRealPath(request, "/event/storage/imgstorage"); // ���� ���
 boolean sw = Tool.deleteFile(upDir, eventVO.getEvent_img());  // Folder���� 1���� ���� ����
 System.out.println("sw: " + sw);
 // -------------------------------------------------------------------
 // ���� ���� ���� ����
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
