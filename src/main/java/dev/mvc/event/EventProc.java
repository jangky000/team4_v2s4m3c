package dev.mvc.event;

import java.awt.Event;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


import dev.mvc.tool.Tool;


@Component("dev.mvc.event.EventProc")
public class EventProc implements EventProcInter{

  @Autowired
  private EventDAOInter eventDAO;
  
  @Override
  public int create(EventVO eventVO) {
    int cnt=this.eventDAO.create(eventVO);
    return cnt;
  }

  @Override
  public int search_count(HashMap<String, Object> hashMap) {
    int count = eventDAO.search_count(hashMap);
    return count;
  }
  
  @Override
  public List<EventVO> list() {
    List<EventVO> list = null;
    list= this.eventDAO.list();
    return list;
  }

  /** 
   * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
   * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
   *
   * @param listFile 목록 파일명 
   * @param categrpno 카테고리번호 
   * @param search_count 검색(전체) 레코드수 
   * @param nowPage     현재 페이지
   * @param word 검색어
   * @return 페이징 생성 문자열
   */ 
  
  @Override
  public String pagingBox(String listFile, int eventno, int search_count, int nowPage){ 
    int totalPage = (int)(Math.ceil((double)search_count/Event_p.RECORD_PER_PAGE)); // 전체 페이지  Contents.RECORD_PER_PAGE <<상수사용( contents.java에서 페이지 수 바꾸면 여기서 바로 바뀜. 
    int totalGrp = (int)(Math.ceil((double)totalPage/Event_p.PAGE_PER_BLOCK));// 전체 그룹 
    int nowGrp = (int)(Math.ceil((double)nowPage/Event_p.PAGE_PER_BLOCK));    // 현재 그룹 
    int startPage = ((nowGrp - 1) * Event_p.PAGE_PER_BLOCK) + 1; // 특정 그룹의 페이지 목록 시작  
    int endPage = (nowGrp * Event_p.PAGE_PER_BLOCK);             // 특정 그룹의 페이지 목록 종료   
     
    StringBuffer str = new StringBuffer(); 
     
    str.append("<style type='text/css'>"); 
    str.append("  #paging {text-align: center; margin-top: 2px; font-size: 13px;}"); 
    str.append("  #paging A:link {text-decoration:none; color:#555555; font-size: 13px;}"); 
    str.append("  #paging A:hover{ background-color: #3870ff; color:#555555; font-size: 13px;}"); 
    str.append("  #paging A:visited {text-decoration:none; color:black; font-size: 13px;}"); 
    str.append("  .span_box_1{"); 
    str.append("    text-align: center;");    
    str.append("    font-size: 13px;"); 
    str.append("    border: 0px;"); 
    str.append("    border-style: ;"); 
    str.append("    border-color: none;"); 
    str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("  }"); 
    str.append("  .span_box_2{"); 
    str.append("    text-align: center;");    
    str.append("    background-color: none;"); 
    str.append("    color:  #3870ff;"); 
    str.append("    font-size: 13px;"); 
    str.append("    border: 0px;"); 
    str.append("    border-style: ;"); 
    str.append("    border-color: none;"); 
    str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("  }"); 
    str.append("</style>"); 
    str.append("<DIV id='paging'>"); 
//    str.append("현재 페이지: " + nowPage + " / " + totalPage + "  "); 
 
    // 이전 10개 페이지로 이동
    // nowGrp: 1 (1 ~ 10 page),  
    // nowGrp: 2 (11 ~ 20 page),  
    // nowGrp: 3 (21 ~ 30 page) 
    // 현재 2그룹일 경우: (2 - 1) * 10 = 1그룹의 마지막 페이지10
    // 현재 3그룹일 경우: (3 - 1) * 10 = 2그룹의 마지막 페이지20
    int _nowPage = (nowGrp-1) * Event_p.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?nowPage="+_nowPage+"'>이전</A></span>"); 
    } 
    
