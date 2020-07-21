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
    
    System.out.println("�ڡڡڡ� testqCont created");
  }
  
  /**
   * ��� ��
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
  * ��� ó��
  * @param testqVO
  * @return
  */

  @RequestMapping(value="/testq/create.do", method=RequestMethod.POST )
  public ModelAndView create(HttpServletRequest request,TestqVO testqVO) {
    ModelAndView mav = new ModelAndView();
    
    // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    String testq_img = ""; // img ���� // �÷���!!!!!!!!!
    String testq_timg = "";
    String upDir = Tool.getRealPath(request, "/testq/storage/imgstorage"); // ���� ���
    // ���� ������ ����� fnamesMF ��ü�� ������.
    MultipartFile mf = testqVO.getTestq_imgMF();  // ���� ���
    long fsize = mf.getSize();  // ���� ũ��
    if (fsize > 0) { // ���� ũ�� üũ
      testq_img = Upload.saveFileSpring(mf, upDir); // �÷���!!!!!!!!!
      
      if (Tool.isImage(testq_img)) { // �̹������� �˻�
        // thumb �̹��� ������ ���ϸ� ���ϵ�, width: 120, height: 80
        testq_timg = Tool.preview(upDir, testq_img, 320, 280); 
      }
    }    
    // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    
    testqVO.setTestq_img(testq_img);
    testqVO.setTestq_timg(testq_timg);
    
    int cnt = this.testqProc.create(testqVO);
    mav.addObject("cnt", cnt); // request�� ����
    mav.addObject("url", "create_msg");

    if (cnt == 1) {
      mav.setViewName("redirect:/testq/list_paging.do"); 
      // mav.setViewName("redirect:/testq/list.do"); // spring ��ȣ��
    } else { 
      mav.setViewName("/testq/create_msg"); // webapp/testq/create_msg.jsp
    }
    
    return mav;
  }
  
  /**
   * ��ȸ
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
    * ����
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
     * �׽�Ʈ ���� ����
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
                 // �������̺� , PK, memno, testqno, testo_seqno
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
   * ���  + ����¡ ����
   * http://localhost:9090/team4/testq/list.do
   * http://localhost:9090/team4/testq/list.do?cateno=1&word=������&nowPage=1
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

    // ���ڿ� ���ڿ� Ÿ���� �����ؾ������� Obejct ���
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("testqno", testqno); // #{cateno}

    map.put("nowPage", nowPage); //�������� ����� ���ڵ��� ������ �����ϱ� ���� ���
    
    // �˻� ���
    List<TestqVO> list = testqProc.list_paging(map);
    for (TestqVO testqVO : list){
      System.out.println(testqVO.getTestq_timg());
    }
    mav.addObject("list", list);
    
    // �˻��� ���ڵ� ����
    int search_count = testqProc.search_count(map);
    mav.addObject("search_count", search_count);
    
    TestqVO testqVO = this.testqProc.read(testqno); 
    mav.addObject("testqVO", testqVO);
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
    String paging = testqProc.pagingBox("list_paging.do", testqno, search_count, nowPage);
    mav.addObject("paging", paging);
    mav.addObject("nowPage", nowPage);
    
    // /contents/list_by_cateno_search_paging.jsp
    mav.setViewName("/testq/list_paging_grid");   
    
    return mav;
    
  }
  
  //http://localhost:9090/team4/testq/update.do
  /**
  * ���� ��
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
   * ���� ó��
   * @param cateVO
   * @return
   */
  @RequestMapping(value="/testq/update.do", method=RequestMethod.POST )
  public ModelAndView update(HttpServletRequest request,TestqVO testqVO) {
    ModelAndView mav = new ModelAndView();
    // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    String testq_img = ""; // img ���� // �÷���!!!!!!!!!
    String testq_timg = "";
    String upDir = Tool.getRealPath(request, "/testq/storage/imgstorage"); // ���� ���
    // ���� ������ ����� fnamesMF ��ü�� ������.
    MultipartFile mf = testqVO.getTestq_imgMF();  // ���� ���
    long fsize = mf.getSize();  // ���� ũ��
    if (fsize > 0) { // ���� ũ�� üũ
      // mp3 = mf.getOriginalFilename(); // ���� ���ϸ�, spring.jpg
      // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�, spring.jsp, spring_1.jpg...
      testq_img = Upload.saveFileSpring(mf, upDir); // �÷���!!!!!!!!!
      
      if (Tool.isImage(testq_img)) { // �̹������� �˻�
        // thumb �̹��� ������ ���ϸ� ���ϵ�, width: 120, height: 80
        testq_timg = Tool.preview(upDir, testq_img, 320, 280); 
      }
    }    
    // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
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
   * ���� ��
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
   * ����
   * @param categrpno ��ȸ�� ī�װ� ��ȣ
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
* IMG ��� ��
* @return
*/
@RequestMapping(value="/testq/jpg_create.do", 
                           method=RequestMethod.GET )
public ModelAndView jpg_create(int testqno) {
 ModelAndView mav = new ModelAndView();
 
 TestqVO testqVO = this.testqProc.read(testqno);
 mav.addObject("testqVO", testqVO);

System.out.println("--->>>" +testqVO.getTestqno());
 System.out.println("--->>>" +testqVO.getTestq_img()); // �� �ȳѾ���� Ȯ��, 
 mav.setViewName("/testq/jpg_create"); // webapp/event/jpg_create.jsp
 
 return mav;
}

// http://localhost:9090/team4/event/jpg_create.do?eventno=28
/**
 * img ���� ���
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
  // ���� ���� �ڵ� ����
  // -------------------------------------------------------------------
  String testq_img = ""; // img ���� // �÷���!!!!!!!!!
  String testq_timg = "";
  String upDir = Tool.getRealPath(request, "/testq/storage/imgstorage"); // ���� ���
  // ���� ������ ����� fnamesMF ��ü�� ������.
  MultipartFile mf = testqVO.getTestq_imgMF();  // ���� ���
  long fsize = mf.getSize();  // ���� ũ��
  if (fsize > 0) { // ���� ũ�� üũ
    // mp3 = mf.getOriginalFilename(); // ���� ���ϸ�, spring.jpg
    // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�, spring.jsp, spring_1.jpg...
    testq_img = Upload.saveFileSpring(mf, upDir); // �÷���!!!!!!!!!
    
    if (Tool.isImage(testq_img)) { // �̹������� �˻�
      // thumb �̹��� ������ ���ϸ� ���ϵ�, width: 120, height: 80
      testq_img = Tool.preview(upDir, testq_img, 320, 280); 
    }
  }    
  // -------------------------------------------------------------------
  // ���� ���� �ڵ� ����
  // -------------------------------------------------------------------

  HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
  hashMap.put("testq_img", testq_img);  // �÷���!!!!!!!!!
  hashMap.put("testq_timg", testq_timg);
  hashMap.put("testqno", testqVO.getTestqno());

  
  this.testqProc.jpg(hashMap);
  
  mav.addObject("testqno", testqVO.getTestqno());
  
  mav.setViewName("redirect:/testq/read.do"); // webapp/event/read.jsp
  
  return mav;
  
}
//http://localhost:9090/team4/event/jpg_delete.do?eventno=28
/**
* �̹��� ���� ��
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
 * �̹��� ����ó��
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
 // ���� ���� �ڵ� ����
 // -------------------------------------------------------------------
 // ������ ���� ������ �о��.
 TestqVO testqVO = this.testqProc.read(testqno);

 System.out.println("img: " + testqVO.getTestq_img());
 
 String upDir = Tool.getRealPath(request, "/testq/storage/imgstorage"); // ���� ���
 boolean sw = Tool.deleteFile(upDir, testqVO.getTestq_img());  // Folder���� 1���� ���� ����
 System.out.println("sw: " + sw);
 // -------------------------------------------------------------------
 // ���� ���� ���� ����
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