package dev.mvc.note;

import java.util.HashMap;
import java.util.List;


public interface NoteDAOInter {

  /**
   * ���
   * @param noteVO
   * @return
   */
  public int create(NoteVO noteVO);
  
  /**
   * ��ü���
   * @return
   */
  public List<NoteVO>list_all();
  
  
  /**
   * ��ȸ
   * @param noteno
   * @return
   */
  public NoteVO read(int noteno);
  
  
  /**
   * ���� ó��
   * @param noteVO
   * @return
   */
  public int update(NoteVO noteVO);
  
  /**
   * ����ó��
   * @param noteno
   * @return
   */
  public int delete(int noteno);
  
  /**
   * �н����� �˻�
   * @param hashMap
   * @return
   */
  public int passwd_check(HashMap hashMap);
  
}
