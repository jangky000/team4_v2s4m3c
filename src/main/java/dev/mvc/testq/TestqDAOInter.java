package dev.mvc.testq;

import java.util.HashMap;
import java.util.List;

import dev.mvc.event.EventVO;

public interface TestqDAOInter {
  /**
   * 등록
   * <xmp>
   *   <insert id="create" parameterType="TestqVO">
   * </xmp>
   * @param testqVO
   * @return
   */
  public int create(TestqVO testqVO);
  
  /**
   * 카테고리별 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * <xmp>
   * 페이징 목록
   *  <select id="list_paging" resultType="TestqVO" parameterType="HashMap">
   * </xmp>
   * @param map
   * @return
   */
  public List<TestqVO> list_paging(HashMap<String, Object> map);
  
    /**
     * 조회
     * <xmp>
     *   <select id="read" resultType="TestqVO" parameterType="int">
     * </xmp>
     * @param testqno
     * @return
     */
  public TestqVO read(int testqno);
  

  /**
   * 수정
   * <xmp>
   *   <update id="update" parameterType="TestqVO">
   * </xmp>
   * @param testqVO
   * @return
   */
  public int update(TestqVO testqVO);

  /**
   * 삭제
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp>
   * @param testqno
   * @return
   */
  public int delete(int testqno);
  
  /**
   * <xmp>
   *   이미지 등록, 수정, 삭제
      <update id="jpg" parameterType="HashMap">
   * </xmp> 
   * @param hashMap
   * @return
   */
  public int jpg(HashMap<Object, Object> hashMap);
  
}
