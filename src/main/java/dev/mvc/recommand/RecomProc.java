package dev.mvc.recommand;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.recommand.RecomProc")
public class RecomProc implements RecomProcInter {
  @Autowired
  private RecomDAOInter recomDAO;
  
  @Override
  public int create(RecomVO recomVO) {
    int cnt = 0;
    cnt = this.recomDAO.create(recomVO);
    return cnt;  
  }
  
  @Override
  public List<RecomVO> list(){
    List<RecomVO> list = null;
    list = this.recomDAO.list();
    return list;
  }

  @Override
  public RecomVO read(int recomno) {
    RecomVO recomVO = null;
    recomVO = this.recomDAO.read(recomno);
    return recomVO;
  }

  @Override
  public int update(RecomVO recomVO) {
    int cnt = 0;
    cnt = this.recomDAO.update(recomVO);
    return cnt;
  }

  
  
}
