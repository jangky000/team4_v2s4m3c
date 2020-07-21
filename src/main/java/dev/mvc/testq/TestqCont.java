package dev.mvc.testq;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.event.EventVO;
import dev.mvc.testo.TestoProcInter;
import dev.mvc.testo.TestoVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;


@Controller
public class TestqCont {
  @Autowired
  @Qualifier("dev.mvc.testq.TestqProc")
  private TestqProcInter testqProc;
  
  @Autowired
  @Qualifier("dev.mvc.testo.TestoProc")
  private TestoProcInter testoProc;
  
  
  public TestqCont() {
    
    System.out.println("★★★★ testqCont created");
  }
  
  /**
   * 등록 폼
   * @return
   */
  // http://localhost:9090/team4/testq/create.do
  
  @RequestMapping(value="/testq/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/testq/create"); // webapp/testq/create.jsp
    return mav;
  }

//http://localhost:9090/team4/testq/create.do
 /**
  * 등록 처리
  * @param testqVO
  * @return
  */

  @RequestMapping(value="/testq/create.do", method=RequestMethod.POST )
  public ModelAndView create(HttpServletRequest request,TestqVO testqVO) {
    ModelAndView mav = new ModelAndView();
    
    // -------------------------------------------------------------------
    // 파일 전송 코드 시작
    // -------------------------------------------------------------------
    String testq_img = ""; // img 파일 // 컬럼명!!!!!!!!!
    String testq_timg = "";
    String upDir = Tool.getRealPath(request, "/testq/storage/imgstorage"); // 절대 경로
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    MultipartFile mf = testqVO.getTestq_imgMF();  // 파일 목록
    long fsize = mf.getSize();  // 파일 크기
    if (fsize > 0) { // 파일 크기 체크
      testq_img = Upload.saveFileSpring(mf, upDir); // 컬럼명!!!!!!!!!
      
      if (Tool.isImage(testq_img)) { // 이미지인지 검사
        // thumb 이미지 생성후 파일명 리턴됨, width: 120, height: 80
        testq_timg = Tool.preview(upDir, testq_img, 320, 280); 
      }
    }    
    // -------------------------------------------------------------------
    // 파일 전송 코드 종료
    // -------------------------------------------------------------------
    
    testqVO.setTestq_img(testq_img);
    testqVO.setTestq_timg(testq_timg);
    
    int cnt = this.testqProc.create(testqVO);
    mav.addObject("cnt", cnt); // request에 저장
    mav.addObject("url", "create_msg");

    if (cnt == 1) {
      mav.setViewName("redirect:/testq/list_paging.do"); 
      // mav.setViewName("redirect:/testq/list.do"); // spring 재호출
    } else { 
      mav.setViewName("/testq/create_msg"); // webapp/testq/create_msg.jsp
    }
    
    return mav;
  }
  
  /**
   * 조회
   * @param testqno
   * @return
   */
   @RequestMapping(value="/testq/read.do", method=RequestMethod.GET )
   public ModelAndView read(int testqno) {
     ModelAndView mav = new ModelAndView();

     TestqVO testqVO = this.testqProc.read(testqno);
     mav.addObject("testqVO", testqVO); // request.setAttribute("contentsVO", contentsVO);

     mav.setViewName("/testq/read"); // /webapp/testq/read.jsp
     return mav;
   }
   
   /**
    * 참여
    * @param testqno
    * @return
    */
    @RequestMapping(value="/testq/apply.do", method=RequestMethod.GET )
    public ModelAndView apply(int testqno) {
      testqno = testqno+1;
      ModelAndView mav = new ModelAndView();

      
      TestqVO testqVO = this.testqProc.read(testqno);
      List<TestoVO> list = this.testoProc.list_by_testqno(testqno);
      
      mav.addObject("testqVO", testqVO); 
      mav.addObject("list", list);
     

      mav.setViewName("/testq/apply"); // /webapp/testq/read.jsp
      return mav;
    }
    
    /**
     * 테스트 설문 저장
     * @param testqno
     * @return
     */
     @RequestMapping(value="/testq/test_result.do", method=RequestMethod.POST )
     public ModelAndView test_result(HttpSession session, HttpServletRequest request) {
       ModelAndView mav = new ModelAndView();
       int memno = 1; // session.getAttribute('memno');
       Cookie[] cookies= request.getCookies();
       Cookie cookie = null;
       
       if (cookies !=null) {
         for (int i = 0; i < cookies.length; i++) {
           cookie = cookies[i];
           String name = cookie.getName();
           
           try {
             if(name.substring(0, 2).equals("tq")) {
               int num = Integer.parseInt(name.substring(2));
               if(num >= 0 && num < 13) {
                 System.out.println("testqno: "+ name + " testo_seqno" + cookie.getValue());
                 // PK, memno, testqno( = num+1), Interger.parseInt(testo_seqno)
                 // 저장테이블 , PK, memno, testqno, testo_seqno
               }
             }
             
           } catch (Exception e) {
            // System.out.println(e);
          }
           
        }
        
      }
       
       
       
       mav.setViewName("redirect:/testq/test_result.jsp"); // /webapp/testq/read.jsp
       return mav;
     }
   
  /**
   * 목록  + 페이징 지원
   * http://localhost:9090/team4/testq/list.do
   * http://localhost:9090/team4/testq/list.do?cateno=1&word=스위스&nowPage=1
   * @param cateno
   * @param word
   * @param nowPage
   * @return
   */
  @RequestMapping(value = "/testq/list_paging.do", 
                                       method = RequestMethod.GET)
  public ModelAndView list(
      @RequestParam(value="testqno", defaultValue="1") int testqno,
      @RequestParam(value="nowPage", defaultValue="1") int nowPage
      ) { 
    System.out.println("--> nowPage: " + nowPage);
    
    ModelAndView mav = new ModelAndView();

    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("testqno", testqno); // #{cateno}

    map.put("nowPage", nowPage); //페이지에 출력할 레코드의 범위를 산출하기 위해 사용
    
    // 검색 목록
    List<TestqVO> list = testqProc.list_paging(map);
    for (TestqVO testqVO : list){
      System.out.println(testqVO.getTestq_timg());
    }
    mav.addObject("list", list);
    
    // 검색된 레코드 갯수
    int search_count = testqProc.search_count(map);
    mav.addObject("search_count", search_count);
    
    TestqVO testqVO = this.testqProc.read(testqno); 
    mav.addObject("testqVO", testqVO);
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
    String paging = testqProc.pagingBox("list_paging.do", testqno, search_count, nowPage);
    mav.addObject("paging", paging);
    mav.addObject("nowPage", nowPage);
    
    // /contents/list_by_cateno_search_paging.jsp
    mav.setViewName("/testq/list_paging_grid");   
    
    return mav;
    
  }
  
  //http://localhost:9090/team4/testq/update.do
  /**
  * 수정 폼
  * @return
  */
  @RequestMapping(value="/testq/update.do", method=RequestMethod.GET )
  public ModelAndView update(int testqno) {
   ModelAndView mav = new ModelAndView();
   System.out.println(testqno);
   TestqVO testqVO = this.testqProc.read(testqno);
   mav.addObject("testqVO", testqVO); 
   
   mav.setViewName("/testq/update"); // webapp/testq/update.jsp

   return mav;
}
  
  
  // http://localhost:9090/team4/testq/update.do
  /**
   * 수정 처리
   * @param cateVO
   * @return
   */
  @RequestMapping(value="/testq/update.do", method=RequestMethod.POST )
  public ModelAndView update(HttpServletRequest request,TestqVO testqVO) {
    ModelAndView mav = new ModelAndView();
    // -------------------------------------------------------------------
    // 파일 전송 코드 시작
    // -------------------------------------------------------------------
    String testq_img = ""; // img 파일 // 컬럼명!!!!!!!!!
    String testq_timg = "";
    String upDir = Tool.getRealPath(request, "/testq/storage/imgstorage"); // 절대 경로
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    MultipartFile mf = testqVO.getTestq_imgMF();  // 파일 목록
    long fsize = mf.getSize();  // 파일 크기
    if (fsize > 0) { // 파일 크기 체크
      // mp3 = mf.getOriginalFilename(); // 원본 파일명, spring.jpg
      // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
      testq_img = Upload.saveFileSpring(mf, upDir); // 컬럼명!!!!!!!!!
      
      if (Tool.isImage(testq_img)) { // 이미지인지 검사
        // thumb 이미지 생성후 파일명 리턴됨, width: 120, height: 80
        testq_timg = Tool.preview(upDir, testq_img, 320, 280); 
      }
    }    
    // -------------------------------------------------------------------
    // 파일 전송 코드 종료
    // -------------------------------------------------------------------
    
    testqVO.setTestq_img(testq_img);
    testqVO.setTestq_timg(testq_timg);
    
    mav.addObject("testqno",testqVO.getTestqno());
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("testqno", testqVO.getTestqno());

    int cnt=0;

    cnt=this.testqProc.update(testqVO);
    
    if (cnt == 1) {
      cnt = this.testqProc.update(testqVO);
      mav.addObject("cnt", cnt); 
      mav.setViewName("redirect:/testq/list_paging.do");
    } else { 
      mav.setViewName("/testq/update_msg"); 
    }
    
    return mav;
  }
  
  // http://localhost:9090/team4/testq/delete.do
  
  /**
   * 삭제 폼
   * @return
   */
  @RequestMapping(value="/testq/delete.do", method=RequestMethod.GET )
  public ModelAndView delete(int testqno) {
    ModelAndView mav = new ModelAndView();
    
    TestqVO testqVO = this.testqProc.read(testqno); 
    mav.addObject("testqVO", testqVO);  
    
    mav.setViewName("/testq/delete"); 
    
    return mav;
  }
  
  // http://localhost:9090/team4/testq/delete.do
  /**
   * 삭제
   * @param categrpno 조회할 카테고리 번호
   * @return
   */
  @RequestMapping(value="/testq/delete.do", method=RequestMethod.POST )
  public ModelAndView delete_proc(int testqno) {
    ModelAndView mav = new ModelAndView();
    
    TestqVO testqVO = this.testqProc.read(testqno); 
    mav.addObject("testqVO", testqVO);  
    
    int cnt = this.testqProc.delete(testqno); 
    mav.addObject("cnt", cnt);  
    
    if (cnt == 1) {

      mav.setViewName("redirect:/testq/list_paging.do"); 
    } else { 
      mav.setViewName("/testq/delete_msg");
    }

    return mav;
  }
  
