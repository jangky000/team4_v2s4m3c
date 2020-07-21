package dev.mvc.qna;

import java.util.HashMap;
import java.util.List;


public interface QnaProcInter {

 
  /**
   * 등록
   * @param qnaVO
   * @return
   */
 public int create(QnaVO qnaVO);

 /**
  * 목록
  * @return
  */
 public List<QnaVO>list_all();

 /**
  * 조회
  * @param qnano
  * @return
  */
public QnaVO read(int qnano);
 
/**
 * 수정이
 *  @param qnaVO
 * @return
 */
public int update(QnaVO qnaVO);

/**
 * 비밀번호 검사?
 * @param hashMap
 * @return
 */
public int passwd_check(HashMap hashMap);

/**
 * 삭제
 * @param qnano
 * @return
 */
public int delete(int qnano);
 

}
