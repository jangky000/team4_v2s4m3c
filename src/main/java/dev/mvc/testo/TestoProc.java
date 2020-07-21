package dev.mvc.testo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.testo.TestoProc")
public class TestoProc implements TestoProcInter{

  @Autowired TestoDAOInter testoDAO;
  
  @Override
  public int create(TestoVO testoVO) {
    int cnt=0;
    cnt=this.testoDAO.create(testoVO);
    return cnt;
  }

  @Override
  public List<TestoVO> list() {
    List<TestoVO> list = null;
    list=this.testoDAO.list();
        
    return list;
  }

  @Override
  public int update_seqno_up(int testono) {
    int cnt = this.testoDAO.update_seqno_up(testono);
    return cnt;
  }

  @Override
  public int update_seqno_down(int testono) {
    int cnt= this.testoDAO.update_seqno_down(testono);
    return cnt;
  }

  @Override
  public int update(TestoVO testoVO) {
    int cnt = this.testoDAO.update(testoVO);
    System.out.println("cntProc" + cnt);
    System.out.println("ProctestoVO" +testoVO.getTestqno()+testoVO.getTestono()+testoVO.getTesto_seqno()+testoVO.getTesto_content());
    return cnt;
  }

  @Override
  public TestoVO read(int testono) {
    TestoVO testoVO =null;
    testoVO = this.testoDAO.read(testono);
    return testoVO;
  }

  @Override
  public int delete(int testono) {
    int cnt=this.testoDAO.delete(testono);
    return cnt;
  }

  @Override
  public List<Testq_Testo_join> list_join() {
    List<Testq_Testo_join> list = this.testoDAO.list_join();
    return list;
  }

  @Override
  public List<TestoVO> list_by_testqno(int testqno) {
    List<TestoVO> list= this.testoDAO.list_by_testqno(testqno);
    return list;
  }
  

}
