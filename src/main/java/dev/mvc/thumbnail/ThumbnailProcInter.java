package dev.mvc.thumbnail;

import java.util.List;

public interface ThumbnailProcInter {

  /**
   * 썸네일 등록
   * <insert id="create" parameterType="ThumbnailVO">
   * @param thumbnailVO
   * @return
   */
  public int create(ThumbnailVO thumbnailVO);

  /**
   * <insert id="list" parameterType="ThumbnailVO">
   * 전체 이미지 목록
   * @return
   */
  public List<ThumbnailVO> list(); 
  
  /**<delete id="delete" parameterType="int">*/

  
  

}
