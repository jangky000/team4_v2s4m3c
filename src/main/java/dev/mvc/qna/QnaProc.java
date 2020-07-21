package dev.mvc.qna;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component("dev.mvc.qna.QnaProc")
public class QnaProc implements QnaProcInter{
  @Autowired
  private QnaDAOInter qnaDAO;

  
  
  @Override
  public int create(QnaVO qnaVO) {
    int cnt = this.qnaDAO.create(qnaVO);
    return cnt;
  }


  @Override
  public List<QnaVO> list_all() {
    List<QnaVO> list = this.qnaDAO.list_all();
    return list;
  }


  @Override
  public QnaVO read(int qnano) {
    QnaVO qnaVO = this.qnaDAO.read(qnano);
    
    return qnaVO;
  }


  @Override
  public int update(QnaVO qnaVO) {
    int cnt = this.qnaDAO.update(qnaVO);
    return cnt;
  }


  @Override
  public int passwd_check(HashMap hashMap) {
    int cnt = this.qnaDAO.passwd_check(hashMap);
    return cnt;
  }


  @Override
  public int delete(int qnano) {
    int cnt = this.qnaDAO.delete(qnano);
    return cnt;
  }

  
  
 
  
  
  
  
  
  
  
  
  
}