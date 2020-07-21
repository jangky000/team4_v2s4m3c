package dev.mvc.reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface ReplyDAOInter {
  /**
   * ��� ���
   * @param replyVO
   * @return
   */
  public int create(ReplyVO replyVO);
  
  public List<ReplyVO> list();
  
  public List<ReplyVO> list_by_eventno(int eventno);
  
  public List<ReplyMemberVO> list_by_eventno_join(int eventno);
  
  public int checkPasswd(Map<String, Object> map);

  public int delete(int replyno);
  
  /**
   * ������ ��ư
   * @param map
   * @return
   */
  public List<ReplyMemberVO> list_by_eventno_join_add_view(HashMap<String, Object> map);

  /**
   * ��ȸ
   * @param replyno
   * @return
   */
  public ReplyMemberVO read(int replyno);
  
}