//http://localhost:9090/team4/event/jpg_create.do?eventno=28
/**
* IMG 등록 폼
* @return
*/
@RequestMapping(value="/testq/jpg_create.do", 
                           method=RequestMethod.GET )
public ModelAndView jpg_create(int testqno) {
 ModelAndView mav = new ModelAndView();
 
 TestqVO testqVO = this.testqProc.read(testqno);
 mav.addObject("testqVO", testqVO);

System.out.println("--->>>" +testqVO.getTestqno());
 System.out.println("--->>>" +testqVO.getTestq_img()); // 왜 안넘어가는지 확인, 
 mav.setViewName("/testq/jpg_create"); // webapp/event/jpg_create.jsp
 
 return mav;
}

// http://localhost:9090/team4/event/jpg_create.do?eventno=28
/**
 * img 파일 등록
 * @param request
 * @param eventVO
 * @return
 */
@RequestMapping(value="/testq/jpg_create.do", 
                            method=RequestMethod.POST )
public ModelAndView jpg_create(HttpServletRequest request,
                                                  TestqVO testqVO) {
  System.out.println("--> jpg_create callend.");
  ModelAndView mav = new ModelAndView();
  // -------------------------------------------------------------------
  // 파일 전송 코드 시작
  // -------------------------------------------------------------------
  String testq_img = ""; // img 파일 // 컬럼명!!!!!!!!!
  String testq_timg = "";
  String upDir = Tool.getRealPath(request, "/testq/storage/imgstorage"); // 절대 경로
  // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
  MultipartFile mf = testqVO.getTestq_imgMF();  // 파일 목록
  long fsize = mf.getSize();  // 파일 크기
  if (fsize > 0) { // 파일 크기 체크
    // mp3 = mf.getOriginalFilename(); // 원본 파일명, spring.jpg
    // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
    testq_img = Upload.saveFileSpring(mf, upDir); // 컬럼명!!!!!!!!!
    
    if (Tool.isImage(testq_img)) { // 이미지인지 검사
      // thumb 이미지 생성후 파일명 리턴됨, width: 120, height: 80
      testq_img = Tool.preview(upDir, testq_img, 320, 280); 
    }
  }    
  // -------------------------------------------------------------------
  // 파일 전송 코드 종료
  // -------------------------------------------------------------------

  HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
  hashMap.put("testq_img", testq_img);  // 컬럼명!!!!!!!!!
  hashMap.put("testq_timg", testq_timg);
  hashMap.put("testqno", testqVO.getTestqno());

  
  this.testqProc.jpg(hashMap);
  
  mav.addObject("testqno", testqVO.getTestqno());
  
  mav.setViewName("redirect:/testq/read.do"); // webapp/event/read.jsp
  
  return mav;
  
}
//http://localhost:9090/team4/event/jpg_delete.do?eventno=28
/**
* 이미지 삭제 폼
* @return
*/
@RequestMapping(value="/testq/jpg_delete.do", 
                           method=RequestMethod.GET )
