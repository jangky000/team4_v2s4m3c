package dev.mvc.note;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;





@Component("dev.mvc.note.NoteProc")
public class NoteProc implements NoteProcInter{
  @Autowired
  private NoteDAOInter noteDAO;
  
  
  @Override
  public int create(NoteVO noteVO) {
    int cnt = this.noteDAO.create(noteVO);
    return cnt;
  }

  @Override
  public List<NoteVO> list_all() {
    List<NoteVO>list = this.noteDAO.list_all();
    return list;
  }

  @Override
  public NoteVO read(int noteno) {
    NoteVO noteVO =this.noteDAO.read(noteno);
    
    String title = noteVO.getNote_title();
    noteVO.setNote_title(title);
    
    return noteVO;
  }

  @Override
  public NoteVO update(int noteno) {
    NoteVO noteVO = this.noteDAO.read(noteno);
    return noteVO;
  }
  
  @Override
  public int update(NoteVO noteVO) {
    int cnt = this.noteDAO.update(noteVO);
    return cnt;
  }

  @Override
  public int delete(int noteno) {
    int cnt = this.noteDAO.delete(noteno);
    return cnt;
  }

  @Override
  public int passwd_check(HashMap hashMap) {
    int passwd_cnt = 0;
    passwd_cnt = this.noteDAO.passwd_check(hashMap);
    return passwd_cnt;
  }

  
  
  
  
  
  
  
}