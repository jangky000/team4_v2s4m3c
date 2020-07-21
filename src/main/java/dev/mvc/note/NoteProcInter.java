package dev.mvc.note;

import java.util.HashMap;
import java.util.List;

public interface NoteProcInter {

  /**
   * ���
   * @param cateVO
   * @return
   */
  public int create(NoteVO noteVO);
  
  /**
   * ���
   */
  public List<NoteVO>list_all();
  
  /**
   * ��ȸ
   * @param noteno
   * @return
   */
  public NoteVO read(int noteno);
  
  /**
   * ���� ��
   * @param noteno
   * @return
   */
  public NoteVO update(int noteno);
  
  /**
   * ���� ó��
   * @param noteVO
   * @return
   */
  public int update(NoteVO noteVO);
  
  
  /**
   * �н����� �˻�
   * @param hashMap
   * @return
   */
  public int passwd_check(HashMap hashMap);

  /**
   * ����ó��
   * @param noteno
   * @return
   */
  public int delete(int noteno);

  
}
