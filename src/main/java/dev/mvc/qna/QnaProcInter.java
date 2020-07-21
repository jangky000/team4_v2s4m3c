package dev.mvc.qna;

import java.util.HashMap;
import java.util.List;


public interface QnaProcInter {

 
  /**
   * ���
   * @param qnaVO
   * @return
   */
 public int create(QnaVO qnaVO);

 /**
  * ���
  * @return
  */
 public List<QnaVO>list_all();

 /**
  * ��ȸ
  * @param qnano
  * @return
  */
public QnaVO read(int qnano);
 
/**
 * ������
 *  @param qnaVO
 * @return
 */
public int update(QnaVO qnaVO);

/**
 * ��й�ȣ �˻�?
 * @param hashMap
 * @return
 */
public int passwd_check(HashMap hashMap);

/**
 * ����
 * @param qnano
 * @return
 */
public int delete(int qnano);
 

}
