package dev.mvc.thumbnail;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component("dev.mvc.thumbnail.ThumbnailProc")
public class ThumbnailProc implements ThumbnailProcInter{
  @Autowired
  private ThumbnailDAOInter thumbnailDAO;
  
  public ThumbnailProc() {   
  }
  
  @Override
  public int create(ThumbnailVO thumbnailVO) {
    int cnt = 0;
    cnt = this.thumbnailDAO.create(thumbnailVO);
    return cnt;
  }
  @Override
  public List<ThumbnailVO> list() {
    List<ThumbnailVO> list = null;
    list = this.thumbnailDAO.list();
    return list;
  }
  
  
  

}
