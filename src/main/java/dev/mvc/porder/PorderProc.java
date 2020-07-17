package dev.mvc.porder;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.porder.PorderProc")
public class PorderProc implements PorderProcInter{
  
  @Autowired
  private PorderDAOInter porderDAO;

  public PorderProc(){
    System.out.println("--> PorderProc created.");
  }

  @Override
  public int create(PorderVO porderVO) {
    int cnt = this.porderDAO.create(porderVO);
    return cnt;
  }

  @Override
  public List<PorderVO> list() {
    List<PorderVO> list = this.porderDAO.list();
    return list;
  }

  @Override
  public PorderVO read(int porderno) {
    PorderVO porderVO = this.porderDAO.read(porderno);
    return porderVO;
  }

  @Override
  public int update(PorderVO porderVO) {
    int cnt = this.porderDAO.update(porderVO);
    return cnt;
  }

  @Override
  public int delete(int porderno) {
    int cnt = this.porderDAO.delete(porderno);
    return cnt;
  }

  @Override
  public List<Porder_detail_itemVO> list_join_porder_detail_item(int memno) {
    List<Porder_detail_itemVO> list = this.porderDAO.list_join_porder_detail_item(memno);
    return list;
  }

}
