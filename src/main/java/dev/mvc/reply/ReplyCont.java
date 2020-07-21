package dev.mvc.reply;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class ReplyCont {
  @Autowired
  @Qualifier("dev.mvc.reply.ReplyProc") // 이름 지정
  private ReplyProcInter replyProc;
  

  
  public ReplyCont(){
    System.out.println("--> ReplyCont created.");
  }
  
  /**
   * 댓글 등록 처리
   * @param replyVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/reply/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create(ReplyVO replyVO) {
    int count = replyProc.create(replyVO); //Call By Reference
    int replyno = replyVO.getReplyno(); //Call By Reference임으로PK 수집 가능
    System.out.println("replyno: " + replyno);
    
    JSONObject obj = new JSONObject();
    obj.put("count",count);
    obj.put("replyno",replyno); // 등록된 글의 PK 전달
    // System.out.println("등록된 replyno: " +replyno );
   
    ReplyMemberVO replyMemberVO = this.replyProc.read(replyno);
    
    // 키와 값의 구조를 자동으로 생성하기 위하여 객체는 1개이나 ArrayList를 생성함. JSON 출력을 단순화하기위한 변환
    ArrayList<ReplyMemberVO> list = new ArrayList<ReplyMemberVO>();
    list.add(replyMemberVO);
    
    obj.put("replyMemberVO", list); //키와 값으 구조가 자동으로 생성됨
    // {"replyMemberVO":[{"memberno":18,"rdate":"2020-07-10 12:52:41","passwd":"10","replyno":108,"id":"user1","content":"10","contentsno":31}]}
    System.out.println(obj.toString());
    return obj.toString();     
    
  }

  /**
   * 목록★★★★★★★★
   * http://localhost:9090/resort/reply/list_by_eventno_join.do?contentsno=31
   * @param contentsno
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/reply/list_by_eventno_join.do",
                              method = RequestMethod.GET,
                              produces = "text/plain;charset=UTF-8")
  public String list_by_eventno_join(int eventno) {
    // String msg="JSON 출력";
    // return msg;
    
    List<ReplyMemberVO> list = replyProc.list_by_eventno_join(eventno);
    
    JSONObject obj = new JSONObject();
    obj.put("list", list);
 
    return obj.toString();     
  }

  /**
   * http://localhost:9090/resort/reply/delete.do?replyno=1&passwd=1234
   * {"delete_count":0,"count":0}
   * {"delete_count":1,"count":1}
   * @param replyno
   * @param passwd
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/reply/delete.do", 
                              method = RequestMethod.POST,
                              produces = "text/plain;charset=UTF-8")
  public String delete(int replyno, String passwd) {
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("replyno", replyno);
    map.put("passwd", passwd);
    
    int count = replyProc.checkPasswd(map); // 패스워드 일치 여부, 1: 일치, 0: 불일치
    int delete_count = 0;                              // 삭제된 댓글
    if (count == 1) {
      delete_count = replyProc.delete(replyno); // 댓글 삭제
    }
    
    JSONObject obj = new JSONObject();
    obj.put("count", count); // 패스워드 일치 여부, 1: 일치, 0: 불일치
    obj.put("delete_count", delete_count); // 삭제된 댓글
    
    return obj.toString();
  }

  /**
   * 더보기 버튼 페이징 목록
   * http://localhost:9090/resort/reply/list_by_contentsno_join_add_view.do?contentsno=31&replyPage=1
   * @param contentsno 댓글 부모글 번호
   * @param replyPage 댓글 페이지
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/reply/list_by_eventno_join_add_view.do",
                              method = RequestMethod.GET,
                              produces = "text/plain;charset=UTF-8")
  public String list_by_eventno_join(int eventno, int replyPage) {
//    System.out.println("contentsno: " + contentsno);
//    System.out.println("replyPage: " + replyPage);
    
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("eventno", eventno); 
    map.put("replyPage", replyPage);    
    
    List<ReplyMemberVO> list = replyProc.list_by_eventno_join_add_view(map);
    
    JSONObject obj = new JSONObject();
    obj.put("list", list);
 
    return obj.toString();     
  }
  
  /**
   * 조회
   * http://localhost:9090/resort/reply/read.do?replyno=108 
   * @param replyVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/reply/read.do",
                            method = RequestMethod.GET,
                            produces = "text/plain;charset=UTF-8")
  public String read(int replyno) {
    System.out.println("replyno: " + replyno);
  
    ReplyMemberVO replyMemberVO = this.replyProc.read(replyno);
    
    // JSON 출력을 단순화하기위한 변환
    ArrayList<ReplyMemberVO> list = new ArrayList<ReplyMemberVO>();
    list.add(replyMemberVO);
    
    JSONObject obj = new JSONObject();
    obj.put("replyMemberVO", list);
    // {"replyMemberVO":[{"memberno":18,"rdate":"2020-07-10 12:52:41","passwd":"10","replyno":108,"id":"user1","content":"10","contentsno":31}]}
    return obj.toString();     
  }
}


