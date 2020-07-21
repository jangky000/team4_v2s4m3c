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
   * ��� ��
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
   * ��� ó��
   * @param noteVO
   * @return
   */
  @RequestMapping(value="/note/create.do", method=RequestMethod.POST )
  public ModelAndView create(NoteVO noteVO) {
    
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.noteProc.create(noteVO);
    mav.addObject("cnt", cnt); // request�� ����
    

    if (cnt == 1) {
      mav.setViewName("/note/create_msg"); // webapp/cate/create_msg.jsp
      // mav.setViewName("redirect:/note/list.do"); // spring ��ȣ��
    } else { 
      mav.setViewName("/note/create_msg"); // webapp/cate/create_msg.jsp
    }
    
    return mav;
  }
  
    //http://localhost:9090/team4/note/list.do
  /**
   * ��ü ���
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
   * ��ȸ 
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
   * ���� ��
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
   * ���� ó��
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
    
    
    int passwd_cnt = 0; // �н����� ��ġ ���ڵ� ����
    int cnt = 0;             // ������ ���ڵ� ���� 
    
    passwd_cnt = this.noteProc.passwd_check(hashMap);
    System.out.println("--> passwd_cnt: " + passwd_cnt);
    
    if (passwd_cnt == 1) { // �н����� ��ġ
      cnt = this.noteProc.update(noteVO);
    }

    mav.addObject("cnt", cnt); // request�� ����
    mav.addObject("passwd_cnt", passwd_cnt); // request�� ����
        
    if (passwd_cnt == 1 && cnt == 1) {
      mav.setViewName("redirect:/note/list.do"); 
      // mav.setViewName("/contents/update_msg"); // webapp/contents/update_msg.jsp
      // mav.setViewName("redirect:/contents/list.do"); // spring ��ȣ��
    } else { 
      mav.setViewName("redirect:/note/update_msg.jsp"); // webapp/contents/update_msg.jsp
    }
    
    return mav;
  }
  
  // http://localhost:9090/team4/note/read.do
  /**
   * ������
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
   * ���� ó��
   * @param contentsVO
   * @return
   */
  @RequestMapping(value="/note/delete.do", method=RequestMethod.POST )
  public ModelAndView delete(int noteno, String note_pass) {
    ModelAndView mav = new ModelAndView();

    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("noteno", noteno);
    hashMap.put("note_pass", note_pass);
    
    int passwd_cnt = 0; // �н����� ��ġ ���ڵ� ����
    int cnt = 0;             // ������ ���ڵ� ���� 
    
    passwd_cnt = this.noteProc.passwd_check(hashMap);
    
    NoteVO noteVO = this.noteProc.read(noteno); 
    mav.addObject("noteno", noteno);
    
    if (passwd_cnt == 1) { // �н����� ��ġ
      cnt = this.noteProc.delete(noteno);
    }

    mav.addObject("cnt", cnt); // request�� ����
    mav.addObject("passwd_cnt", passwd_cnt); // request�� ����
        
    if (passwd_cnt == 1 && cnt == 1) {
      mav.setViewName("/note/delete_msg"); // webapp/contents/delete_msg.jsp
      // mav.setViewName("redirect:/contents/list.do"); // spring ��ȣ��
    } else { 
      mav.setViewName("/note/delete_msg"); // webapp/contents/delete_msg.jsp
    }
    
    return mav;
  }
  
  
  
  
  
}
