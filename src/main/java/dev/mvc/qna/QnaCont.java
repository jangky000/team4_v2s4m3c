package dev.mvc.qna;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;


@Controller
public class QnaCont {

  @Autowired
  @Qualifier("dev.mvc.qna.QnaProc")
  private QnaProcInter qnaProc;

  
  public QnaCont() {
    System.out.println("--> QnaCont created.");

  }
  
  // http://localhost:9090/team4/qna/create.do
  /**
   * ��� ��
   * @return
   */
  @RequestMapping(value="/qna/create.do", method=RequestMethod.GET )
    public ModelAndView create() {
    ModelAndView mav = new ModelAndView();

    mav.setViewName("/qna/create"); // webapp/cate/create.jsp
    
    return mav;
  }
  

  /**
   * ��� ó��
   * @param cateVO
   * @return
   */
  @RequestMapping(value="/qna/create.do", method=RequestMethod.POST )
  public ModelAndView create(HttpServletRequest request, QnaVO qnaVO) {
    ModelAndView mav = new ModelAndView();
    // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    String upfile = "";     // main image
    String thumb = ""; // preview image
        
    String upDir = Tool.getRealPath(request, "/qna/storage/main_images"); // ���� ���
    // ���� ������ ����� fnamesMF ��ü�� ������.
    MultipartFile mf = qnaVO.getFileMF();
    long fsize = mf.getSize();  // ���� ũ��
    if (fsize > 0) { // ���� ũ�� üũ
      // mp3 = mf.getOriginalFilename(); // ���� ���ϸ�, spring.jpg
      // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�, spring.jsp, spring_1.jpg...
      upfile = Upload.saveFileSpring(mf, upDir); 
      
      if (Tool.isImage(upfile)) { // �̹������� �˻�
        // thumb �̹��� ������ ���ϸ� ���ϵ�, width: 120, height: 80
        thumb = Tool.preview(upDir, upfile, 250, 200); 
      }
      
    }    
    // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    // �١ڡ١� ip �˻絵 �������� �١ڡ١�
    // itemVO.setIp(request.getRemoteAddr()); // ������ IP
    
    // PK return ��
    qnaVO.setUpfile(upfile);
    qnaVO.setThumb(thumb);
    qnaVO.setFsize(fsize);
    
    int cnt = this.qnaProc.create(qnaVO);
    mav.addObject("cnt", cnt); // request�� ����
    
    if (cnt == 1) {
      //mav.setViewName("/qna/create_msg"); // webapp/cate/create_msg.jsp
       mav.setViewName("redirect:/qna/list.do"); // spring ��ȣ��
    } else { 
      mav.setViewName("/qna/create_msg"); // webapp/cate/create_msg.jsp
    }
    
    return mav;
  }

  
  //http://localhost:9090/team4/qna/list.do
/**
 * ��ü ���
 * @return
 */
@RequestMapping(value="/qna/list.do", method=RequestMethod.GET )
public ModelAndView list() {
  ModelAndView mav = new ModelAndView();
  
  List<QnaVO> list = this.qnaProc.list_all();
  mav.addObject("list", list); // request.setAttribute("list", list);

  mav.setViewName("/qna/list"); // webapp/qna/list.jsp
  return mav;
}
  
// http://localhost:9090/team4/qna/read.do
/**
 * ��ȸ 
 * @return
 */
@RequestMapping(value="/qna/read.do", method=RequestMethod.GET )
public ModelAndView read(int qnano) {
  ModelAndView mav = new ModelAndView();

  QnaVO qnaVO = this.qnaProc.read(qnano);
  mav.addObject("qnaVO", qnaVO); // request.setAttribute("qnaVO", qnaVO);
  
  
  
  mav.setViewName("/qna/read"); // /webapp/qna/read.jsp
  return mav;   
}
 
// http://localhost:9090/team4/note/update.do
/**
 * ���� ��
 * @return
 */
@RequestMapping(value="/qna/update.do", method=RequestMethod.GET )
  public ModelAndView update(int qnano) {
  ModelAndView mav = new ModelAndView();
  
  QnaVO qnaVO = this.qnaProc.read(qnano);
  mav.addObject("qnaVO", qnaVO);
  
  mav.setViewName("/qna/update"); // webapp/cate/create.jsp
  
  return mav;
}

//http://localhost:9090/team4/note/update.do
/**
 * ���� ó��
 * @param noteVO
 * @return
 */
@RequestMapping(value="/qna/update.do", method=RequestMethod.POST )
public ModelAndView update(QnaVO qnaVO) {
  
  ModelAndView mav = new ModelAndView();


  HashMap<String, Object> hashMap = new HashMap<String, Object>();
  hashMap.put("qnano", qnaVO.getQnano());
  hashMap.put("qna_pass", qnaVO.getQna_pass());
  
  System.out.println("--> qnano: " + qnaVO.getQnano());
  System.out.println("--> qna_pass: " +qnaVO.getQna_pass());
  
  
  int passwd_cnt = 0; // �н����� ��ġ ���ڵ� ����
  int cnt = 0;             // ������ ���ڵ� ���� 
  
  passwd_cnt = this.qnaProc.passwd_check(hashMap);
  System.out.println("--> passwd_cnt: " + passwd_cnt);
  
  if (passwd_cnt == 1) { // �н����� ��ġ
    cnt = this.qnaProc.update(qnaVO);
  }

  mav.addObject("cnt", cnt); // request�� ����
  mav.addObject("passwd_cnt", passwd_cnt); // request�� ����
      
  if (passwd_cnt == 1 && cnt == 1) {
    mav.setViewName("redirect:/qna/list.do");  //����Ʈ�� �ٷ��̵�
    // mav.setViewName("/contents/update_msg"); // webapp/contents/update_msg.jsp
    // mav.setViewName("redirect:/contents/list.do"); // spring ��ȣ��
  } else { 
    mav.setViewName("redirect:/qna/update_msg.jsp"); // webapp/contents/update_msg.jsp
  }
  
  return mav;
}
 
// http://localhost:9090/team4/note/read.do
/**
 * ������
 * @return
 */
@RequestMapping(value="/qna/delete.do", method=RequestMethod.GET )
public ModelAndView read_delete(int qnano) {
  ModelAndView mav = new ModelAndView();
  
  QnaVO qnaVO = this.qnaProc.read(qnano);
  mav.addObject("qnaVO", qnaVO); // request.setAttribute("noteVO", noteVO);

  
  mav.setViewName("/qna/delete"); // /webapp/note/read.jsp
  return mav;
  
}

// http://localhost:9090/resort/contents/delete.do
/**
 * ���� ó��
 * @param contentsVO
 * @return
 */
@RequestMapping(value="/qna/delete.do", method=RequestMethod.POST )
public ModelAndView delete(int qnano, String qna_pass) {
  ModelAndView mav = new ModelAndView();

  HashMap<String, Object> hashMap = new HashMap<String, Object>();
  hashMap.put("qnano", qnano);
  hashMap.put("qna_pass", qna_pass);
  
  int passwd_cnt = 0; // �н����� ��ġ ���ڵ� ����
  int cnt = 0;             // ������ ���ڵ� ���� 
  
  passwd_cnt = this.qnaProc.passwd_check(hashMap);
  
  QnaVO qnaVO = this.qnaProc.read(qnano); 
  mav.addObject("qnano", qnano);
  
  if (passwd_cnt == 1) { // �н����� ��ġ
    cnt = this.qnaProc.delete(qnano);
  }

  mav.addObject("cnt", cnt); // request�� ����
  mav.addObject("passwd_cnt", passwd_cnt); // request�� ����
      
  if (passwd_cnt == 1 && cnt == 1) {
    mav.setViewName("/qna/delete_msg"); // webapp/contents/delete_msg.jsp
    // mav.setViewName("redirect:/contents/list.do"); // spring ��ȣ��
  } else { 
    mav.setViewName("/qna/delete_msg"); // webapp/contents/delete_msg.jsp
  }
  
  return mav;
}
  
  
  
  
  
  
}
