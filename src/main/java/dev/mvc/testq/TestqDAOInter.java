package dev.mvc.testq;

import java.util.HashMap;
import java.util.List;

import dev.mvc.event.EventVO;

public interface TestqDAOInter {
  /**
   * ���
   * <xmp>
   *   <insert id="create" parameterType="TestqVO">
   * </xmp>
   * @param testqVO
   * @return
   */
  public int create(TestqVO testqVO);
  
  /**
   * ī�װ��� �˻� ���ڵ� ����
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * <xmp>
   * ����¡ ���
   *  <select id="list_paging" resultType="TestqVO" parameterType="HashMap">
   * </xmp>
   * @param map
   * @return
   */
  public List<TestqVO> list_paging(HashMap<String, Object> map);
  
    /**
     * ��ȸ
     * <xmp>
     *   <select id="read" resultType="TestqVO" parameterType="int">
     * </xmp>
     * @param testqno
     * @return
     */
  public TestqVO read(int testqno);
  

  /**
   * ����
   * <xmp>
   *   <update id="update" parameterType="TestqVO">
   * </xmp>
   * @param testqVO
   * @return
   */
  public int update(TestqVO testqVO);

  /**
   * ����
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp>
   * @param testqno
   * @return
   */
  public int delete(int testqno);
  
  /**
   * <xmp>
   *   �̹��� ���, ����, ����
      <update id="jpg" parameterType="HashMap">
   * </xmp> 
   * @param hashMap
   * @return
   */
  public int jpg(HashMap<Object, Object> hashMap);
  
}
