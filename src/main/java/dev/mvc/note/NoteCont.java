package dev.mvc.note;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;





@Controller
public class NoteCont {

  @Autowired
  @Qualifier("dev.mvc.note.NoteProc")
  private NoteProcInter noteProc;
  
  public NoteCont() {
    System.out.println("--> NoteCont created.");
  }

  
  // http://localhost:9090/team4/note/create.do
  /**
   * 등록 폼
   * @return
   */
  @RequestMapping(value="/note/create.do", method=RequestMethod.GET )
    public ModelAndView create() {
    ModelAndView mav = new ModelAndView();

    mav.setViewName("/note/create"); // webapp/cate/create.jsp
    
    return mav;
  }
  
//http://localhost:9090/team4/note/create.do
  /**
   * 등록 처리
   * @param noteVO
   * @return
   */
  @RequestMapping(value="/note/create.do", method=RequestMethod.POST )
  public ModelAndView create(NoteVO noteVO) {
    
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.noteProc.create(noteVO);
    mav.addObject("cnt", cnt); // request에 저장
    

    if (cnt == 1) {
      mav.setViewName("/note/create_msg"); // webapp/cate/create_msg.jsp
      // mav.setViewName("redirect:/note/list.do"); // spring 재호출
    } else { 
      mav.setViewName("/note/create_msg"); // webapp/cate/create_msg.jsp
    }
    
    return mav;
  }
  
    //http://localhost:9090/team4/note/list.do
  /**
   * 전체 목록
   * @return
   */
  @RequestMapping(value="/note/list.do", method=RequestMethod.GET )
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    
    List<NoteVO> list = this.noteProc.list_all();
    mav.addObject("list", list); // request.setAttribute("list", list);

    mav.setViewName("/note/list"); // webapp/note/list.jsp
    return mav;
  }
  
  // http://localhost:9090/team4/note/read.do
  /**
   * 조회 
   * @return
   */
  @RequestMapping(value="/note/read.do", method=RequestMethod.GET )
  public ModelAndView read_update(int noteno) {
    ModelAndView mav = new ModelAndView();

    NoteVO noteVO = this.noteProc.read(noteno);
    mav.addObject("noteVO", noteVO); // request.setAttribute("noteVO", noteVO);
    
    mav.setViewName("/note/read"); // /webapp/note/read.jsp
    return mav;   
  }
  
  // http://localhost:9090/team4/note/update.do
  /**
   * 수정 폼
   * @return
   */
  @RequestMapping(value="/note/update.do", method=RequestMethod.GET )
    public ModelAndView update(int noteno) {
    ModelAndView mav = new ModelAndView();
    
    NoteVO noteVO = this.noteProc.read(noteno);
    mav.addObject("noteVO", noteVO);
    
    mav.setViewName("/note/update"); // webapp/cate/create.jsp
    
    return mav;
  }
  
//http://localhost:9090/team4/note/update.do
  /**
   * 수정 처리
   * @param noteVO
   * @return
   */
  @RequestMapping(value="/note/update.do", method=RequestMethod.POST )
  public ModelAndView update(NoteVO noteVO) {
    
    ModelAndView mav = new ModelAndView();

  
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("noteno", noteVO.getNoteno());
    hashMap.put("note_pass", noteVO.getnote_pass());
    
    System.out.println("--> noteno: " + noteVO.getNoteno());
    System.out.println("--> note_pass: " + noteVO.getnote_pass());
    
    
    int passwd_cnt = 0; // 패스워드 일치 레코드 갯수
    int cnt = 0;             // 수정된 레코드 갯수 
    
    passwd_cnt = this.noteProc.passwd_check(hashMap);
    System.out.println("--> passwd_cnt: " + passwd_cnt);
    
    if (passwd_cnt == 1) { // 패스워드 일치
      cnt = this.noteProc.update(noteVO);
    }

    mav.addObject("cnt", cnt); // request에 저장
    mav.addObject("passwd_cnt", passwd_cnt); // request에 저장
        
    if (passwd_cnt == 1 && cnt == 1) {
      mav.setViewName("redirect:/note/list.do"); 
      // mav.setViewName("/contents/update_msg"); // webapp/contents/update_msg.jsp
      // mav.setViewName("redirect:/contents/list.do"); // spring 재호출
    } else { 
      mav.setViewName("redirect:/note/update_msg.jsp"); // webapp/contents/update_msg.jsp
    }
    
    return mav;
  }
  
  // http://localhost:9090/team4/note/read.do
  /**
   * 삭제폼
   * @return
   */
  @RequestMapping(value="/note/delete.do", method=RequestMethod.GET )
  public ModelAndView read_delete(int noteno) {
    ModelAndView mav = new ModelAndView();
    
    NoteVO noteVO = this.noteProc.read(noteno);
    mav.addObject("noteVO", noteVO); // request.setAttribute("noteVO", noteVO);

    
    mav.setViewName("/note/delete"); // /webapp/note/read.jsp
    return mav;
    
  }
  
  // http://localhost:9090/resort/contents/delete.do
  /**
   * 삭제 처리
   * @param contentsVO
   * @return
   */
  @RequestMapping(value="/note/delete.do", method=RequestMethod.POST )
  public ModelAndView delete(int noteno, String note_pass) {
    ModelAndView mav = new ModelAndView();

    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("noteno", noteno);
    hashMap.put("note_pass", note_pass);
    
    int passwd_cnt = 0; // 패스워드 일치 레코드 갯수
    int cnt = 0;             // 삭제된 레코드 갯수 
    
    passwd_cnt = this.noteProc.passwd_check(hashMap);
    
    NoteVO noteVO = this.noteProc.read(noteno); 
    mav.addObject("noteno", noteno);
    
    if (passwd_cnt == 1) { // 패스워드 일치
      cnt = this.noteProc.delete(noteno);
    }

    mav.addObject("cnt", cnt); // request에 저장
    mav.addObject("passwd_cnt", passwd_cnt); // request에 저장
        
    if (passwd_cnt == 1 && cnt == 1) {
      mav.setViewName("/note/delete_msg"); // webapp/contents/delete_msg.jsp
      // mav.setViewName("redirect:/contents/list.do"); // spring 재호출
    } else { 
      mav.setViewName("/note/delete_msg"); // webapp/contents/delete_msg.jsp
    }
    
    return mav;
  }
  
  
  
  
  
}