    //중앙 페이지 목록
 
    for(int i=startPage; i<=endPage; i++){ 
      if (i > totalPage){ //마지막 페이지를 넘어갔다면, 페이지 출력 종료
        break; 
      } 
  
      if (nowPage == i){ //페이지가 현재 페이지와 같다면 CSS를 강조 (차별을 둠)
        str.append("<span class='span_box_2'>"+i+"</span>"); // 현재 페이지, 강조 
      }else{
        // 현재 페이지가 아닌 페이지는 이동이 가능하도록 링크를 설정한다.
        str.append("<span class='span_box_1'><A href='"+listFile+"?nowPage="+i+"'>"+i+"</A></span>");   
      } 
    } 
 
    // 10개 다음 페이지로 이동
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // 현재 1그룹일 경우: (1 * 10) + 1 = 2그룹의 시작페이지11
    // 현재 2그룹일 경우: (2 * 10) + 1 = 3그룹의 시작페이지21
    _nowPage = (nowGrp * Event_p.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?nowPage="+_nowPage+"'>다음</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }
  
  
  @Override
  public List<EventVO> list_paging(HashMap<String, Object> map) {
    /* 
    페이지에서 출력할 시작 레코드 번호 계산 기준값, nowPage는 1부터 시작
    1 페이지: nowPage = 1, (1 - 1) * 10 --> 0 
    2 페이지: nowPage = 2, (2 - 1) * 10 --> 10
    3 페이지: nowPage = 3, (3 - 1) * 10 --> 20
    */
    int beginOfPage = ((Integer)map.get("nowPage") - 1) * Event_p.RECORD_PER_PAGE;
   
    // 시작 rownum, 
    // 1 페이지: 0+1    >>1
    // 2 페이지: 10+1  >>11
    // 3 페이지: 20+1  >>21
    int startNum = beginOfPage + 1; 
    //  종료 rownum, 
    //  1 페이지: 0+10 
    //  2 페이지: 0+20 
    //  3 페이지: 0+30
    int endNum = beginOfPage + Event_p.RECORD_PER_PAGE;   
    /*
    1 페이지: WHERE r >= 1 AND r <= 10
    2 페이지: WHERE r >= 11 AND r <= 20
    3 페이지: WHERE r >= 21 AND r <= 30
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
   
    List<EventVO> list = eventDAO.list_paging(map);
    
 // --------------------------------------------------------------
    // 제목, 내용 글자수 조정
    // --------------------------------------------------------------
    String event_title = "";
    String event_content = "";
    for (EventVO eventVO: list) {
      event_title = eventVO.getEvent_title();
      if (event_title.length() >= 14) {
        event_title = Tool.textLength(event_title, 14);
        eventVO.setEvent_title(event_title);
      }
      event_content = eventVO.getEvent_content();
      if (event_content.length() >= 100) {
        event_content = Tool.textLength(event_content, 100);
        eventVO.setEvent_content(event_content);
      }
    }
    // --------------------------------------------------------------    
    return list;
  }

  @Override
  public EventVO read(int eventno) {
    EventVO eventVO=this.eventDAO.read(eventno);
    return eventVO;
  }



  @Override
  public int passwd_check(HashMap hashMap) {
    int passwd_cnt = 0;
    passwd_cnt = this.eventDAO.passwd_check(hashMap);
    return passwd_cnt;
  }



  @Override
  public int delete(int eventno) {
    int cnt=0;
    cnt=this.eventDAO.delete(eventno);
    return cnt;
  }

  @Override
  public int jpg(HashMap<Object, Object> hashMap) {
    int cnt=0;
    cnt= this.eventDAO.jpg(hashMap);
    return cnt;
  }

  @Override
  public int update(EventVO eventVO) {
    int cnt=0;
    cnt=this.eventDAO.update(eventVO);
    return cnt;
  }
  






}
