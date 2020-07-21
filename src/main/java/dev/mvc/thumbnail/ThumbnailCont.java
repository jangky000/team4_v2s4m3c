package dev.mvc.thumbnail;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;


@Controller
public class ThumbnailCont {
  @Autowired
  @Qualifier("dev.mvc.thumbnail.ThumbnailProc")
  private ThumbnailProcInter thumbnailProc;
  
  /**
   * 사진등록 C
   * @param itemno
   * @return
   */
  @RequestMapping(value="/thumbnail/create.do", method=RequestMethod.GET )
  public ModelAndView create(int itemno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/thumbnail/create"); // webapp/attachfile/create.jsp
    
    return mav;
  }
  
  /**
   * 사진등록 C 처리
   * @param request
   * @param thumbnailVO
   * @return
   */
  @RequestMapping(value = "/thumbnail/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request,
                                           ThumbnailVO thumbnailVO) {
    
    ModelAndView mav = new ModelAndView();
    // -----------------------------------------------------
    // 파일 전송 코드 시작
    // -----------------------------------------------------
    int itemno = thumbnailVO.getItemno();
    String fname = ""; // 원본 파일명
    String fupname = ""; // 업로드된 파일명
    long fsize = 0;  // 파일 사이즈
    String thumb = ""; // Preview 이미지
    int upload_count = 0; // 정상처리된 레코드 갯수
    
    String upDir = Tool.getRealPath(request, "/thumbnail/storage"); // 절대 경로
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    List<MultipartFile> fnamesMF = thumbnailVO.getFnamesMF();  // 파일 목록
    int count = fnamesMF.size(); // 전송 파일 갯수
    if (count > 0) { // 전송할 파일이 있다면
      for (MultipartFile multipartFile:fnamesMF) { // 파일 추출
        fsize = multipartFile.getSize();  // 파일 크기
        if (fsize > 0) { // 파일 크기 체크
          fname = multipartFile.getOriginalFilename(); // 원본 파일명, spring.jpg
          // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
          fupname = Upload.saveFileSpring(multipartFile, upDir); 
          
          if (Tool.isImage(fname)) { // 이미지인지 검사
            // thumb 이미지 생성후 파일명 리턴됨, width: 120, height: 80
            thumb = Tool.preview(upDir, fupname, 120, 80); 
          }
        }
        ThumbnailVO vo = new ThumbnailVO();
        vo.setItemno(itemno);
        vo.setFname(fname);
        vo.setFupname(fupname);
        vo.setThumb(thumb);
        vo.setFsize(fsize);
        
        upload_count = upload_count + thumbnailProc.create(vo); // 파일 1건 등록 정도 dbms 저장
      }
    }    
    // -----------------------------------------------------
    // 파일 전송 코드 종료
    // -----------------------------------------------------

    mav.addObject("upload_count", upload_count);
    // mav.addObject("cateno", cateno);
    mav.addObject("itemno", thumbnailVO.getItemno());
    
    // mav.setViewName("/thumbnail/create_msg"); // /attachfile/create_msg.jsp
    mav.setViewName("redirect:/thumbnail/create_msg.jsp");
    return mav;
  }
  
  /**
   * 목록 List
   * http://localhost:9090/team4/thumbnail/list.do
   * 
   * @return
   */
  @RequestMapping(value = "/thumbnail/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();

    List<ThumbnailVO> list = thumbnailProc.list();
    mav.addObject("list", list);

    mav.setViewName("/thumbnail/list");

    return mav;
  }
  
  
  
  

}
