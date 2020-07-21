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
   * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
   * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
   *
   * @param listFile ��� ���ϸ� 
   * @param categrpno ī�װ���ȣ 
   * @param search_count �˻�(��ü) ���ڵ�� 
   * @param nowPage     ���� ������
   * @param word �˻���
   * @return ����¡ ���� ���ڿ�
   */ 
  
  @Override
  public String pagingBox(String listFile, int eventno, int search_count, int nowPage){ 
    int totalPage = (int)(Math.ceil((double)search_count/Event_p.RECORD_PER_PAGE)); // ��ü ������  Contents.RECORD_PER_PAGE <<������( contents.java���� ������ �� �ٲٸ� ���⼭ �ٷ� �ٲ�. 
    int totalGrp = (int)(Math.ceil((double)totalPage/Event_p.PAGE_PER_BLOCK));// ��ü �׷� 
    int nowGrp = (int)(Math.ceil((double)nowPage/Event_p.PAGE_PER_BLOCK));    // ���� �׷� 
    int startPage = ((nowGrp - 1) * Event_p.PAGE_PER_BLOCK) + 1; // Ư�� �׷��� ������ ��� ����  
    int endPage = (nowGrp * Event_p.PAGE_PER_BLOCK);             // Ư�� �׷��� ������ ��� ����   
     
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
    str.append("    padding:1px 6px 1px 6px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("    margin:1px 2px 1px 2px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("  }"); 
    str.append("  .span_box_2{"); 
    str.append("    text-align: center;");    
    str.append("    background-color: none;"); 
    str.append("    color:  #3870ff;"); 
    str.append("    font-size: 13px;"); 
    str.append("    border: 0px;"); 
    str.append("    border-style: ;"); 
    str.append("    border-color: none;"); 
    str.append("    padding:1px 6px 1px 6px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("    margin:1px 2px 1px 2px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("  }"); 
    str.append("</style>"); 
    str.append("<DIV id='paging'>"); 
//    str.append("���� ������: " + nowPage + " / " + totalPage + "  "); 
 
    // ���� 10�� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page),  
    // nowGrp: 2 (11 ~ 20 page),  
    // nowGrp: 3 (21 ~ 30 page) 
    // ���� 2�׷��� ���: (2 - 1) * 10 = 1�׷��� ������ ������10
    // ���� 3�׷��� ���: (3 - 1) * 10 = 2�׷��� ������ ������20
    int _nowPage = (nowGrp-1) * Event_p.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?nowPage="+_nowPage+"'>����</A></span>"); 
    } 
    
    //�߾� ������ ���
 
    for(int i=startPage; i<=endPage; i++){ 
      if (i > totalPage){ //������ �������� �Ѿ�ٸ�, ������ ��� ����
        break; 
      } 
  
      if (nowPage == i){ //�������� ���� �������� ���ٸ� CSS�� ���� (������ ��)
        str.append("<span class='span_box_2'>"+i+"</span>"); // ���� ������, ���� 
      }else{
        // ���� �������� �ƴ� �������� �̵��� �����ϵ��� ��ũ�� �����Ѵ�.
        str.append("<span class='span_box_1'><A href='"+listFile+"?nowPage="+i+"'>"+i+"</A></span>");   
      } 
    } 
 
    // 10�� ���� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // ���� 1�׷��� ���: (1 * 10) + 1 = 2�׷��� ����������11
    // ���� 2�׷��� ���: (2 * 10) + 1 = 3�׷��� ����������21
    _nowPage = (nowGrp * Event_p.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?nowPage="+_nowPage+"'>����</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }
  
  
  @Override
  public List<EventVO> list_paging(HashMap<String, Object> map) {
    /* 
    ���������� ����� ���� ���ڵ� ��ȣ ��� ���ذ�, nowPage�� 1���� ����
    1 ������: nowPage = 1, (1 - 1) * 10 --> 0 
    2 ������: nowPage = 2, (2 - 1) * 10 --> 10
    3 ������: nowPage = 3, (3 - 1) * 10 --> 20
    */
    int beginOfPage = ((Integer)map.get("nowPage") - 1) * Event_p.RECORD_PER_PAGE;
   
    // ���� rownum, 
    // 1 ������: 0+1    >>1
    // 2 ������: 10+1  >>11
    // 3 ������: 20+1  >>21
    int startNum = beginOfPage + 1; 
    //  ���� rownum, 
    //  1 ������: 0+10 
    //  2 ������: 0+20 
    //  3 ������: 0+30
    int endNum = beginOfPage + Event_p.RECORD_PER_PAGE;   
    /*
    1 ������: WHERE r >= 1 AND r <= 10
    2 ������: WHERE r >= 11 AND r <= 20
    3 ������: WHERE r >= 21 AND r <= 30
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
   
    List<EventVO> list = eventDAO.list_paging(map);
    
 // --------------------------------------------------------------
    // ����, ���� ���ڼ� ����
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
