package dev.mvc.note;

import java.util.HashMap;
import java.util.List;

public interface NoteProcInter {

  /**
   * 등록
   * @param cateVO
   * @return
   */
  public int create(NoteVO noteVO);
  
  /**
   * 목록
   */
  public List<NoteVO>list_all();
  
  /**
   * 조회
   * @param noteno
   * @return
   */
  public NoteVO read(int noteno);
  
  /**
   * 수정 폼
   * @param noteno
   * @return
   */
  public NoteVO update(int noteno);
  
  /**
   * 수정 처리
   * @param noteVO
   * @return
   */
  public int update(NoteVO noteVO);
  
  
  /**
   * 패스워드 검사
   * @param hashMap
   * @return
   */
  public int passwd_check(HashMap hashMap);

  /**
   * 삭제처리
   * @param noteno
   * @return
   */
  public int delete(int noteno);

  
}
