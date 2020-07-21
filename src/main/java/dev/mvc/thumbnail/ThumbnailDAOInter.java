package dev.mvc.thumbnail;

import java.util.List;

public interface ThumbnailDAOInter {
  
  /**
   * ����� ���
   * <insert id="create" parameterType="ThumbnailVO">
   * @param thumbnailVO
   * @return
   */
  public int create(ThumbnailVO thumbnailVO);
  
  /**
   * <insert id="list" parameterType="ThumbnailVO">
   * ��ü �̹��� ���
   * @return
   */
  public List<ThumbnailVO> list(); 
  


}
