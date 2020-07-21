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
   * ������� C
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
   * ������� C ó��
   * @param request
   * @param thumbnailVO
   * @return
   */
  @RequestMapping(value = "/thumbnail/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request,
                                           ThumbnailVO thumbnailVO) {
    
    ModelAndView mav = new ModelAndView();
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    int itemno = thumbnailVO.getItemno();
    String fname = ""; // ���� ���ϸ�
    String fupname = ""; // ���ε�� ���ϸ�
    long fsize = 0;  // ���� ������
    String thumb = ""; // Preview �̹���
    int upload_count = 0; // ����ó���� ���ڵ� ����
    
    String upDir = Tool.getRealPath(request, "/thumbnail/storage"); // ���� ���
    // ���� ������ ����� fnamesMF ��ü�� ������.
    List<MultipartFile> fnamesMF = thumbnailVO.getFnamesMF();  // ���� ���
    int count = fnamesMF.size(); // ���� ���� ����
    if (count > 0) { // ������ ������ �ִٸ�
      for (MultipartFile multipartFile:fnamesMF) { // ���� ����
        fsize = multipartFile.getSize();  // ���� ũ��
        if (fsize > 0) { // ���� ũ�� üũ
          fname = multipartFile.getOriginalFilename(); // ���� ���ϸ�, spring.jpg
          // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�, spring.jsp, spring_1.jpg...
          fupname = Upload.saveFileSpring(multipartFile, upDir); 
          
          if (Tool.isImage(fname)) { // �̹������� �˻�
            // thumb �̹��� ������ ���ϸ� ���ϵ�, width: 120, height: 80
            thumb = Tool.preview(upDir, fupname, 120, 80); 
          }
        }
        ThumbnailVO vo = new ThumbnailVO();
        vo.setItemno(itemno);
        vo.setFname(fname);
        vo.setFupname(fupname);
        vo.setThumb(thumb);
        vo.setFsize(fsize);
        
        upload_count = upload_count + thumbnailProc.create(vo); // ���� 1�� ��� ���� dbms ����
      }
    }    
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------

    mav.addObject("upload_count", upload_count);
    // mav.addObject("cateno", cateno);
    mav.addObject("itemno", thumbnailVO.getItemno());
    
    // mav.setViewName("/thumbnail/create_msg"); // /attachfile/create_msg.jsp
    mav.setViewName("redirect:/thumbnail/create_msg.jsp");
    return mav;
  }
  
  /**
   * ��� List
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
