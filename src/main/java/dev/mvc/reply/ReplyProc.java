package dev.mvc.reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


import dev.mvc.tool.Tool;

@Component("dev.mvc.reply.ReplyProc")
public class ReplyProc implements ReplyProcInter {
  @Autowired
  private ReplyDAOInter replyDAO; 
  
  @Override
  public int create(ReplyVO replyVO) {
    int count = replyDAO.create(replyVO);
    return count;
  }

  @Override
  public List<ReplyVO> list() {
    List<ReplyVO> list = replyDAO.list();
    return list;
  }

  @Override
  public List<ReplyVO> list_by_eventno(int eventno) {
    List<ReplyVO> list = replyDAO.list_by_eventno(eventno);
    String content = "";
    
    // Ư�� ���� ����
    for (ReplyVO replyVO:list) {
      content = replyVO.getContent();
      content = Tool.convertChar(content);
      replyVO.setContent(content);
    }
    return list;
  }

  @Override
  public List<ReplyMemberVO> list_by_eventno_join(int eventno) {
    List<ReplyMemberVO> list = replyDAO.list_by_eventno_join(eventno);
    String content = "";
    
    // Ư�� ���� ����
    for (ReplyMemberVO replyMemberVO:list) {
      content = replyMemberVO.getContent();
      content = Tool.convertChar(content);
      replyMemberVO.setContent(content);
    }
    return list;
  }

  @Override
  public int checkPasswd(Map<String, Object> map) {
    int count = replyDAO.checkPasswd(map);
    return count;
  }

  @Override
  public int delete(int replyno) {
    int count = replyDAO.delete(replyno);
    return count;
  }

  @Override
  public List<ReplyMemberVO> list_by_eventno_join_add_view(HashMap<String, Object> map) {
    int record_per_page = 2; // ���������� 2��
    
    // replyPage�� 1���� ����
    int beginOfPage = ((Integer)map.get("replyPage") - 1) * record_per_page; // ���������� 2��

    int startNum = beginOfPage + 1; 
    int endNum = beginOfPage + record_per_page;  // ���������� 2��
    /*
    1 ������: WHERE r >= 1 AND r <= 2
    2 ������: WHERE r >= 3 AND r <= 4
    3 ������: WHERE r >= 5 AND r <= 6
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
    
    List<ReplyMemberVO> list = replyDAO.list_by_eventno_join_add_view(map);
    String content = "";
    
    // Ư�� ���� ����
    for (ReplyMemberVO replyMemberVO:list) {
      content = replyMemberVO.getContent();
      content = Tool.convertChar(content);
      replyMemberVO.setContent(content);
    }
    return list;
  }

  @Override
  public ReplyMemberVO read(int replyno) {
    ReplyMemberVO replyMemberVO = replyDAO.read(replyno);
    return replyMemberVO;
  }
  
  
}





