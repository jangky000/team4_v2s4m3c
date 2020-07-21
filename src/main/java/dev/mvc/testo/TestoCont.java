package dev.mvc.testo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.testq.TestqProcInter;
import dev.mvc.testq.TestqVO;

@Controller
public class TestoCont {
  @Autowired
  @Qualifier("dev.mvc.testq.TestqProc")
  private TestqProcInter testqProc;
  
  @Autowired
  @Qualifier("dev.mvc.testo.TestoProc")
  
  private TestoProcInter testoProc;
  
  public TestoCont() {
    
    System.out.println("OOOOOO testoCont created");
  }
  
  /**
   * 등록 폼
   * @return
   */
  // http://localhost:9090/team4/testo/create.do
  
  @RequestMapping(value="/testo/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/testo/create"); // webapp/testo/create.jsp
    return mav;
  }
 
//http://localhost:9090/team4/testo/create.do
 /**
  * 등록 처리
  * @param testoVO
  * @return
  */

  @RequestMapping(value="/testo/create.do", method=RequestMethod.POST )
  public ModelAndView create(TestoVO testoVO) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.testoProc.create(testoVO);
    mav.addObject("cnt", cnt); // request에 저장
    
    if (cnt == 1) {
      mav.setViewName("redirect:/testo/list.do"); 
      // mav.setViewName("redirect:/testo/list.do"); // spring 재호출
    } else { 
      mav.setViewName("/testo/create_msg"); // webapp/testo/create_msg.jsp
    }
    
    return mav;
  }
  
  /**
   * 조회
   * @param testqno
   * @return
   */
   @RequestMapping(value="/testo/read.do", method=RequestMethod.GET )
   public ModelAndView read(int testono) {
     ModelAndView mav = new ModelAndView();

     TestoVO testoVO = this.testoProc.read(testono);
     mav.addObject("testoVO", testoVO); // request.setAttribute("contentsVO", contentsVO);

     mav.setViewName("/testo/read"); // /webapp/testq/read.jsp
     return mav;
   }
  
  /**
   * 전체 목록
   * @return
   */
  @RequestMapping(value="/testo/list.do", method=RequestMethod.GET )
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    
    List<TestoVO> list = this.testoProc.list();
    mav.addObject("list", list); // request.setAttribute("list", list);
    
    
    

    mav.setViewName("/testo/list"); // webapp/cate/list.jsp
    return mav;
  }
  
  /**
   * list_by_testqno
   * @return
   */
//  @RequestMapping(value="/testo/list_by_testqno.do", method=RequestMethod.GET )
//  public ModelAndView list_by_testqno() {
//    ModelAndView mav = new ModelAndView();
//    
//    List<TestoVO> list = this.testoProc.list_by_testqno();
//    mav.addObject("list", list); // request.setAttribute("list", list);
//
//    mav.setViewName("../testq/apply"); // webapp/cate/list.jsp
//    return mav;
//  }
  
  
  // http://localhost:9090/team4/testo/update_seqno_up.do?testono=1
  /**
   * 우선순위 상향 up 10 ▷ 1
   * @param cateno 조회할 카테고리 번호
   * @return
   */
  @RequestMapping(value="/testo/update_seqno_up.do", 
                              method=RequestMethod.GET )
  public ModelAndView update_seqno_up(int testono) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.testoProc.update_seqno_up(testono);  // 우선 순위 상향 처리

    mav.setViewName("redirect:/testo/list.do"); 
    return mav;
  }  

  // http://localhost:9090/team4/testo/update_seqno_down.do?testono=1
  /**
   * 우선순위 하향 up 1 ▷ 10
   * @param cateno 조회할 카테고리 번호
   * @return
   */
  @RequestMapping(value="/testo/update_seqno_down.do", 
                              method=RequestMethod.GET )
  public ModelAndView update_seqno_down(int testono) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.testoProc.update_seqno_down(testono);  // 우선 순위 상향 처리

    mav.setViewName("redirect:/testo/list.do"); 
    return mav;
  }  

  //http://localhost:9090/team4/testo/update.do
  /**
  * 수정 폼
  * @return
  */
  @RequestMapping(value="/testo/update.do", method=RequestMethod.GET )
  public ModelAndView update(int testono) {
   ModelAndView mav = new ModelAndView();
   System.out.println(testono);
   TestoVO testoVO = this.testoProc.read(testono);
   mav.addObject("testoVO", testoVO); 
   
   mav.setViewName("/testo/update"); // webapp/testo/update.jsp

   return mav;
}
  
//http://localhost:9090/team4/testo/update.do
 /**
  * 수정 처리
  * @param testoVO
  * @return
  */
 @RequestMapping(value="/testo/update.do", method=RequestMethod.POST )
 public ModelAndView update(TestoVO testoVO) {
   ModelAndView mav = new ModelAndView();
//   System.out.println("testoVO" +testoVO.getTestqno()+testoVO.getTestono()+testoVO.getTesto_seqno()+testoVO.getTesto_content());
   int cnt = this.testoProc.update(testoVO);
   mav.addObject("cnt", cnt); // request에 저장
   
   System.out.println("cnt"+ cnt);
   if (cnt == 1) {
     // mav.setViewName("/cate/update_msg"); // webapp/cate/update_msg.jsp
     mav.setViewName("redirect:/testo/list.do"); // spring 재호출
   } else { 
     mav.setViewName("/testo/update_msg"); // webapp/cate/update_msg.jsp
   }
   
   return mav;
 }
 
 /**
  * 삭제 폼
  * @return
  */
 @RequestMapping(value="/testo/delete.do", method=RequestMethod.GET )
 public ModelAndView delete(int testono) {
   ModelAndView mav = new ModelAndView();
   
   TestoVO testoVO = this.testoProc.read(testono); 
   mav.addObject("testoVO", testoVO);  
   
   mav.setViewName("/testo/delete"); 
   
   return mav;
 }
 
 // http://localhost:9090/team4/testo/delete.do
 /**
  * 삭제
  * @param categrpno 조회할 카테고리 번호
  * @return
  */
 @RequestMapping(value="/testo/delete.do", method=RequestMethod.POST )
 public ModelAndView delete_proc(int testono) {
   ModelAndView mav = new ModelAndView();
   
   TestoVO testoVO = this.testoProc.read(testono); 
   mav.addObject("testoVO", testoVO);  
   
   int cnt = this.testoProc.delete(testono); 
   mav.addObject("cnt", cnt);  
   
   if (cnt == 1) {

     mav.setViewName("redirect:/testo/list.do"); 
   } else { 
     mav.setViewName("/testq/delete_msg");
   }

   return mav;
 }
 
 // http://localhost:9090/resort/cate/list_join.do
 /**
  * categrp + cate join 전체 목록
  * @return
  */
 @RequestMapping(value="/testo/list_join.do", method=RequestMethod.GET )
 public ModelAndView list_join() {
   ModelAndView mav = new ModelAndView();
   
   List<Testq_Testo_join> list = this.testoProc.list_join();
   mav.addObject("list", list); // request.setAttribute("list", list);
   System.out.println("IMGGGG");
   mav.setViewName("/testo/list_join"); // webapp/cate/list_join.jsp
   return mav;
 }
 
 
  
}
