package dev.mvc.note;

import java.util.HashMap;
import java.util.List;


public interface NoteDAOInter {

  /**
   * 등록
   * @param noteVO
   * @return
   */
  public int create(NoteVO noteVO);
  
  /**
   * 전체목록
   * @return
   */
  public List<NoteVO>list_all();
  
  
  /**
   * 조회
   * @param noteno
   * @return
   */
  public NoteVO read(int noteno);
  
  
  /**
   * 수정 처리
   * @param noteVO
   * @return
   */
  public int update(NoteVO noteVO);
  
  /**
   * 삭제처리
   * @param noteno
   * @return
   */
  public int delete(int noteno);
  
  /**
   * 패스워드 검사
   * @param hashMap
   * @return
   */
  public int passwd_check(HashMap hashMap);
  
}
