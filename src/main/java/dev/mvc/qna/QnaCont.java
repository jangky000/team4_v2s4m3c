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
   * 등록 폼
   * @return
   */
  @RequestMapping(value="/qna/create.do", method=RequestMethod.GET )
    public ModelAndView create() {
    ModelAndView mav = new ModelAndView();

    mav.setViewName("/qna/create"); // webapp/cate/create.jsp
    
    return mav;
  }
  

  /**
   * 등록 처리
   * @param cateVO
   * @return
   */
  @RequestMapping(value="/qna/create.do", method=RequestMethod.POST )
  public ModelAndView create(HttpServletRequest request, QnaVO qnaVO) {
    ModelAndView mav = new ModelAndView();
    // -------------------------------------------------------------------
    // 파일 전송 코드 시작
    // -------------------------------------------------------------------
    String upfile = "";     // main image
    String thumb = ""; // preview image
        
    String upDir = Tool.getRealPath(request, "/qna/storage/main_images"); // 절대 경로
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    MultipartFile mf = qnaVO.getFileMF();
    long fsize = mf.getSize();  // 파일 크기
    if (fsize > 0) { // 파일 크기 체크
      // mp3 = mf.getOriginalFilename(); // 원본 파일명, spring.jpg
      // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
      upfile = Upload.saveFileSpring(mf, upDir); 
      
      if (Tool.isImage(upfile)) { // 이미지인지 검사
        // thumb 이미지 생성후 파일명 리턴됨, width: 120, height: 80
        thumb = Tool.preview(upDir, upfile, 250, 200); 
      }
      
    }    
    // -------------------------------------------------------------------
    // 파일 전송 코드 종료
    // -------------------------------------------------------------------
    // ☆★☆★ ip 검사도 만들어야함 ☆★☆★
    // itemVO.setIp(request.getRemoteAddr()); // 접속자 IP
    
    // PK return 됨
    qnaVO.setUpfile(upfile);
    qnaVO.setThumb(thumb);
    qnaVO.setFsize(fsize);
    
    int cnt = this.qnaProc.create(qnaVO);
    mav.addObject("cnt", cnt); // request에 저장
    
    if (cnt == 1) {
      //mav.setViewName("/qna/create_msg"); // webapp/cate/create_msg.jsp
       mav.setViewName("redirect:/qna/list.do"); // spring 재호출
    } else { 
      mav.setViewName("/qna/create_msg"); // webapp/cate/create_msg.jsp
    }
    
    return mav;
  }

  
  //http://localhost:9090/team4/qna/list.do
/**
 * 전체 목록
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
 * 조회 
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
 * 수정 폼
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
 * 수정 처리
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
  
  
  int passwd_cnt = 0; // 패스워드 일치 레코드 갯수
  int cnt = 0;             // 수정된 레코드 갯수 
  
  passwd_cnt = this.qnaProc.passwd_check(hashMap);
  System.out.println("--> passwd_cnt: " + passwd_cnt);
  
  if (passwd_cnt == 1) { // 패스워드 일치
    cnt = this.qnaProc.update(qnaVO);
  }

  mav.addObject("cnt", cnt); // request에 저장
  mav.addObject("passwd_cnt", passwd_cnt); // request에 저장
      
  if (passwd_cnt == 1 && cnt == 1) {
    mav.setViewName("redirect:/qna/list.do");  //리스트로 바로이동
    // mav.setViewName("/contents/update_msg"); // webapp/contents/update_msg.jsp
    // mav.setViewName("redirect:/contents/list.do"); // spring 재호출
  } else { 
    mav.setViewName("redirect:/qna/update_msg.jsp"); // webapp/contents/update_msg.jsp
  }
  
  return mav;
}
 
// http://localhost:9090/team4/note/read.do
/**
 * 삭제폼
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
 * 삭제 처리
 * @param contentsVO
 * @return
 */
@RequestMapping(value="/qna/delete.do", method=RequestMethod.POST )
public ModelAndView delete(int qnano, String qna_pass) {
  ModelAndView mav = new ModelAndView();

  HashMap<String, Object> hashMap = new HashMap<String, Object>();
  hashMap.put("qnano", qnano);
  hashMap.put("qna_pass", qna_pass);
  
  int passwd_cnt = 0; // 패스워드 일치 레코드 갯수
  int cnt = 0;             // 삭제된 레코드 갯수 
  
  passwd_cnt = this.qnaProc.passwd_check(hashMap);
  
  QnaVO qnaVO = this.qnaProc.read(qnano); 
  mav.addObject("qnano", qnano);
  
  if (passwd_cnt == 1) { // 패스워드 일치
    cnt = this.qnaProc.delete(qnano);
  }

  mav.addObject("cnt", cnt); // request에 저장
  mav.addObject("passwd_cnt", passwd_cnt); // request에 저장
      
  if (passwd_cnt == 1 && cnt == 1) {
    mav.setViewName("/qna/delete_msg"); // webapp/contents/delete_msg.jsp
    // mav.setViewName("redirect:/contents/list.do"); // spring 재호출
  } else { 
    mav.setViewName("/qna/delete_msg"); // webapp/contents/delete_msg.jsp
  }
  
  return mav;
}
  
  
  
  
  
  
}