public ModelAndView jpg_delete(int testqno) {
 ModelAndView mav = new ModelAndView();
 
 TestqVO testqVO = this.testqProc.read(testqno);
 mav.addObject("TestqVO", testqVO);
 
 mav.setViewName("/testq/jpg_delete"); // webapp/event/mp3_delete.jsp
 
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
@RequestMapping(value="/testq/jpg_delete.do", 
                           method=RequestMethod.POST )
public ModelAndView jpg_delete_proc(HttpServletRequest request,
                                                         int testqno
                                                         ){
 ModelAndView mav = new ModelAndView();
 
 // -------------------------------------------------------------------
 // 파일 삭제 코드 시작
 // -------------------------------------------------------------------
 // 삭제할 파일 정보를 읽어옴.
 TestqVO testqVO = this.testqProc.read(testqno);

 System.out.println("img: " + testqVO.getTestq_img());
 
 String upDir = Tool.getRealPath(request, "/testq/storage/imgstorage"); // 절대 경로
 boolean sw = Tool.deleteFile(upDir, testqVO.getTestq_img());  // Folder에서 1건의 파일 삭제
 System.out.println("sw: " + sw);
 // -------------------------------------------------------------------
 // 파일 삭제 종료 시작
 // -------------------------------------------------------------------
 
 HashMap<Object, Object> hashMap = new HashMap<Object, Object>();

 
 hashMap.put("testq_img", ""); 
 hashMap.put("testq_timg", ""); 
 hashMap.put("testqno", testqno);

 
 this.testqProc.jpg(hashMap);
 
 mav.addObject("testqno", testqno);
 
 mav.setViewName("redirect:/testq/read.do"); // webapp/event/list.jsp
 
 return mav;
}
  
  
}